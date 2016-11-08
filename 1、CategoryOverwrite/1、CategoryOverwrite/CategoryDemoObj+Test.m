//
//  CategoryDemoObj+Test.m
//  HJCSampleDemo
//
//  Created by jichanghe on 2016/11/8.
//  Copyright © 2016年 hjc. All rights reserved.
//

#import "CategoryDemoObj+Test.h"

@implementation CategoryDemoObj (Test)

- (void)testMethod {
    NSLog(@"CategoryDemoObj-Category-testMethod");
}

+ (NSUInteger)hash; {
    NSLog(@"hash");
    return 100;
}

@end
