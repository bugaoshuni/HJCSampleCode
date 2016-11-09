//
//  ThirdViewController.m
//  ControlDemo
//
//  Created by jichanghe on 2016/10/27.
//  Copyright © 2016年 hjc. All rights reserved.
//

#import "ThirdViewController.h"
#import "CoderDemoViewController.h"
#import "FourViewController.h"

@interface ThirdViewController ()

@property (strong, nonatomic) IBOutlet UIButton *ThirdBtn;
@property(nonatomic,strong) NSString *name;
@property(nonatomic,strong) NSString *gender;
@property(nonatomic,assign) int age;
@end

@implementation ThirdViewController

+ (void)initialize {
    NSLog(@"ThirdViewController - initialize");
}

- (instancetype)init {
    NSLog(@"ThirdViewController - init");
    return [super init];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    NSLog(@"ThirdViewController - initWithCoder");
    return [super initWithCoder:aDecoder];
}


- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    NSLog(@"ThirdViewController - initWithNibName");
    return [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    NSLog(@"ThirdViewController-awakeFromNib");
}

////使用Xib来实现VC的时候，不要重写loadView方法。如果重写了loadView方法，则Xib中View就会消失，变成空View。
//- (void)loadView {
//    [super loadView];
//    NSLog(@"ThirdViewController - loadView");
//}

- (void)viewDidLoad {
    NSLog(@"ThirdViewController - viewDidLoad 中的self.view:%@", self.view);
    [super viewDidLoad];
    self.title = @"第三个页面";
    
    [self.ThirdBtn setTranslatesAutoresizingMaskIntoConstraints:false];
//    [self testUpdateConstraint];
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"ThirdViewController - viewWillAppear");
}


- (void)updateViewConstraints {
    NSLog(@"ThirdViewController - updateViewConstraints");
     [self testUpdateConstraint];
    [super updateViewConstraints];
}


- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"ThirdViewController - viewDidAppear");
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"ThirdViewController - viewWillDisappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    NSLog(@"ThirdViewController - viewDidDisappear");
}

- (void)viewWillLayoutSubviews:(BOOL)animated {
    [super viewWillLayoutSubviews];
    NSLog(@"ThirdViewController - viewWillLayoutSubviews");
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
//    self.ThirdBtn.frame = CGRectMake(33, 220, 50, 250);
//    self.view.frame =CGRectMake(33, 220, 250, 50);
    NSLog(@"ThirdViewController - viewDidLayoutSubviews");
}


- (void)didReceiveMemoryWarning {
    NSLog(@"ThirdViewController - didReceiveMemoryWarning");
}

- (void)dealloc {
    NSLog(@"ThirdViewController - dealloc");
}


- (void)testUpdateConstraint {
//    [self.ThirdBtn removeConstraints:self.ThirdBtn.constraints];
//    [self.view removeConstraints:self.view.constraints];
    

    
    // 水平居中
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.ThirdBtn attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    // 垂直居中
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.ThirdBtn attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
    // 宽度
    [self.ThirdBtn addConstraint:[NSLayoutConstraint constraintWithItem:self.ThirdBtn attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1.0 constant:120]];
    // 高度
    [self.ThirdBtn addConstraint:[NSLayoutConstraint constraintWithItem:self.ThirdBtn attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.ThirdBtn attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
}

- (IBAction)tapPushCoderVC:(UIButton *)sender {
//    CoderDemoViewController *CoderDemoVC = [[CoderDemoViewController alloc] init];
    
    UIStoryboard *mainStory = [UIStoryboard storyboardWithName:@"FourViewController" bundle:nil];
    FourViewController *fourVC = [mainStory instantiateInitialViewController];
    [self.navigationController pushViewController:fourVC animated:true];
}

@end
