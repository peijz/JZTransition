//
//  JZTransitionManager+FragmentAnimation.h
//  JZTransition
//
//  Created by peijz on 16/9/20.
//  Copyright © 2016年 裴建忠. All rights reserved.
//

#import "JZTransitionManager.h"

@interface JZTransitionManager (FragmentAnimation)

-(void)fragmentShowNextType:(JZTransitionAnimationType)type andContext:(id<UIViewControllerContextTransitioning>)transitionContext;
-(void)fragmentShowBackType:(JZTransitionAnimationType)type andContext:(id<UIViewControllerContextTransitioning>)transitionContext;
-(void)fragmentHideNextType:(JZTransitionAnimationType)type andContext:(id<UIViewControllerContextTransitioning>)transitionContext;
-(void)fragmentHideBackType:(JZTransitionAnimationType)type andContext:(id<UIViewControllerContextTransitioning>)transitionContext;

@end
