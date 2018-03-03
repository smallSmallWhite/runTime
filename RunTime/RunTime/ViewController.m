//
//  ViewController.m
//  RunTime
//
//  Created by admin on 17/1/10.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "ViewController.h"
#import <objc/objc.h>
#import <objc/runtime.h>
#import "Person.h"
#import "Person+AddProperty.h"

/*

 1.获取person类的所有变量；
 2.获取person类的所有方法；
 3.改变person类的私有变量name的值；
 4.为person的category类增加一个新属性；
 5.为person类添加一个方法；
 6.交换person类的2个方法的功能；
 
*/

@interface ViewController (){
    
    Person *_person;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _person = [[Person alloc] init];
    _person.height = 200;
   
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    /*
    //获取person类的所有变量
    unsigned int count = 0;
    //获取类的一个包含所有属性变量的列表，Ivar是Runtime声明的一个宏，是实例变量的意思
    Ivar *allVariables = class_copyIvarList([Person class], &count);
    for (int i = 0; i < count; i++) {
        
        //遍历每一个变量，包含名称和类型（此处没有*）
        Ivar ivar = allVariables[i];
        //获取实例变量的名称
        const char *variableName = ivar_getName(ivar);
        //获取实例变量的类型
        const char *variableType = ivar_getTypeEncoding(ivar);
        NSLog(@"(Name: %s) ----- (Type:%s)",variableName,variableType);
    }
     */
    /*
    //获取person类的所有方法
    unsigned int count = 0;
    //获取方法列表 所有在.m中的实现方法都会被找到，包括getter+setter方法
    Method *allMethods = class_copyMethodList([Person class], &count);
    for (int i = 0; i < count; i++) {
        
        //Method，为runtime声明的一个宏，表示对一个方法的描述
        Method md = allMethods[i];
        //获取SEL：SEL类型,即获取方法选择器@selector()
        SEL sel = method_getName(md);
        //得到sel的方法名：以字符串格式获取sel的name，也即@selector()中的方法名称
        const char *methodname = sel_getName(sel);
        NSLog(@"(Method:%s)",methodname);
    }
     */
    /*
    //改变person类的私有变量name的值；
    NSLog(@"改变前的person：%@",_person);
    unsigned int count = 0;
    Ivar *allIvarList = class_copyIvarList([Person class], &count);
    object_setIvar(_person, allIvarList[0], @"Mike");
    NSLog(@"改变后的person：%@",_person);
    */
    /*
    //为person的category类增加一个新属性；
    //赋值
    _person.height = 200.0;
    NSLog(@"高度----%.2f",[_person height]);
    */
    
    //为person类添加一个方法
     
    /* 动态添加方法：
     第一个参数表示Class cls 类型；
     第二个参数表示待调用的方法名称；
     第三个参数(IMP)myAddingFunction，IMP一个函数指针，这里表示指定具体实现方法myAddingFunction；
     第四个参数表方法的参数，0代表没有参数；
     */
    /*
    class_addMethod([_person class], @selector(NewMethod), (IMP)myAddingFunction, 0);
    //调用方法 【如果使用[per NewMethod]调用方法，在ARC下会报“no visible @interface"错误】
    [_person performSelector:@selector(NewMethod)];
    */
    //交换person类的2个方法的功能；
    Method method1 = class_getInstanceMethod([_person class], @selector(func1));
    Method method2 = class_getInstanceMethod([_person class], @selector(func2));
    method_exchangeImplementations(method1, method2);
    [_person func1];
}

int myAddingFunction (id self,SEL _cmd) {
    
    return 1;
}

- (void)NewMethod {
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
