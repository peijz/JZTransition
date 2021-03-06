//
//  JZTransitionManager+CoverAnimation.h
//  JZTransition
//
//  Created by peijz on 16/9/22.
//  Copyright © 2016年 裴建忠. All rights reserved.
//

#import "JZTransitionManager.h"

@interface JZTransitionManager (CoverAnimation)


-(void)coverTransitionNextAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext;
-(void)coverTransitionBackAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext;


@end
