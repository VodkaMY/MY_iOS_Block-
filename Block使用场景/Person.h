//
//  Person.h
//  Block使用场景
//
//  Created by MY on 2017/2/6.
//  Copyright © 2017年 com.gzkiwi.yinpubaoblue. All rights reserved.
//

#import <UIKit/UIKit.h>

//blockName:别名
typedef void(^blockName)();

@interface Person : NSObject
//无返回值: void(^)()
@property(nonatomic,strong)void(^operation)();

//返回值 参数 方法名
-(void)eat1:(void(^)(void))block;

-(void)eat2:(blockName)block;

//-(void)run:(int)meter;

-(void(^)(int))run;

@end
