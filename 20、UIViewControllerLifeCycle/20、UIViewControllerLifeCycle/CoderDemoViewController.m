//
//  CoderDemoViewController.m
//  ControlDemo
//
//  Created by jichanghe on 2016/11/4.
//  Copyright © 2016年 hjc. All rights reserved.
//

#import "CoderDemoViewController.h"

@interface CoderDemoViewController ()
    @property(nonatomic,strong) NSString *name;
    @property(nonatomic,strong) NSString *gender;
    @property(nonatomic,assign) int age;
@end

@implementation CoderDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


//归档(序列化)
//对person对象进行归档时,此方法执行
//对person中想要进行归档的所有属性,进行序列化操作
-(void)encodeWithCoder:(NSCoder *)aCoder {
    NSLog(@"CoderDemoViewController-encodeWithCoder");
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.gender forKey:@"gender"];
    [aCoder encodeInt:self.age forKey:@"age"];
}

//反归档(反序列化)
//对象进行反归档时,该方法执行
//创建一个新的person对象,所有属性都是通过反序列化得到
-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    NSLog(@"CoderDemoViewController-initWithCoder");
    if (self = [super initWithCoder:aDecoder]) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.gender = [aDecoder decodeObjectForKey:@"gender"];
        self.age = [aDecoder decodeIntForKey:@"age"];
    }
    
    return self;
}



@end
