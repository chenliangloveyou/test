//
//  UIViewController+Ext.m
//  SwizzingViewTest
//
//  Created by bjhl on 2018/9/5.
//  Copyright © 2018年 bjhl. All rights reserved.
//

#import "UIViewController+Ext.h"
#import <objc/runtime.h>

@implementation UIViewController (Ext)


+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class vc = [UIViewController class];
        
        SEL originalSEL = @selector(viewDidLoad);
        SEL swizzledSEL = @selector(Easy_viewDidLoad);
        
        Method originalMethod = class_getInstanceMethod(vc, originalSEL);
        Method swizzledMethod = class_getInstanceMethod(vc, swizzledSEL);
        
        BOOL didAddMethod =
        class_addMethod(vc, originalSEL, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        
        if (didAddMethod) {
            class_replaceMethod(vc, swizzledSEL, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        }
        else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

- (void)Easy_viewDidLoad
{
    
    UIView *view = self.view ;
    
    UIView *tempV = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIApplication sharedApplication].keyWindow.bounds.size.width, [UIApplication sharedApplication].keyWindow.bounds.size.height)];
    tempV.backgroundColor = [UIColor cyanColor];
    self.view = tempV ;
    
    view.frame = tempV.frame;
    [self.view addSubview:view];
    
    [self Easy_viewDidLoad];
}



@end
