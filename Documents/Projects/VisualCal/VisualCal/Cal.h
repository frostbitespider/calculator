//
//  Cal.h
//  OCCal
//
//  Created by frostbitespider on 15/11/25.
//  Copyright (c) 2015年 frostbitespider. All rights reserved.
//
//  (     )      *    +    other    -   other   /
#import <Foundation/Foundation.h>
#import "Stack.h"
@interface Cal : NSObject{
    @private
    Stack *mid;
    NSMutableArray *type;
    NSMutableArray *suffix;
    int prioTable[8];
}
- (id)init;
-(NSNumber*) Calculate:(NSString*)src :(NSError*)error;
-(void)gensuffix:(NSString*)src;
-(int)numBuilder:(const char*) content :(int) pos :(unsigned long) length :(NSNumber**)result :(BOOL)flag;
-(BOOL)compare_prio:(char)a  :(char)b;
-(void)popmid;
-(BOOL)isNum:(char) c;
-(BOOL)isExp:(char) c;
@end