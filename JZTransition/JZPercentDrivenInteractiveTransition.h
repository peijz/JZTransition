//
//  JZPercentDrivenInteractiveTransition.h
//  JZTransition
//
//  Created by peijz on 16/6/1.
//  Copyright © 2016年 裴建忠. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JZTypedefConfig.h"

typedef void(^ActionBlock)(void);

//继承自 实现了UIViewControllerInteractiveTransitioning协议的UIPercentDrivenInteractiveTransition
@interface JZPercentDrivenInteractiveTransition : UIPercentDrivenInteractiveTransition

@property (nonatomic, assign) JZGestureType getstureType;
@property (readonly, assign, nonatomic) BOOL isInteractive;
@property (nonatomic, assign) JZTransitionType transitionType;

@property (nonatomic, copy) ActionBlock presentBlock;
@property (nonatomic, copy) ActionBlock pushBlock;
@property (nonatomic, copy) ActionBlock dismissBlock;
@property (nonatomic, copy) ActionBlock popBlock;

@property (nonatomic, copy) void(^willEndInteractiveBlock)(BOOL success);

-(void)addGestureToViewController:(UIViewController *)vc;

@end
