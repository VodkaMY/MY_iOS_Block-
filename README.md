# MY_iOS_Block-
Block常用的开发场景##使用第一步 inlineBlock

>- block的声明定义
```
<#returnType#>(^<#blockName#>)(<#parameterTypes#>) = ^(<#parameters#>) {
        <#statements#>
    };
```
>- 1. block的作用:帮你保存一份代码,等到恰当的时机调用
>- 2. block在ARC中使用strong
>- 3. 当做方法的参数使用
>- 4. 把block当做方法的返回值,目的就是为了代替方法
- 事例一

```
void(^block)() = ^() {
        //保存什么样的代码
        NSLog(@"执行block");
    };
    
    block();
```

- 事例二

```

#import <UIKit/UIKit.h>

@interface Person : NSObject
@property(nonatomic,strong)void(^operation)();

@end
```
```
- (void)viewDidLoad {
    [super viewDidLoad];

   void(^block)() = ^() {
        NSLog(@"执行了对象中的代码");
    };
    
    Person * p = [[Person alloc]init];
    p.operation = ^(){
        NSLog(@"执行了对象中的代码");
    };
    
    p.operation = block;
    
    self.person = p;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    _person.operation();
}

-(void)block
{
    void(^block)() = ^() {
        //保存什么样的代码
        NSLog(@"执行block");
    };
    
    block();
}
```

- 事例三

```
#import <UIKit/UIKit.h>

//blockName:别名
typedef void(^blockName)();

@interface Person : NSObject
//无返回值: void(^)()
@property(nonatomic,strong)void(^operation)();

//返回值 参数 方法名
-(void)eat1:(void(^)(void))block;

-(void)eat2:(blockName)block;

@end
```

```
#import "Person.h"

@implementation Person

-(void)eat1:(void (^)(void))block
{
    block();
}
@end
```

```
-(void)bolck3
{
    _person = [[Person alloc]init];
    [_person eat1:^{
        NSLog(@"执行了对象中的代码");
    }];
}
```

- 事例四

```
-(void(^)(int))run;
```

```
-(void (^)(int))run
{
    return ^(int meter){
        NSLog(@"跑了%d米",meter);
    };
}
```

```
_person = [[Person alloc]init];
_person.run(2);
```




##block回调事例
```
- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"我在玩手机");
    
    NSLog(@"手机没电了");
    
    [self chargeMyiPhone:^{
        NSLog(@"出去逛街");
    }];
    
    NSLog(@"回来洗澡");
}

-(void)chargeMyiPhone:(void(^)(void))finishBlock
{
    NSLog(@"正在充电");
    finishBlock();//block调用
}
