

#import <UIKit/UIKit.h>
#import "JZTypedefConfig.h"
@interface JZTransitionManager : NSObject<UIViewControllerAnimatedTransitioning>


@property (nonatomic, assign) NSTimeInterval                    animationTime;

@property (nonatomic, assign) JZTransitionType                 transitionType;

@property (nonatomic, assign) JZTransitionAnimationType        animationType;
@property (nonatomic, assign) JZTransitionAnimationType        backAnimationType;

@property (nonatomic, assign) JZGestureType                    backGestureType;

@property (nonatomic, assign) BOOL                              isSysBackAnimation;

@property (nonatomic, assign) BOOL                              backGestureEnable;

@property (nonatomic, weak) UIView                            *startView;
@property (nonatomic, weak) UIView                            *targetView;

@property (nonatomic, copy) void(^willEndInteractiveBlock)(BOOL success);


+(JZTransitionManager *)copyPropertyFromObjcet:(id)object toObjcet:(id)targetObjcet;

@property (nonatomic, copy) void(^completionBlock)();


@end
