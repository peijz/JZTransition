
#import <UIKit/UIKit.h>
#import "JZTransitionManager.h"
#import "JZTransitionProperty.h"
#import "JZPercentDrivenInteractiveTransition.h"

typedef void(^JZTransitionBlock)(JZTransitionProperty *transition);

@interface UIViewController (JZTransition) <UIViewControllerTransitioningDelegate,UINavigationControllerDelegate>




- (void)jz_presentViewController:(UIViewController *)viewControllerToPresent animationType:(JZTransitionAnimationType )animationType completion:(void (^)(void))completion;
- (void)jz_presentViewController:(UIViewController *)viewControllerToPresent makeTransition:(JZTransitionBlock)transitionBlock;
- (void)jz_presentViewController:(UIViewController *)viewControllerToPresent makeTransition:(JZTransitionBlock)transitionBlock completion:(void (^)(void))completion;


@end


