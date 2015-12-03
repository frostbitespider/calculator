
//
//  Stack.m
//  OCCal
//
//  Created by frostbitespider on 15/11/24.
//  Copyright (c) 2015年 frostbitespider. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Stack.h"

@implementation Stack

@synthesize count;

- (id)init
{
    if( self=[super init] )
    {
        array = [[NSMutableArray alloc] init];
        count = 0;
    }
    return self;
}

//- (void)dealloc {
//    [array release];
//    [self dealloc];
//    [super dealloc];
//}

- (void)push:(id)Object
{
    [array addObject:Object];
    count = array.count;
    NSLog(@"push %@",Object);
}
- (id)pop
{
    id obj = nil;
    if(array.count > 0)
    {
        obj=[array lastObject];
        [array removeLastObject];
        count = array.count;
        NSLog(@"pop %@",obj);
    }
    return obj;
}
- (id)top{
    id  obj=nil;
    if(array.count>0){
        obj=[array lastObject];
    }
    return obj;
}
- (void)clear
{
    [array removeAllObjects];
    count = 0;
}
-(void)visit{
    NSLog(@"%@",array);
}
@end