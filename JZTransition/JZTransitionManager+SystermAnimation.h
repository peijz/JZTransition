//
//  JZTransitionManager+SystermAnimation.h
//  JZTransition
//
//  Created by peijz on 16/9/22.
//  Copyright © 2016年 裴建忠. All rights reserved.
//

#import "JZTransitionManager.h"

@interface  JZTransitionManager (SystermAnimation)

-(void)sysTransitionNextAnimationWithType:(JZTransitionAnimationType) type context:(id<UIViewControllerContextTransitioning>)transitionContext;
-(void)sysTransitionBackAnimationWithType:(JZTransitionAnimationType) type context:(id<UIViewControllerContextTransitioning>)transitionContext;

@end
