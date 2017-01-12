//
//  Runtime_addPropertyController.m
//  runtimeDemo
//
//  Created by 安跃超 on 17/1/12.
//  Copyright © 2017年 安跃超. All rights reserved.
//

#import "Runtime_addPropertyController.h"
#import "NSObject+Property.h"

@interface Runtime_addPropertyController ()
@property (nonatomic , strong)UILabel *label;
@end

@implementation Runtime_addPropertyController

- (instancetype)init {

    if (self){
    self.title = @"add Property";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.label];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    NSObject *object = [NSObject new];
    object.name = @"runtime动态添加属性";
    NSLog(@"%@",object.name);
}

- (UILabel *)label {

    if (!_label){
        _label = [[UILabel alloc] init];
        _label.frame = CGRectMake(0, 0, 200, 30);
        _label.center = self.view.center;
        _label.text = @"点一下";
    }
    return _label;
}

@end
