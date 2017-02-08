//
//  UIViewController+JZTransitionProperty.h
//  JZTransition
//
//  Created by peijz on 16/9/21.
//  Copyright © 2016年 裴建忠. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JZTransitionProperty;


@interface UIViewController (JZTransitionProperty)


typedef void(^JZTransitionBlock)(JZTransitionProperty *transition);

@property (nonatomic, copy  ) JZTransitionBlock            jz_callBackTransition;
@property (nonatomic, assign) BOOL                          jz_delegateFlag;
@property (nonatomic, assign) BOOL                          jz_addTransitionFlag;

@property (nonatomic, weak  ) id                            jz_transitioningDelegate;
@property (nonatomic, weak  ) id                            jz_tempNavDelegate;


@end
