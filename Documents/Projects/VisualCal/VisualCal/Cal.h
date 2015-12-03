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
-(NSNumber*) Calculate:(NSString*)src;
-(void)gensuffix:(NSString*)src;
-(BOOL) compare_prio:(char)a  :(char)b;
-(void)popmid;
-(BOOL)isNum:(char) c;
-(BOOL)isExp:(char) c;
@end