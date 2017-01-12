//
//  Runtime_addFuncController.m
//  runtimeDemo
//
//  Created by 安跃超 on 17/1/12.
//  Copyright © 2017年 安跃超. All rights reserved.
//

#import "Runtime_addFuncController.h"
#import "Person.h"

@interface Runtime_addFuncController ()
@property (nonatomic , strong)UILabel *label;
@end

@implementation Runtime_addFuncController

- (instancetype)init {

    if (self){
    self.title = @"add Func";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.label];
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    Person *p = [Person new];
    
    if ([p respondsToSelector:@selector(eat)]){
    
        // 默认person，没有实现eat方法，可以通过performSelector调用，但是会报错。
        // 动态添加方法就不会报错
        [p performSelector:@selector(eat)];
        
    }

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
