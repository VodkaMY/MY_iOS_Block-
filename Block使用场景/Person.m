//
//  Person.m
//  Block使用场景
//
//  Created by MY on 2017/2/6.
//  Copyright © 2017年 com.gzkiwi.yinpubaoblue. All rights reserved.
//

#import "Person.h"

@implementation Person

-(void)eat1:(void (^)(void))block
{
    block();
}

-(void (^)(int))run
{
    return ^(int meter){
        NSLog(@"跑了%d米",meter);
    };
}
@end
