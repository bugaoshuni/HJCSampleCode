//
//  ViewController.m
//  1、CategoryOverwrite
//
//  Created by jichanghe on 2016/11/8.
//  Copyright © 2016年 hjc. All rights reserved.
//

#import "ViewController.h"
#import "CategoryDemoObj.h"
#import "UIViewController+Test.h"
#import "CategoryDemoObj+Test.h"
#import "CategoryDemoObj+Test2.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"ViewController-viewDidLoad");
}

- (IBAction)tapCategoryTest:(UIButton *)sender {
    //不会执行category中的customMethod方法。
    [self customMethod];
    
    CategoryDemoObj *categoryDemoObj = [[CategoryDemoObj alloc] init];
    //下面方法执行的 到底是 CategoryDemoObj+Test.h 还是 CategoryDemoObj+Test2.h 中的方法 可以修改Build Phases 中的 Compile Sources 中文件的顺序来调整。
    [categoryDemoObj testMethod];
    [CategoryDemoObj hash];
    
}

- (void)customMethod {
    NSLog(@"ViewController--customMethod");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
