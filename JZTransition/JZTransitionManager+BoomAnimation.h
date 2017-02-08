//
//  JZTransitionManager+BoomAnimation.h
//  JZTransition
//
//  Created by peijz on 16/9/22.
//  Copyright © 2016年 裴建忠. All rights reserved.
//

#import "JZTransitionManager.h"

@interface JZTransitionManager (BoomAnimation)

-(void)boomPresentTransitionNextAnimation:(id<UIViewControllerContextTransitioning>)transitionContext;
-(void)boomPresentTransitionBackAnimation:(id<UIViewControllerContextTransitioning>)transitionContext;

@end
