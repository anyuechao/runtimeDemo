//
//  MainViewController.m
//  runtimeDemo
//
//  Created by 安跃超 on 17/1/12.
//  Copyright © 2017年 安跃超. All rights reserved.
//

#import "MainViewController.h"
#import "Runtime_changeFuncController.h"
#import "Runtime_addFuncController.h"
#import "Runtime_addPropertyController.h"
#import <objc/message.h>

@interface MainViewController ()
@property (nonatomic , strong)NSArray<__kindof UINavigationController *> *childControllers;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    objc_msgSend(self, @selector(setupChildViewControllers));
}

- (void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:animated];
    objc_msgSend(self, @selector(loadTabBar));
}

// 添加子控制器
- (void)setupChildViewControllers {
    
    self.tabBar.translucent = NO;
    self.hidesBottomBarWhenPushed = YES;
    [self setViewControllers:self.childControllers];
}


- (void)loadTabBar {
    
    for (int i = 0; i  < self.childControllers.count; i ++) {
        
        UITabBarItem *tabBarItem = self.tabBar.items[i];
        tabBarItem.title = self.childControllers[i].title;
        [tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blueColor],NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
        [tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor redColor],NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
        
    }

}

- (NSArray<UINavigationController *> *)childControllers {
    
    if (!_childControllers){
        
        UINavigationController *firstVC = [[UINavigationController alloc] initWithRootViewController:[Runtime_changeFuncController new]];
        UINavigationController *secondVC = [[UINavigationController alloc] initWithRootViewController:[Runtime_addFuncController new]];
        
        UINavigationController *thirdVC = [[UINavigationController alloc] initWithRootViewController:[Runtime_addPropertyController new]];
        
        _childControllers = @[firstVC,secondVC,thirdVC];
        
    }
    return _childControllers;
}






@end
