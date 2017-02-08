//
//  UINavigationController+JZTransition.h
//  JZTransition
//
//  Created by peijz on 16/6/3.
//  Copyright © 2016年 裴建忠. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JZTypedefConfig.h"
#import "UIViewController+JZTransition.h"


@interface UINavigationController (JZTransition)

/*
 * 
 */
- (void)jz_pushViewController:(UIViewController *)viewController animationType:(JZTransitionAnimationType) animationType;
- (void)jz_pushViewController:(UIViewController *)viewController makeTransition:(JZTransitionBlock) transitionBlock;


@end
