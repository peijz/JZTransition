//
//  JZTransitionProperty.m
//  JZTransition
//
//  Created by peijz on 16/7/1.
//  Copyright © 2016年 裴建忠. All rights reserved.
//

#import "JZTransitionProperty.h"
#import <objc/runtime.h>
#import <objc/message.h>
@implementation JZTransitionProperty

-(instancetype)init {
    self = [super init];
    if (self) {
        
        _animationTime = 0.400082;
        self.animationType = JZTransitionAnimationTypeDefault;
        _backGestureType = JZGestureTypePanRight;
        _backGestureEnable = YES;
        
    }
    return self;
}



@end
