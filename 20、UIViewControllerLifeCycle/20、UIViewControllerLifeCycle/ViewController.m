//
//  ViewController.m
//  20、UIViewControllerLifeCycle
//
//  Created by jichanghe on 2016/11/9.
//  Copyright © 2016年 hjc. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()
@property(nonatomic,strong) NSString *name;
@property(nonatomic,strong) NSString *gender;
@property(nonatomic,assign) int age;
@property (strong, nonatomic) IBOutlet UIButton *pushBtn;

@end

@implementation ViewController


+ (void)load {
    NSLog(@"ViewController-load");
}
//类的初始化方法
+ (void)initialize {
    NSLog(@"ViewController - initialize");
}

//对象初始化方法
- (instancetype)init {
    NSLog(@"ViewController - init");
    return [super init];
}

//反归档(反序列化)
-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    NSLog(@"ViewController - initWithCoder");
    if (self = [super initWithCoder:aDecoder]) {
        NSLog(@"aDecoder-systemVersion : %u", [aDecoder systemVersion]);
    } else {
        self.name = @"测试玩的";
    }
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    NSLog(@"ViewController - initWithNibName");
    return [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    NSLog(@"ViewController - awakeFromNib");
//    NSLog(@"ViewController - awakeFromNib,pushBtn:%@",self.view);
}

/**
 在这个方法中主要完成一些关键view的初始化工作。
 在loadView之前，view还没有被初始化，loadView完成后view就建立好了。
 */
- (void)loadView {
    NSLog(@"ViewController - loadView");
    [super loadView]; //如果重新设置self.vew，这个可以不调用。调用了也不会出错，只是增加了一些开销。
    //    UIView *customView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    //    customView.backgroundColor = [UIColor redColor];
    //    self.view = customView;
    //    NSLog(@"loadView中调用self.view : %@", self.view);
}


//视图加载完成之后的设置,只调用一次
- (void)viewDidLoad {
    NSLog(@"ViewController - self.view:%@", self.view);
    [super viewDidLoad];
    
    /*  //测试修改self.view.frame的情况
        self.view.frame = CGRectMake(0, 0, 50, 50);
     */

    /*  //测试 self.view = nil 的情况
        self.view = nil;
        self.view.backgroundColor = [UIColor redColor]; //这时候view为nil，会再次调用loadView方法。
    */
}

//每次打开页面 的时候， 在视图显示之前 调用
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"ViewController - viewWillAppear");
}

- (void)updateViewConstraints {
    NSLog(@"updateViewConstraints");
    [super updateViewConstraints];
}

/**
 布局变化前
 注意点:init初始化不会触发layoutSubviews
 addSubview、view的Frame改变 会触发layoutSubviews
 滚动一个UIScrollView会触发layoutSubviews
 旋转Screen会触发父UIView上的layoutSubviews事件
 改变一个UIView大小的时候 会触发父UIView上的layoutSubviews事件
 */
- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    //    self.view.frame = CGRectMake(0, 0, 50, 50);
    NSLog(@"ViewController - viewWillLayoutSubviews");
}

//布局变化后
//这期间系统可能会多次调用viewWillLayoutSubviews 、    viewDidLayoutSubviews 俩个方法
//如果使用到自动布局，需要修改自动布局中的约束条件，那么可以在viewWillLayoutSubviews中进行操作，最近遇到一个就是text文本框中文字过多的时候文字不能不能置顶，可以在viewWillDidSubviews中操作：
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    //    [self.myTextView setContentOffset:CGPointZero animated:NO];
    NSLog(@"ViewController - viewDidLayoutSubviews");
    //    self.view.frame = CGRectMake(0, 0, 150, 150);
}

//视图显示完毕后调用
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"ViewController - viewDidAppear");
}

//在视图将要消失之前调用, 这期间系统也会调用viewWillLayoutSubviews 、viewDidLayoutSubviews 两个方法
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"ViewController - viewWillDisappear");
}

//控制器的view完全消失的时候
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    NSLog(@"ViewController - viewDidDisappear");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    NSLog(@"ViewController - didReceiveMemoryWarning");
}

//和视图销毁的时候调用
- (void)dealloc {
    NSLog(@"ViewController - dealloc");
}

- (void)test {
    NSLog(@"ViewController - test");
}



- (IBAction)tapPushVC:(UIButton *)sender {
    SecondViewController *secondInstance = [SecondViewController alloc];
    SecondViewController *secondVC = [secondInstance init];
    
//     SecondViewController *secondVC = [[SecondViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:secondVC animated:true];
}



@end
