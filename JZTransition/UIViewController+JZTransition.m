

#import "UIViewController+JZTransition.h"
#import <objc/runtime.h>
#import "UIViewController+JZTransitionProperty.h"




UINavigationControllerOperation _operation;
JZPercentDrivenInteractiveTransition *_interactive;
JZTransitionManager *_transtion;


@implementation UIViewController (JZTransition)
#pragma mark Hook

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method method0 = class_getInstanceMethod(self.class, @selector(jz_dismissViewControllerAnimated:completion:));
        Method method1 = class_getInstanceMethod(self.class, @selector(dismissViewControllerAnimated:completion:));
        method_exchangeImplementations(method0, method1);
    });
}

#pragma mark Action Method

//Default
- (void)jz_presentViewController:(UIViewController *)viewControllerToPresent completion:(void (^)(void))completion{
    
    [self jz_presentViewController:viewControllerToPresent makeTransition:nil completion:completion];
}

//Choose animation type
-(void)jz_presentViewController:(UIViewController *)viewControllerToPresent animationType:(JZTransitionAnimationType )animationType completion:(void (^)(void))completion{
    
    [self jz_presentViewController:viewControllerToPresent makeTransition:^(JZTransitionProperty *transition) {
        transition.animationType = animationType;
    } completion:completion];
    
    
}

//make transition
-(void)jz_presentViewController:(UIViewController *)viewControllerToPresent makeTransition:(JZTransitionBlock)transitionBlock{
    
    [self jz_presentViewController:viewControllerToPresent makeTransition:transitionBlock completion:nil];
    
}

//make transition With Completion
-(void)jz_presentViewController:(UIViewController *)viewControllerToPresent makeTransition:(JZTransitionBlock)transitionBlock completion:(void (^)(void))completion{
    
    if (viewControllerToPresent.transitioningDelegate) {
        self.jz_transitioningDelegate = viewControllerToPresent.transitioningDelegate;
    }
    viewControllerToPresent.jz_addTransitionFlag = YES;
    viewControllerToPresent.transitioningDelegate = viewControllerToPresent;
    viewControllerToPresent.jz_callBackTransition = transitionBlock ? transitionBlock : nil;
    [self presentViewController:viewControllerToPresent animated:YES completion:completion];
    
}

- (void)jz_dismissViewControllerAnimated:(BOOL)flag completion:(void (^)(void))completion {
    if (self.jz_delegateFlag) {
        self.transitioningDelegate = self;
        if (self.jz_transitioningDelegate) {
            self.transitioningDelegate = self.jz_transitioningDelegate;
        }
    }
    [self jz_dismissViewControllerAnimated:flag completion:completion];
}




#pragma mark Delegate
// ********************** Present Dismiss **********************
-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    
    if (!self.jz_addTransitionFlag) {
        return nil;//dimiss directly
    }
    
    !_transtion ? _transtion = [[JZTransitionManager alloc] init] : nil ;
    JZTransitionProperty *make = [[JZTransitionProperty alloc] init];
    self.jz_callBackTransition ? self.jz_callBackTransition(make) : nil;
    _transtion = [JZTransitionManager copyPropertyFromObjcet:make toObjcet:_transtion];
    _transtion.transitionType = JZTransitionTypeDismiss;
    return _transtion;
    
}
-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    if (!self.jz_addTransitionFlag) {
        return nil;//present directly
    }
    
    !_transtion ? _transtion = [[JZTransitionManager alloc] init] : nil ;
    JZTransitionProperty *make = [[JZTransitionProperty alloc] init];
    self.jz_callBackTransition ? self.jz_callBackTransition(make) : nil;
    _transtion = [JZTransitionManager copyPropertyFromObjcet:make toObjcet:_transtion];
    _transtion.transitionType =JZTransitionTypePresent;
    self.jz_delegateFlag = _transtion.isSysBackAnimation ? NO : YES;
    return _transtion;
    
}

- (id <UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id <UIViewControllerAnimatedTransitioning>)animator{
    return nil;
}

- (id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator{
    if (!self.jz_addTransitionFlag) {
        return nil;
    }
    return _interactive.isInteractive ? _interactive : nil ;
}


//  ********************** Push Pop **********************
-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    
    if (!self.jz_addTransitionFlag) {
        return nil;
    }
    !_transtion ? _transtion = [[JZTransitionManager alloc] init] : nil ;
    JZTransitionProperty *make = [[JZTransitionProperty alloc] init];
    self.jz_callBackTransition ? self.jz_callBackTransition(make) : nil;
    _transtion = [JZTransitionManager copyPropertyFromObjcet:make toObjcet:_transtion];
    _operation = operation;

    if ( operation == UINavigationControllerOperationPush ) {
        self.jz_delegateFlag = _transtion.isSysBackAnimation ? NO : YES;
        _transtion.transitionType = JZTransitionTypePush;
    }else{
        _transtion.transitionType = JZTransitionTypePop;
    }
    
    
    if (_operation == UINavigationControllerOperationPush && _transtion.isSysBackAnimation == NO && _transtion.backGestureEnable) {
        //add gestrue for pop
        !_interactive ? _interactive = [[JZPercentDrivenInteractiveTransition alloc] init] : nil;
        [_interactive addGestureToViewController:self];
        _interactive.transitionType = JZTransitionTypePop;
        _interactive.getstureType = _transtion.backGestureType != JZGestureTypeNone ? _transtion.backGestureType : JZGestureTypePanRight;
        _interactive.willEndInteractiveBlock = ^(BOOL suceess) {
            _transtion.willEndInteractiveBlock ? _transtion.willEndInteractiveBlock(suceess) : nil;
        };
        
    }
    return _transtion;
    
}

- (nullable id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController {
    
    if (!self.jz_addTransitionFlag) {
        return nil;
    }
    !_interactive ? _interactive = [[JZPercentDrivenInteractiveTransition alloc] init] : nil;
    
    if (_operation == UINavigationControllerOperationPush) {
        return nil;
    }else{
        return _interactive.isInteractive ? _interactive : nil ;
    }

}


@end
