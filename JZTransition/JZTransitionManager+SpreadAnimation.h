//
//  JZTransitionManager+SpreadAnimation.h
//  JZTransition
//
//  Created by peijz on 16/9/21.
//  Copyright © 2016年 裴建忠. All rights reserved.
//

#import "JZTransitionManager.h"

@interface  JZTransitionManager (SpreadAnimation)<CAAnimationDelegate>
- (void)spreadNextWithType:(JZTransitionAnimationType)type andTransitonContext:(id<UIViewControllerContextTransitioning>)transitionContext;
- (void)spreadBackWithType:(JZTransitionAnimationType)type andTransitonContext:(id<UIViewControllerContextTransitioning>)transitionContext;
- (void)pointSpreadNextWithContext:(id<UIViewControllerContextTransitioning>)transitionContext;
- (void)pointSpreadBackWithContext:(id<UIViewControllerContextTransitioning>)transitionContext;

@end
