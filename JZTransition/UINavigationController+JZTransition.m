//
//  UINavigationController+JZTransition.m
//  JZTransition
//
//  Created by peijz on 16/6/3.
//  Copyright © 2016年 裴建忠. All rights reserved.
//

#import "UINavigationController+JZTransition.h"
#import <objc/runtime.h>
#import "UIViewController+JZTransitionProperty.h"
@implementation UINavigationController (JZTransition)


#pragma mark Hook
+(void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Method method0 = class_getInstanceMethod(self.class, @selector(popViewControllerAnimated:));
        Method method1 = class_getInstanceMethod(self.class, @selector(jz_popViewControllerAnimated:));
        method_exchangeImplementations(method0, method1);
        
    });
}

#pragma mark Action Method
- (void)jz_pushViewController:(UIViewController *)viewController {
    
    [self jz_pushViewController:viewController makeTransition:nil];
 
}

- (void)jz_pushViewController:(UIViewController *)viewController animationType:(JZTransitionAnimationType) animationType{
    
    [self jz_pushViewController:viewController makeTransition:^(JZTransitionProperty *transition) {
        transition.animationType = animationType;
    }];
}

- (void)jz_pushViewController:(UIViewController *)viewController makeTransition:(JZTransitionBlock) transitionBlock {
    
    if (self.delegate) {
        viewController.jz_tempNavDelegate = self.delegate;
    }
    self.delegate = viewController;
    viewController.jz_addTransitionFlag = YES;
    viewController.jz_callBackTransition = transitionBlock ? transitionBlock : nil;
    [self pushViewController:viewController animated:YES];
}

- (UIViewController *)jz_popViewControllerAnimated:(BOOL)animated {

    if (self.viewControllers.lastObject.jz_delegateFlag) {
        self.delegate = self.viewControllers.lastObject;
        if (self.jz_tempNavDelegate) {
            self.delegate = self.jz_tempNavDelegate;
        }
    }
    return [self jz_popViewControllerAnimated:animated];
    
}

@end
