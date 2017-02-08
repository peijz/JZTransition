//
//  JZTransitionManager+BrickAnimation.m
//  JZTransition
//
//  Created by peijz on 16/9/20.
//  Copyright © 2016年 裴建忠. All rights reserved.
//

#import "JZTransitionManager+BrickAnimation.h"


@implementation JZTransitionManager (BrickAnimation)


- (void)brickOpenNextWithType:(JZTransitionAnimationType)type andTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containView = [transitionContext containerView];
    
    
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    
    CGRect rect0 ;
    CGRect rect1;
    
    switch (type) {
        case JZTransitionAnimationTypeBrickOpenHorizontal:
            rect0 = CGRectMake(0 , 0 , screenWidth/2, screenHeight);
            rect1 = CGRectMake(screenWidth/2 , 0 , screenWidth/2, screenHeight);
            break;
        default:
            rect0 = CGRectMake(0 , 0 , screenWidth, screenHeight/2);
            rect1 = CGRectMake(0 , screenHeight/2 , screenWidth, screenHeight/2);
            break;
    }
    
    UIImage *image0 = [self imageFromView:fromVC.view atFrame:rect0];
    UIImage *image1 = [self imageFromView:fromVC.view atFrame:rect1];
    
    UIImageView *imgView0 = [[UIImageView alloc] initWithImage:image0];
    UIImageView *imgView1 = [[UIImageView alloc] initWithImage:image1];
    
    [containView addSubview:fromVC.view];
    [containView addSubview:toVC.view];
    [containView addSubview:imgView0];
    [containView addSubview:imgView1];
    
    
    [UIView animateWithDuration:self.animationTime animations:^{
    
        switch (type) {
            case JZTransitionAnimationTypeBrickOpenHorizontal:
                imgView0.layer.transform = CATransform3DMakeTranslation(-screenWidth/2, 0, 0);
                imgView1.layer.transform = CATransform3DMakeTranslation(screenWidth/2, 0, 0);
                break;
            default:
                imgView0.layer.transform = CATransform3DMakeTranslation(0, -screenHeight/2, 0);
                imgView1.layer.transform = CATransform3DMakeTranslation(0, screenHeight/2, 0);
                break;
        }
        
    } completion:^(BOOL finished) {
        
        if ([transitionContext transitionWasCancelled]) {
            
            [transitionContext completeTransition:NO];
            [imgView0 removeFromSuperview];
            [imgView1 removeFromSuperview];
            
        }else{
            [transitionContext completeTransition:YES];
            [imgView0 removeFromSuperview];
            [imgView1 removeFromSuperview];
        }
    }];
    
}

- (void)brickOpenBackWithType:(JZTransitionAnimationType)type andTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containView = [transitionContext containerView];
    
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    
    CGRect rect0 ;
    CGRect rect1;
    
    switch (type) {
        case JZTransitionAnimationTypeBrickOpenHorizontal:
            rect0 = CGRectMake(0 , 0 , screenWidth/2, screenHeight);
            rect1 = CGRectMake(screenWidth/2 , 0 , screenWidth/2, screenHeight);
            break;
        default:
            rect0 = CGRectMake(0 , 0 , screenWidth, screenHeight/2);
            rect1 = CGRectMake(0 , screenHeight/2 , screenWidth, screenHeight/2);
            break;
    }
    
    UIImage *image0 = [self imageFromView:toVC.view atFrame:rect0];
    UIImage *image1 = [self imageFromView:toVC.view atFrame:rect1];
    
    UIImageView *imgView0 = [[UIImageView alloc] initWithImage:image0];
    UIImageView *imgView1 = [[UIImageView alloc] initWithImage:image1];
    
    [containView addSubview:fromVC.view];
    [containView addSubview:toVC.view];
    [containView addSubview:imgView0];
    [containView addSubview:imgView1];
    
    toVC.view.hidden = YES;
    
    switch (type) {
        case JZTransitionAnimationTypeBrickOpenHorizontal:
            imgView0.layer.transform = CATransform3DMakeTranslation(-screenWidth/2, 0, 0);
            imgView1.layer.transform = CATransform3DMakeTranslation(screenWidth/2, 0, 0);
            break;
            
        default:
            imgView0.layer.transform = CATransform3DMakeTranslation(0, -screenHeight/2, 0);
            imgView1.layer.transform = CATransform3DMakeTranslation(0, screenHeight/2, 0);
            break;
    }
    
    [UIView animateWithDuration:self.animationTime animations:^{
        imgView0.layer.transform = CATransform3DIdentity;
        imgView1.layer.transform = CATransform3DIdentity;
        
    } completion:^(BOOL finished) {
        
        if ([transitionContext transitionWasCancelled]) {
            [transitionContext completeTransition:NO];
        }else{
            [transitionContext completeTransition:YES];
        }
        toVC.view.hidden = NO;
        
    }];
    
    
    __weak UIViewController *weakFromVC = fromVC;
    __weak UIViewController *weakToVC = toVC;
    
    self.willEndInteractiveBlock = ^(BOOL sucess) {
        if (sucess) {
            weakToVC.view.hidden = NO;
            
        }else{
            weakToVC.view.hidden = YES;
        }
        [imgView0 removeFromSuperview];
        [imgView1 removeFromSuperview];
    };

}

- (void)brickCloseNextWithType:(JZTransitionAnimationType)type andTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext{
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containView = [transitionContext containerView];
    
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    
    CGRect rect0 ;
    CGRect rect1 ;
    
    switch (type) {
        case JZTransitionAnimationTypeBrickCloseHorizontal:
            rect0 = CGRectMake(0, 0 , screenWidth/2, screenHeight);
            rect1 = CGRectMake(screenWidth/2 , 0 , screenWidth/2, screenHeight);
            break;
            
        default:
            rect0 = CGRectMake(0, 0 , screenWidth, screenHeight/2);
            rect1 = CGRectMake(0 , screenHeight/2 , screenWidth, screenHeight/2);
            break;
    }
    
    UIImage *image0 = [self imageFromView:toVC.view atFrame:rect0];
    UIImage *image1 = [self imageFromView:toVC.view atFrame:rect1];
    
    UIImageView *imgView0 = [[UIImageView alloc] initWithImage:image0];
    UIImageView *imgView1 = [[UIImageView alloc] initWithImage:image1];
    
    [containView addSubview:fromVC.view];
    [containView addSubview:toVC.view];
    [containView addSubview:imgView0];
    [containView addSubview:imgView1];
    
    toVC.view.hidden = YES;
    
    switch (type) {
        case JZTransitionAnimationTypeBrickCloseHorizontal:
            imgView0.layer.transform = CATransform3DMakeTranslation(-screenWidth/2, 0, 0);
            imgView1.layer.transform = CATransform3DMakeTranslation(screenWidth/2, 0, 0);
            break;
            
        default:
            imgView0.layer.transform = CATransform3DMakeTranslation(0, -screenHeight/2, 0);
            imgView1.layer.transform = CATransform3DMakeTranslation(0, screenHeight/2, 0);
            break;
    }
    [UIView animateWithDuration:self.animationTime animations:^{
        imgView0.layer.transform = CATransform3DIdentity;
        imgView1.layer.transform = CATransform3DIdentity;
        
    } completion:^(BOOL finished) {
        
        if ([transitionContext transitionWasCancelled]) {
            [transitionContext completeTransition:NO];
        }else{
            [transitionContext completeTransition:YES];
            toVC.view.hidden = NO;
        }
        [imgView0 removeFromSuperview];
        [imgView1 removeFromSuperview];
        
    }];
    
    
}
- (void)brickCloseBackWithType:(JZTransitionAnimationType)type andTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    __weak UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    __weak UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containView = [transitionContext containerView];
    
    
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    
    CGRect rect0 ;
    CGRect rect1 ;
    
    switch (type) {
        case JZTransitionAnimationTypeBrickCloseHorizontal:
            rect0 = CGRectMake(0, 0 , screenWidth/2, screenHeight);
            rect1 = CGRectMake(screenWidth/2 , 0 , screenWidth/2, screenHeight);
            break;
            
        default:
            rect0 = CGRectMake(0, 0 , screenWidth, screenHeight/2);
            rect1 = CGRectMake(0 , screenHeight/2 , screenWidth, screenHeight/2);
            break;
    }
    
    
    UIImage *image0 = [self imageFromView:fromVC.view atFrame:rect0];
    UIImage *image1 = [self imageFromView:fromVC.view atFrame:rect1];
    
    UIImageView *imgView0 = [[UIImageView alloc] initWithImage:image0];
    UIImageView *imgView1 = [[UIImageView alloc] initWithImage:image1];
    
    [containView addSubview:fromVC.view];
    [containView addSubview:toVC.view];
    [containView addSubview:imgView0];
    [containView addSubview:imgView1];
    
    
    [UIView animateWithDuration:self.animationTime animations:^{
        
        switch (type) {
            case JZTransitionAnimationTypeBrickCloseHorizontal:
                imgView0.layer.transform = CATransform3DMakeTranslation(-screenWidth/2, 0, 0);
                imgView1.layer.transform = CATransform3DMakeTranslation(screenWidth/2, 0, 0);
                break;
                
            default:
                imgView0.layer.transform = CATransform3DMakeTranslation(0, -screenHeight/2, 0);
                imgView1.layer.transform = CATransform3DMakeTranslation(0, screenHeight/2, 0);
                break;
        }
        
        
    } completion:^(BOOL finished) {
        
        if ([transitionContext transitionWasCancelled]) {
            [transitionContext completeTransition:NO];
        }else{
            [transitionContext completeTransition:YES];
            
        }
        toVC.view.hidden = NO;
        [imgView0 removeFromSuperview];
        [imgView1 removeFromSuperview];
        

    }];
    
    
    __weak UIViewController *weakFromVC = fromVC;
    __weak UIViewController *weakToVC = toVC;
    
    self.willEndInteractiveBlock = ^(BOOL sucess) {
        if (sucess) {
            [imgView0 removeFromSuperview];
            [imgView1 removeFromSuperview];
            
        }else{
            weakToVC.view.hidden = YES;
        }
        [imgView0 removeFromSuperview];
        [imgView1 removeFromSuperview];
        
    };
}

- (UIImage *)imageFromView: (UIView *)view atFrame:(CGRect)rect{
    
    UIGraphicsBeginImageContext(view.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    UIRectClip(rect);
    [view.layer renderInContext:context];
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return  theImage;
    
}


@end
