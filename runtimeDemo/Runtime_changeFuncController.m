//
//  Runtime_changeFuncController.m
//  runtimeDemo
//
//  Created by 安跃超 on 17/1/12.
//  Copyright © 2017年 安跃超. All rights reserved.
//

#import "Runtime_changeFuncController.h"
#import <objc/runtime.h>
#import <objc/message.h>

@interface Runtime_changeFuncController ()

@end

@implementation Runtime_changeFuncController

- (instancetype)init {
    
    if(self){
        self.title = @"change Func";
    }
    return self;
}

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Method viewDidLoad = class_getInstanceMethod(self, @selector(viewDidLoad));
        Method viewDidLoaded = class_getInstanceMethod(self, @selector(viewDidLoaded));
        method_exchangeImplementations(viewDidLoad, viewDidLoaded);
        
    });
    
}

- (void)viewDidLoad {
    NSLog(@"%s,%d",__FUNCTION__,__LINE__);
}

- (void)viewDidLoaded{
    [self viewDidLoaded];
    NSLog(@"%s,%d",__FUNCTION__,__LINE__);
    
//    UIImage *image = [UIImage imageNamed:@"wine"];
    UIImage *image = [UIImage imageNamed:@"111"];
    
    
    UIImageView *imagView = [UIImageView new];
    imagView.frame = [UIScreen mainScreen].bounds;
    imagView.contentMode = UIViewContentModeScaleAspectFit;
    [imagView setImage:image];
    [self.view addSubview:imagView];
    
}


@end
