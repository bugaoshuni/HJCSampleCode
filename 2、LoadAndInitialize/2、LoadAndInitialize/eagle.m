//
//  Eagle.m
//  2、LoadAndInitialize
//
//  Created by jichanghe on 2016/11/8.
//  Copyright © 2016年 hjc. All rights reserved.
//

#import "Eagle.h"

@implementation Eagle

+ (void)load {
    NSLog(@"%s", __func__);
}

//+ (void)initialize {
////    [super initialize];
//    NSLog(@"%s %@", __func__, [self class]);
//}

- (instancetype)init {
    if (self = [super init]) {
        NSLog(@"%s", __func__);
    }
    return self;
}

@end
