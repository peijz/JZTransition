//
//  JZTransitionManager+SystermAnimation.m
//  JZTransition
//
//  Created by peijz on 16/9/22.
//  Copyright © 2016年 裴建忠. All rights reserved.
//

#import "JZTransitionManager+SystermAnimation.h"
#import "JZTransitionManager+TypeTool.h"



@implementation JZTransitionManager (SystermAnimation)



-(void)sysTransitionNextAnimationWithType:(JZTransitionAnimationType) type context:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *tempView = [toVC.view snapshotViewAfterScreenUpdates:YES];
    UIView *temView1 = [fromVC.view snapshotViewAfterScreenUpdates:YES];
    UIView *containerView = [transitionContext containerView];
    
    [containerView addSubview:fromVC.view];
    [containerView addSubview:toVC.view];
    
    [containerView bringSubviewToFront:fromVC.view];
    [containerView bringSubviewToFront:toVC.view];
    
    CATransition *tranAnimation = [self getSysTransitionWithType:type];
    [containerView.layer addAnimation:tranAnimation forKey:nil];
    
    self.completionBlock = ^(){
        
        if ([transitionContext transitionWasCancelled]) {
            [transitionContext completeTransition:NO];
        }else{
            [transitionContext completeTransition:YES];
            toVC.view.hidden = NO;
        }
        [tempView removeFromSuperview];
        [temView1 removeFromSuperview];
        
    };
    
}

-(void)sysTransitionBackAnimationWithType:(JZTransitionAnimationType) type context:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *tempView = [toVC.view snapshotViewAfterScreenUpdates:YES];
    UIView *temView1 = [fromVC.view snapshotViewAfterScreenUpdates:YES];
    UIView *containerView = [transitionContext containerView];
    
    [containerView addSubview:fromVC.view];
    [containerView addSubview:toVC.view];
    
    CATransition *tranAnimation = [self getSysTransitionWithType:type];
    [containerView.layer addAnimation:tranAnimation forKey:nil];
    
    
    
    __weak UIViewController * weakToVC = toVC;    
    self.completionBlock = ^(){
        
        if ([transitionContext transitionWasCancelled]) {
            [transitionContext completeTransition:NO];
        }else{
            [transitionContext completeTransition:YES];
        }
        weakToVC.view.hidden = NO;
        
        [tempView removeFromSuperview];
        [temView1 removeFromSuperview];
    };
    

    self.willEndInteractiveBlock = ^(BOOL success) {
        if (success) {
            weakToVC.view.hidden = NO;
        }else{
            weakToVC.view.hidden = YES;
            [tempView removeFromSuperview];
            [temView1 removeFromSuperview];
        }
        
    };
    
}

@end
