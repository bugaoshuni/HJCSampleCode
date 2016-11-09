//
//  ViewController.m
//  ControlDemo
//
//  Created by jichanghe on 2016/10/25.
//  Copyright © 2016年 hjc. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()
@property (nonatomic,strong) dispatch_source_t dispatchTimer;
@property (nonatomic, strong) NSTimer *timer;

@property(nonatomic,strong) NSString *name;
@property(nonatomic,strong) NSString *gender;
@property(nonatomic,assign) int age;
@end

@implementation ViewController

+ (void)load {
    NSLog(@"load");
}
//类的初始化方法
+ (void)initialize {
    NSLog(@"ViewController - initialize");
     [super initialize];
}

//对象初始化方法
- (instancetype)init {
    NSLog(@"ViewController - init");
    return [super init];
}

//如果使用storyboard或者xib
//- (instancetype)initWithCoder:(NSCoder *)aDecoder {
//    NSLog(@"ViewController - initWithCoder");
//    return [super initWithCoder:aDecoder];
//}



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

/**
要重新设置View的时候，在loadView中去创建UIVIewController的view，也就是self.view。
如果你没有重写方法，UIViewController会默认调用父类的方法加载初始化view
 
在这个方法中主要完成一些关键view的初始化工作。然后就是加载View,加载成功后接着调用viewDidLoad方法。
 在loadView之前，view是不存在的，也就是说view还没有被初始化，loadView完成后view就建立好了。
 
 */
- (void)loadView {
    [super loadView]; //这个可以不调用。调用了也不会出错，只是增加了一些开销。
//    NSLog(@"ViewController - loadView");
//    
//    UIView *customView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
//    customView.backgroundColor = [UIColor redColor];
//    self.view = customView;
//    NSLog(@"loadView中调用self.view : %@", self.view);
//    
}


//视图加载完成之后的设置,只调用一次
- (void)viewDidLoad {
    NSLog(@"ViewController - viewDidLoad");
//    NSLog(@"ViewController - self.view:%@", self.view);
    [super viewDidLoad];
    
//    self.view.frame = CGRectMake(0, 0, 50, 50);
////    [self printScale];
////    [self startTimer];
//
//    UIView *customView = [[UIView alloc] initWithFrame:CGRectMake(22, 55, 100, 100)];
//    customView.backgroundColor = [UIColor redColor];
//    [self.view addSubview:customView];
    
}


//- (void)loadView {
//    [super loadView];
//    NSLog(@"loadView中调用self.view : %@", self.view);
//}

//- (void)viewDidLoad {
//    [super viewDidLoad];
//    self.view = nil;
//    self.view.backgroundColor = [UIColor redColor]; //这时候view为nil，会再次调用loadView方法。
//}




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
 addSubview会触发layoutSubviews
 设置view的Frame会触发layoutSubviews，当然前提 是frame的值设置前后发生了变化
 滚动一个UIScrollView会触发layoutSubviews
 旋转Screen会触发父UIView上的layoutSubviews事件
 改变一个UIView大小的时候也会触发父UIView上的layoutSubviews事件
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


- (void)printScale {
    CGRect bounds = [[UIScreen mainScreen] bounds];
    NSString *screenMode = [[UIScreen mainScreen].coordinateSpace description];
    CGFloat scale = [[UIScreen mainScreen] scale];
    CGFloat nativeScale = [[UIScreen mainScreen] nativeScale];
    NSLog(@"缩放因子: \n bounds: %@\n screen: %@\n scale: %f\n native scale: %f", NSStringFromCGRect(bounds), screenMode, scale, nativeScale);
}

- (void)startTimer {
    [self startTimer];
    self.dispatchTimer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,  dispatch_get_global_queue(0, 0));
    dispatch_source_set_timer(self.dispatchTimer, DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC, 0);
    // 任务回调
    dispatch_source_set_event_handler(self.dispatchTimer, ^{
        NSLog(@"-----定时器-------");
    });
    
    dispatch_resume(self.dispatchTimer);

    //    self.timer =  [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(test) userInfo:nil repeats:YES];
}

- (IBAction)tapPushVC:(UIButton *)sender {
    SecondViewController *secondInstance = [SecondViewController alloc];
    SecondViewController *secondVC = [secondInstance init];
    [self.navigationController pushViewController:secondVC animated:true];
}


@end

