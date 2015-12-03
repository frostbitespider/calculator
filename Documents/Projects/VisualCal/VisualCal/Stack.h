//
//  Stack.m
//  OCCal
//
//  Created by frostbitespider on 15/11/24.
//  Copyright (c) 2015年 frostbitespider. All rights reserved.
//

//Object-C中没有提供Stack容器

#import <Foundation/Foundation.h>

@interface Stack : NSObject {
@private
    NSMutableArray* array;
    unsigned long _count;
}

- (void)push:(id)Object;
- (id)pop;
- (id)top;
- (void)clear;
-(void)visit;
@property (nonatomic, readonly) unsigned long count;

@end

