//
//  JZTransitionManager+ViewMoveAnimation.h
//  JZTransition
//
//  Created by peijz on 16/9/22.
//  Copyright © 2016年 裴建忠. All rights reserved.
//

#import "JZTransitionManager.h"

@interface JZTransitionManager (ViewMoveAnimation)
- (void)viewMoveNextWithType:(JZTransitionAnimationType )type andContext:(id<UIViewControllerContextTransitioning>)transitionContext;
- (void)viewMoveBackWithType:(JZTransitionAnimationType )type andContext:(id<UIViewControllerContextTransitioning>)transitionContext;


@end
