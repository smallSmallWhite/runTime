//
//  Person.m
//  RunTime
//
//  Created by mac on 2018/3/3.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "Person.h"

@interface Person (){
    
    NSString *_name;
    NSString *_sex;
}

@end

@implementation Person
#pragma mark ==================初始化person属性==================
-(instancetype)init {
    
    self = [super init];
    if (self) {
        
        _name = @"张三";
        _sex = @"男";
        self.age = 12;
    }
    return self;
}
#pragma mark ==================person的2个方法==================
-(void)func1 {
    
    NSLog(@"执行了方法1");
}
-(void)func2 {
    
    NSLog(@"执行了方法2");
}
#pragma mark ==================输出person对象时的方法==================
-(NSString *)description {
    
    return [NSString stringWithFormat:@"name:%@ age:%d sex:%@",_name,self.age,_sex];
}

@end
