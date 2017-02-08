//
//  JZTransitionManager+InsideThenPushAnimation.h
//  JZTransition
//
//  Created by peijz on 16/9/22.
//  Copyright © 2016年 裴建忠. All rights reserved.
//

#import "JZTransitionManager.h"

@interface JZTransitionManager (InsideThenPushAnimation)
-(void)insideThenPushNextAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext;
-(void)insideThenPushBackAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext;
@end
