//
//  SecondViewController.m
//  ControlDemo
//
//  Created by jichanghe on 2016/10/27.
//  Copyright © 2016年 hjc. All rights reserved.
//

#import "SecondViewController.h"
#import "ThirdViewController.h"

@interface SecondViewController ()
@property (nonatomic, strong) UIButton *pushBtn;
@end

@implementation SecondViewController

+ (void)initialize {
    NSLog(@"SecondViewController - initialize");
}

- (instancetype)init {
    NSLog(@"SecondViewController - init");
    return [super init];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    NSLog(@"SecondViewController - initWithCoder");
    return [super initWithCoder:aDecoder];
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    NSLog(@"SecondViewController - initWithNibName");
    return [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    NSLog(@"SecondViewController-awakeFromNib");
}

- (void)loadView {
    [super loadView];
    NSLog(@"SecondViewController - loadView");
}

- (void)viewDidLoad {
    NSLog(@"SecondViewController - self.view:%@", self.view);
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"第二个页面";
    
    self.pushBtn = [[UIButton alloc] initWithFrame:CGRectMake(11, 88, 33, 99)];
    [self.pushBtn setTitle:@"跳转按钮" forState:UIControlStateNormal];
    [self.pushBtn addTarget:self action:@selector(tapPushThirdVC) forControlEvents:UIControlEventTouchUpInside];
    self.pushBtn.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.pushBtn];
    
    [self.pushBtn setTranslatesAutoresizingMaskIntoConstraints:false];
    
//    [self.view setNeedsUpdateConstraints];
//    [self testUpdateConstraint];
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"SecondViewController - viewWillAppear");
}

//- (void)updateViewConstraints {
//    NSLog(@"SecondViewController - updateViewConstraints");
//    NSLog(@"1、updateViewConstraints--self.pushBtn: %@", self.pushBtn);
////     [self testUpdateConstraint];
//    
//    NSLog(@"2、updateViewConstraints--self.pushBtn: %@", self.pushBtn);
//    //在这里给view添加约束，请确保该view的translatesAutoresizingMaskIntoConstraints属性已设置为NO
//    [super updateViewConstraints];
//    
//    NSLog(@"3、updateViewConstraints--self.pushBtn: %@", self.pushBtn);
//}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"SecondViewController - viewDidAppear");
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"SecondViewController - viewWillDisappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    NSLog(@"SecondViewController - viewDidDisappear");
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    [self testUpdateConstraint];
    NSLog(@"viewWillLayoutSubviews--self.pushBtn: %@", self.pushBtn);
//    self.view.frame = CGRectMake(0, 0, 50, 50);
    NSLog(@"SecondViewController - viewWillLayoutself.pushBtns");
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    NSLog(@"viewDidLayoutSubviews--self.pushBtn: %@", self.pushBtn);
    self.pushBtn.frame = CGRectMake(33, 220, 50, 250);
    NSLog(@"2、viewDidLayoutSubviews--self.pushBtn: %@", self.pushBtn);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    NSLog(@"SecondViewController - didReceiveMemoryWarning");
}

- (void)dealloc {
    NSLog(@"SecondViewController - dealloc");
    
}

- (void)tapPushThirdVC {
//    ThirdViewController *thirdVC = [[ThirdViewController alloc] init];
    ThirdViewController *thirdVC = [[ThirdViewController alloc] initWithNibName:@"ThirdViewController" bundle:nil];
    [self.navigationController pushViewController:thirdVC animated:true];
}

- (void)testUpdateConstraint {

    // 水平居中
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.pushBtn attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    // 垂直居中
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.pushBtn attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
    // 宽度为20
    [self.pushBtn addConstraint:[NSLayoutConstraint constraintWithItem:self.pushBtn attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1.0 constant:120]];
    // 高度为20
    [self.pushBtn addConstraint:[NSLayoutConstraint constraintWithItem:self.pushBtn attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.pushBtn attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
    
}


@end
