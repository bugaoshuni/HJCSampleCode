//
//  ViewController.m
//  2、LoadAndInitialize
//
//  Created by jichanghe on 2016/11/8.
//  Copyright © 2016年 hjc. All rights reserved.
//

#import "ViewController.h"
#import "Bird.h"
#import "Eagle.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Bird *birdAlloc = [Bird alloc];
    NSLog(@"刚执行完 [Bird alloc]");
    
    Bird *bird = [birdAlloc init];
    NSLog(@"刚执行完 [birdAlloc init]");
    
    NSLog(@"开始准备初始化Eagle");
    Eagle *eagle = [[Eagle alloc] init];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
