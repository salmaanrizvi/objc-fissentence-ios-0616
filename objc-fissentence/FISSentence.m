//
//  FISSentence.m
//  objc-fissentence
//
//  Created by Salmaan Rizvi on 6/10/16.
//  Copyright © 2016 The Flatiron School. All rights reserved.
//

#import "FISSentence.h"

@interface FISSentence ()

@property (strong, nonatomic, readwrite) NSString *sentence;

@end

@implementation FISSentence

-(void) addWord:(NSString *)word {
    
    if ([self validWord:word]) {
        [self.words addObject:word];
    }
    [self assembleSentence];
}

-(void) addWords:(NSArray *)words withPunctuation:(NSString *)punctuation {
    
    if(![self validPunctuation:punctuation] || [words isEqualToArray:@[]] || words == nil) {
        return;
    }
    else {
        for (NSString *word in words) {
            [self addWord:word];
        }
        self.punctuation = punctuation;
    }
    [self assembleSentence];
        
}

-(void) removeWordAtIndex:(NSUInteger)index {
    if([self validIndex:index]) {
        [self.words removeObjectAtIndex:index];
    }
    [self assembleSentence];
}

-(void) insertWord:(NSString *)word atIndex:(NSUInteger)index {
  
    if([self validWord:word] && [self validIndex:index]) {
        [self.words insertObject:word atIndex:index];
    }
    [self assembleSentence];
}

-(void) replacePunctuationWithPunctuation:(NSString *)punctuation {
    if ([self validPunctuation:punctuation]) {
        self.punctuation = punctuation;
    }
    [self assembleSentence];
}

-(void) replaceWordAtIndex:(NSUInteger)index withWord:(NSString *)word {
    if ([self validWord:word] && [self validIndex:index]) {
        [self.words replaceObjectAtIndex:index withObject:word];
    }
    [self assembleSentence];
}

-(void) assembleSentence {
    self.sentence = [self.words componentsJoinedByString:@" "];
    self.sentence = [self.sentence stringByAppendingString:self.punctuation];
}

-(BOOL) validWord:(NSString *)word {
    if (word == nil || [word isEqualToString:@" "] || [word isEqualToString:@""]) {
        return NO;
    }
    else {
        return YES;
    }
}

-(BOOL) validPunctuation:(NSString *)punctuation {
    NSString *validPunctuation = @".?!,;:-";
    if(punctuation == nil || ![validPunctuation containsString:punctuation]) {
        return NO;
    }
    else {
        return YES;
    }
}

-(BOOL) validIndex:(NSUInteger)index {
    if(index >= self.words.count) {
        return NO;
    }
    else {
        return YES;
    }
}

@end
