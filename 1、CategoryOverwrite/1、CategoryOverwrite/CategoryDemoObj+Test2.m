//
//  CategoryDemoObj+Test2.m
//  1、CategoryOverwrite
//
//  Created by jichanghe on 2016/11/8.
//  Copyright © 2016年 hjc. All rights reserved.
//

#import "CategoryDemoObj+Test2.h"

@implementation CategoryDemoObj (Test2)

- (void)testMethod {
    NSLog(@"Test2-Category-testMethod");
}

+ (NSUInteger)hash; {
    NSLog(@"Test2--hash");
    return 200;
}

@end
