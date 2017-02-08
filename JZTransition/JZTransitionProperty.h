//
//  JZTransitionProperty.h
//  JZTransition
//
//  Created by peijz on 16/7/1.
//  Copyright © 2016年 裴建忠. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "JZTypedefConfig.h"

@interface JZTransitionProperty : NSObject

/**
 *  转场动画时间
 *
 *  transitiion animation time
 */
@property (nonatomic,assign) NSTimeInterval animationTime;

/**
 *  转场方式 ：push,pop,present,dismiss
 *
 *  transitiion type ：push,pop,present,dismiss
 */
@property (nonatomic,assign) JZTransitionType transitionType;

/**
 *  转场动画类型 
 *
 *  transitiion animation type
 */
@property (nonatomic,assign) JZTransitionAnimationType animationType;

/**
 *  是否采用系统原生返回方式
 *  set YES to make back action of systerm
 */
@property (nonatomic,assign) BOOL isSysBackAnimation;

/**
 *  是否通过手势返回
 *  set YES to enable gesture for back
 */
@property (nonatomic,assign) BOOL backGestureEnable;

/**
 *  返回上个界面的手势 默认：右滑 ：JZGestureTypePanRight
 *  choose type of gesture for back , default : JZGestureTypePanRight
 */
@property (nonatomic,assign) JZGestureType backGestureType;

/**
 *  View move 等动画中指定的起始视图
 *
 */
@property (nonatomic, strong) UIView     *startView;
/**
 *  View move 等动画中指定的结束视图
 *
 */
@property (nonatomic, strong) UIView     *targetView;




@end
