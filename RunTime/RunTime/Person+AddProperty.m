//
//  Person+AddProperty.m
//  RunTime
//
//  Created by mac on 2018/3/3.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "Person+AddProperty.h"
#import <objc/runtime.h>

const char * str = "myKey"; //做为key，字符常量 必须是C语言字符串；

@implementation Person (AddProperty)

-(void)setHeight:(float)height {
    
    /*
     第一个参数是需要添加属性的对象；
     第二个参数是属性的key;
     第三个参数是属性的值,类型必须为id，所以此处height先转为NSNumber类型；
     第四个参数是使用策略，是一个枚举值，类似@property属性创建时设置的关键字，可从命名看出各枚举的意义；
     objc_setAssociatedObject(id object, const void *key, id value, objc_AssociationPolicy policy);
     */
    
    objc_setAssociatedObject(self, str, [NSNumber numberWithFloat:height], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(float)height {
    
    return [objc_getAssociatedObject(self, str) floatValue];
}

@end
