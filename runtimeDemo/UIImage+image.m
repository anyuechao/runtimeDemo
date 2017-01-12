//
//  UIImage+image.m
//  runtimeDemo
//
//  Created by 安跃超 on 17/1/12.
//  Copyright © 2017年 安跃超. All rights reserved.
//

#import "UIImage+image.h"
#import <objc/runtime.h>

@implementation UIImage (image)
+ (void)load {

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Method imageWithName = class_getClassMethod(self, @selector(imageWithName:));
        Method imageName = class_getClassMethod(self, @selector(imageNamed:));
        method_exchangeImplementations(imageWithName, imageName);
        
    });
    
}

+ (instancetype)imageWithName:(NSString *)name{

    UIImage *image = [UIImage imageWithName:name];
    if (image == nil){
    
        NSLog(@"搞图片无法显示");
        image = [UIImage imageWithName:@"breakdown"];
    }
    return image;
}

@end
