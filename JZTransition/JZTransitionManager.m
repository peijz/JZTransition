
#import "JZTransitionManager.h"
#import "UIViewController+JZTransition.h"
#import <objc/runtime.h>
#import <objc/message.h>
#import "JZTransitionManager+FragmentAnimation.h"
#import "JZTransitionManager+TypeTool.h"
#import "JZTransitionManager+BrickAnimation.h"
#import "JZTransitionManager+SpreadAnimation.h"
#import "JZTransitionManager+ViewMoveAnimation.h"
#import "JZTransitionManager+CoverAnimation.h"
#import "JZTransitionManager+SystermAnimation.h"
#import "JZTransitionManager+PageAnimation.h"
#import "JZTransitionManager+BoomAnimation.h"
#import "JZTransitionManager+InsideThenPushAnimation.h"


@interface JZTransitionManager ()

@property (nonatomic, assign) id <UIViewControllerContextTransitioning> transitionContext;

@end

@implementation JZTransitionManager

-(instancetype)init {
    self = [super init];
    if (self) {
        
        _completionBlock = nil;
        
    }
    return self;
}

#pragma mark - Delegate
//UIViewControllerAnimatedTransitioning
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return _animationTime ;
}

- (void)animationEnded:(BOOL) transitionCompleted {
    
    if (transitionCompleted) {
        [self removeDelegate];
        
    }
}
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    
    
    _transitionContext = transitionContext;
    if (self.animationType == JZTransitionAnimationTypeDefault) {
        self.animationType = JZTransitionAnimationTypeSysPushFromLeft;
    }
    switch (_transitionType) {
        case JZTransitionTypePush:
        case JZTransitionTypePresent:
            [self transitionActionAnimation:transitionContext withAnimationType:self.animationType];
            break;
        case JZTransitionTypePop:
        case JZTransitionTypeDismiss:
            [self transitionBackAnimation:transitionContext withAnimationType:self.animationType];
            break;
        default:
            break;
    }
    
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
 
    if (flag) {
        _completionBlock ? _completionBlock() : nil;
        _completionBlock = nil;
    }
    
}
#pragma mark - Action
-(void)transitionActionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext withAnimationType:(JZTransitionAnimationType )animationType{
    
    if ((NSInteger)animationType < (NSInteger)JZTransitionAnimationTypeDefault) {
        [self sysTransitionAnimationWithType:animationType  context:transitionContext];
    }
    unsigned int count = 0;
    Method *methodlist = class_copyMethodList([JZTransitionManager class], &count);
    int tag= 0;
    for (int i = 0; i < count; i++) {
        Method method = methodlist[i];
        SEL selector = method_getName(method);
        NSString *methodName = NSStringFromSelector(selector);
        if ([methodName rangeOfString:@"NextTransitionAnimation"].location != NSNotFound) {
            tag++;
            if (tag == animationType - JZTransitionAnimationTypeDefault) {
                ((void (*)(id,SEL,id<UIViewControllerContextTransitioning>,JZTransitionAnimationType))objc_msgSend)(self,selector,transitionContext,animationType);
                break;
            }
        }
    }
    free(methodlist);
    
}

-(void)transitionBackAnimation:(id<UIViewControllerContextTransitioning>)transitionContext withAnimationType:(JZTransitionAnimationType )animationType{
    
    if ((NSInteger)animationType < (NSInteger)JZTransitionAnimationTypeDefault) {
        [self backSysTransitionAnimationWithType:_backAnimationType  context:transitionContext];
    }
    
    unsigned int count = 0;
    Method *methodlist = class_copyMethodList([JZTransitionManager class], &count);
    int tag= 0;
    for (int i = 0; i < count; i++) {
        Method method = methodlist[i];
        SEL selector = method_getName(method);
        NSString *methodName = NSStringFromSelector(selector);
        if ([methodName rangeOfString:@"BackTransitionAnimation"].location != NSNotFound) {
            tag++;
            if (tag == animationType - JZTransitionAnimationTypeDefault) {
                ((void (*)(id,SEL,id<UIViewControllerContextTransitioning>,JZTransitionAnimationType))objc_msgSend)(self,selector,transitionContext,animationType);
                break;
            }
            
        }
    }
    free(methodlist);

}

-(void)sysTransitionAnimationWithType:(JZTransitionAnimationType) type context:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self sysTransitionNextAnimationWithType:type context:transitionContext];
}

-(void)backSysTransitionAnimationWithType:(JZTransitionAnimationType) type context:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self sysTransitionBackAnimationWithType:type context:transitionContext];
}
#pragma mark - Animations

// *********************************************************************************************
-(void)pageNextTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    [self pageTransitionNextAnimationWithContext:transitionContext];
}
-(void)pageBackTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    [self pageTransitionBackAnimationWithContext:transitionContext];
}


// *********************************************************************************************
-(void)viewMoveNextTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self viewMoveNextWithType:JZTransitionAnimationTypeViewMoveToNextVC andContext:transitionContext];
}
-(void)viewMoveBackTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self viewMoveBackWithType:JZTransitionAnimationTypeViewMoveToNextVC andContext:transitionContext];
}
-(void)viewMoveNormalNextTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self viewMoveNextWithType:JZTransitionAnimationTypeViewMoveNormalToNextVC andContext:transitionContext];
}
-(void)viewMoveNormalBackTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self viewMoveBackWithType:JZTransitionAnimationTypeViewMoveNormalToNextVC andContext:transitionContext];
}


// *********************************************************************************************
-(void)coverNextTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self coverTransitionNextAnimationWithContext:transitionContext];
}
-(void)coverBackTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self coverTransitionBackAnimationWithContext:transitionContext];
}



// *********************************************************************************************
-(void)spreadFromRightNextTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self spreadNextWithType:JZTransitionAnimationTypeSpreadFromRight andTransitonContext:transitionContext];
}
-(void)spreadFromRightBackTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self spreadBackWithType:JZTransitionAnimationTypeSpreadFromRight andTransitonContext:transitionContext];
}
-(void)spreadFromLeftNextTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self spreadNextWithType:JZTransitionAnimationTypeSpreadFromLeft andTransitonContext:transitionContext];
}
-(void)spreadFromLeftBackTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self spreadBackWithType:JZTransitionAnimationTypeSpreadFromLeft andTransitonContext:transitionContext];
}
-(void)spreadFromTopNextTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self spreadNextWithType:JZTransitionAnimationTypeSpreadFromTop andTransitonContext:transitionContext];
}
-(void)spreadFromTopBackTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self spreadBackWithType:JZTransitionAnimationTypeSpreadFromTop andTransitonContext:transitionContext];
}
-(void)spreadFromBottomNextTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self spreadNextWithType:JZTransitionAnimationTypeSpreadFromBottom andTransitonContext:transitionContext];
}
-(void)spreadFromBottomBackTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self spreadBackWithType:JZTransitionAnimationTypeSpreadFromBottom andTransitonContext:transitionContext];
}
-(void)pointSpreadPresentNextTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self pointSpreadNextWithContext:transitionContext];
}
-(void)pointSpreadPresentBackTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self pointSpreadBackWithContext:transitionContext];
}


// *********************************************************************************************
-(void)boomPresentNextTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self boomPresentTransitionNextAnimation:transitionContext];
}
-(void)boomPresentBackTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self boomPresentTransitionBackAnimation:transitionContext];
}


// *********************************************************************************************
-(void)brickOpenVerticalNextTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self brickOpenNextWithType:JZTransitionAnimationTypeBrickOpenVertical andTransitionContext:transitionContext];
}
-(void)brickOpenVerticalBackTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self brickOpenBackWithType:JZTransitionAnimationTypeBrickOpenVertical andTransitionContext:transitionContext];
}
-(void)brickOpenHorizontalNextTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
     [self brickOpenNextWithType:JZTransitionAnimationTypeBrickOpenHorizontal andTransitionContext:transitionContext];
}
-(void)brickOpenHorizontalBackTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self brickOpenBackWithType:JZTransitionAnimationTypeBrickOpenHorizontal andTransitionContext:transitionContext];
}
-(void)brickCloseVerticalNextTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
     [self brickCloseNextWithType:JZTransitionAnimationTypeBrickCloseVertical andTransitionContext:transitionContext];
}
-(void)brickCloseVerticalBackTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self brickCloseBackWithType:JZTransitionAnimationTypeBrickCloseVertical andTransitionContext:transitionContext];
}
-(void)brickCloseHorizontalNextTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self brickCloseNextWithType:JZTransitionAnimationTypeBrickCloseHorizontal andTransitionContext:transitionContext];
}
-(void)brickCloseHorizontalBackTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self brickCloseBackWithType:JZTransitionAnimationTypeBrickCloseHorizontal andTransitionContext:transitionContext];
}


// *********************************************************************************************
-(void)insideThenPushNextTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self insideThenPushNextAnimationWithContext:transitionContext];
}
-(void)insideThenPushBackTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    [self insideThenPushBackAnimationWithContext:transitionContext];
}



// *********************************************************************************************
-(void)fragmentShowFromRightNextTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self fragmentShowNextType:JZTransitionAnimationTypeFragmentShowFromRight andContext:transitionContext];
}
-(void)fragmentShowFromRightBackTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self fragmentShowBackType:JZTransitionAnimationTypeFragmentShowFromRight andContext:transitionContext];
}
-(void)fragmentShowFromLeftNextTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self fragmentShowNextType:JZTransitionAnimationTypeFragmentShowFromLeft andContext:transitionContext];
}
-(void)fragmentShowFromLeftBackTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self fragmentShowBackType:JZTransitionAnimationTypeFragmentShowFromLeft andContext:transitionContext];
}
-(void)fragmentShowFromTopNextTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self fragmentShowNextType:JZTransitionAnimationTypeFragmentShowFromTop andContext:transitionContext];
}
-(void)fragmentShowFromTopBackTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self fragmentShowBackType:JZTransitionAnimationTypeFragmentShowFromTop andContext:transitionContext];
}
-(void)fragmentShowFromBottomNextTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self fragmentShowNextType:JZTransitionAnimationTypeFragmentShowFromBottom andContext:transitionContext];
}
-(void)fragmentShowFromBottomBackTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self fragmentShowBackType:JZTransitionAnimationTypeFragmentShowFromBottom andContext:transitionContext];
}
-(void)fragmentHideFromRightNextTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self fragmentHideNextType:JZTransitionAnimationTypeFragmentHideFromRight andContext:transitionContext];
}
-(void)fragmentHideFromRightBackTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self fragmentHideBackType:JZTransitionAnimationTypeFragmentHideFromRight andContext:transitionContext];
}
-(void)fragmentHideFromLefttNextTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self fragmentHideNextType:JZTransitionAnimationTypeFragmentHideFromLeft andContext:transitionContext];
}
-(void)fragmentHideFromLeftBackTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self fragmentHideBackType:JZTransitionAnimationTypeFragmentHideFromLeft andContext:transitionContext];
}
-(void)fragmentHideFromTopNextTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self fragmentHideNextType:JZTransitionAnimationTypeFragmentHideFromTop andContext:transitionContext];
}
-(void)fragmentHideFromTopBackTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self fragmentHideBackType:JZTransitionAnimationTypeFragmentHideFromTop andContext:transitionContext];
}
-(void)fragmentHideFromBottomNextTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self fragmentHideNextType:JZTransitionAnimationTypeFragmentHideFromBottom andContext:transitionContext];
}
-(void)fragmentHideFromBottomBackTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext{
    [self fragmentHideBackType:JZTransitionAnimationTypeFragmentHideFromBottom andContext:transitionContext];
}
// *********************************************************************************************

#pragma mark - Other
- (void)removeDelegate {
    
    UIViewController *fromVC = [_transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [_transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];

    void (^RemoveDelegateBlock)() = ^(){
        
        fromVC.transitioningDelegate = nil;
        fromVC.navigationController.delegate = nil;
        toVC.transitioningDelegate = nil;
        toVC.navigationController.delegate = nil;

    };
    
    switch (self.transitionType) {
        case JZTransitionTypePush:
        case JZTransitionTypePresent:{ //Next
            if (self.isSysBackAnimation) {
                RemoveDelegateBlock ? RemoveDelegateBlock() : nil;
            }
        }
            break;
        default:{ //Back
            RemoveDelegateBlock ? RemoveDelegateBlock() : nil;
        }
            break;
    }

}


-(void)setAnimationType:(JZTransitionAnimationType)animationType {
    _animationType = animationType;
    [self backAnimationTypeFromAnimationType:animationType];
}

+(JZTransitionManager *)copyPropertyFromObjcet:(id)object toObjcet:(id)targetObjcet {
    
    JZTransitionProperty *propery = object;
    JZTransitionManager *transition = targetObjcet;
    
    transition.animationTime = propery.animationTime;
    transition.transitionType = propery.transitionType;
    transition.animationType = propery.animationType;
    transition.isSysBackAnimation = propery.isSysBackAnimation;
    transition.backGestureType = propery.backGestureType;
    transition.backGestureEnable = propery.backGestureEnable;
    transition.startView = propery.startView;
    transition.targetView = propery.targetView;

    return transition;
    
}

@end
