//
//  JZTransitionManager+BrickAnimation.h
//  JZTransition
//
//  Created by peijz on 16/9/20.
//  Copyright © 2016年 裴建忠. All rights reserved.
//

#import "JZTransitionManager.h"

@interface  JZTransitionManager (BrickAnimation)

- (void)brickOpenNextWithType:(JZTransitionAnimationType)type andTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext;
- (void)brickOpenBackWithType:(JZTransitionAnimationType)type andTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext;
- (void)brickCloseNextWithType:(JZTransitionAnimationType)type andTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext;
- (void)brickCloseBackWithType:(JZTransitionAnimationType)type andTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext;

@end
