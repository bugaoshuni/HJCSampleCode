//
//  Bird.m
//  2、LoadAndInitialize
//
//  Created by jichanghe on 2016/11/8.
//  Copyright © 2016年 hjc. All rights reserved.
//

#import "Bird.h"

@implementation Bird

+ (void)load {
    NSLog(@"%s", __func__);
}

+ (void)initialize {
    if (self == [Bird class]) {
        NSLog(@"子类没有实现initialize方法，子类初始化的时候，不在执行父类的initialize方法");
        
    }
    NSLog(@"%s %@", __func__, [self class]);
}

- (instancetype)init {
    if (self = [super init]) {
        NSLog(@"%s", __func__);
    }
    return self;
}

@end
