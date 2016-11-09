//
//  FourViewController.m
//  20、UIViewControllerLifeCycle
//
//  Created by jichanghe on 2016/11/9.
//  Copyright © 2016年 hjc. All rights reserved.
//

#import "FourViewController.h"

@interface FourViewController ()

@end

@implementation FourViewController

+ (void)load {
    NSLog(@"FourViewController-load");
}
//类的初始化方法
+ (void)initialize {
    NSLog(@"FourViewController - initialize");
}

- (void)awakeFromNib {
    [super awakeFromNib];
    NSLog(@"FourViewController - awakeFromNib");
}

//对象初始化方法
- (instancetype)init {
    NSLog(@"FourViewController - init");
    return [super init];
}

//反归档(反序列化)
-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    NSLog(@"FourViewController - initWithCoder");
    return  [super initWithCoder:aDecoder];
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    NSLog(@"FourViewController - initWithNibName");
    return [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
}

- (void)loadView {
    NSLog(@"FourViewController - loadView");
    [super loadView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
