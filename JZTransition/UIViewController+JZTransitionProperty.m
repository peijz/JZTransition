//
//  UIViewController+JZTransitionProperty.m
//  JZTransition
//
//  Created by peijz on 16/9/21.
//  Copyright © 2016年 裴建忠. All rights reserved.
//

#import "UIViewController+JZTransitionProperty.h"
#import <objc/runtime.h>


static NSString *jz_callBackTransitionKey = @"CallBackTransitionKey";
static NSString *jz_delegateFlagKey = @"jz_DelegateFlagKey";
static NSString *jz_addTransitionFlagKey = @"jz_addTransitionFlagKey";
static NSString *jz_transitioningDelegateKey = @"jz_transitioningDelegateKey";
static NSString *jz_tempNavDelegateKey = @"jz_tempNavDelegateKey";



@implementation UIViewController (JZTransitionProperty)


#pragma mark Property


//----- CallBackTransition
- (void)setJz_callBackTransition:(JZTransitionBlock)jz_callBackTransition {
    objc_setAssociatedObject(self, &jz_callBackTransitionKey, jz_callBackTransition, OBJC_ASSOCIATION_COPY);
}
- (JZTransitionBlock)jz_callBackTransition {
    return objc_getAssociatedObject(self, &jz_callBackTransitionKey);
}

//----- jz_DelegateFlag
- (void)setJz_delegateFlag:(BOOL)jz_delegateFlag {
    objc_setAssociatedObject(self, &jz_delegateFlagKey, @(jz_delegateFlag), OBJC_ASSOCIATION_ASSIGN);
}
-(BOOL)jz_delegateFlag {
    return [objc_getAssociatedObject(self, &jz_delegateFlagKey) integerValue] == 0 ?  NO : YES;
}


//----- jz_addTransitionFlag
- (void)setJz_addTransitionFlag:(BOOL)jz_addTransitionFlag {
    objc_setAssociatedObject(self, &jz_addTransitionFlagKey, @(jz_addTransitionFlag), OBJC_ASSOCIATION_ASSIGN);
}
- (BOOL)jz_addTransitionFlag {
    return [objc_getAssociatedObject(self, &jz_addTransitionFlagKey) integerValue] == 0 ?  NO : YES;
}

//----- jz_transitioningDelega
- (void)setJz_transitioningDelegate:(id)jz_transitioningDelegate {
    objc_setAssociatedObject(self, &jz_transitioningDelegateKey, jz_transitioningDelegate, OBJC_ASSOCIATION_ASSIGN);
}

- (id)jz_transitioningDelegate {
    return objc_getAssociatedObject(self, &jz_transitioningDelegateKey);
}
//----- jz_tempNavDelegate
- (void)setJz_tempNavDelegate:(id)jz_tempNavDelegate {
    objc_setAssociatedObject(self, &jz_tempNavDelegateKey, jz_tempNavDelegate, OBJC_ASSOCIATION_ASSIGN);
}
- (id)jz_tempNavDelegate {
    return objc_getAssociatedObject(self, &jz_tempNavDelegateKey);
}

@end
