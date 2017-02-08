//
//  JZTransitionManager+PageAnimation.h
//  JZTransition
//
//  Created by peijz on 16/9/22.
//  Copyright © 2016年 裴建忠. All rights reserved.
//

#import "JZTransitionManager.h"

@interface JZTransitionManager (PageAnimation) 


-(void)pageTransitionNextAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext;
-(void)pageTransitionBackAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext;

@end
