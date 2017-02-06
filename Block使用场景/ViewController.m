//
//  ViewController.m
//  Block使用场景
//
//  Created by MY on 2017/2/6.
//  Copyright © 2017年 com.gzkiwi.yinpubaoblue. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()
@property(nonatomic,strong)Person * person;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    <#returnType#>(^<#blockName#>)(<#parameterTypes#>) = ^(<#parameters#>) {
//        <#statements#>
//    };
    //block开发中使用场景
    // 1. 把block保存到对象中去, 恰当的时候才会调用
    // 2. 把block当做方法的参数使用,外界不调用,都是方法内部调用
    // 3. 把block当做方法的返回值,目的就是为了代替方法,封装内部实现,block当做方法的返回值,block交给内部实现,外界不需要知道Block至关调用
    [self block1];
    [self block2];
    [self bolck3];
    [self block4];
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    _person.operation();
}
//开发中场景3
-(void)block4{
    _person = [[Person alloc]init];
    _person.run(2);
}
//开发中场景3:把block当做方法的参数使用,外界不调用,都是方法内部调用
-(void)bolck3
{
    _person = [[Person alloc]init];
    [_person eat1:^{
        NSLog(@"执行了对象中的代码");
    }];
}

//开发中场景2:把block保存到对象中去, 恰当的时候才会调用
-(void)block2
{
    void(^block)() = ^() {
        NSLog(@"执行了对象中的代码");
    };
    
    Person * p = [[Person alloc]init];
    p.operation = ^(){
        NSLog(@"执行了对象中的代码");
    };
    
    p.operation = block;
    
    _person = p;
    
    _person.operation();
}

//开发中场景1:把block保存到对象中去, 恰当的时候才会调用
-(void)block1
{
    void(^block)() = ^() {
        //保存什么样的代码
        NSLog(@"执行block");
    };
    
    block();
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
