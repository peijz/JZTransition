# JZTransition
#介绍

transition animation asset  一个界面转场动画集。

在平时开发中，有时候需要一些转场动画给界面调整增添一些活力，而实现这些动画相对比较繁琐。 为了让实现转场更简单，我写了这个界面转场动画集。 调整界面时，只要一行代码就可以实现这里面的动画。 包括系统提供的动画在内，目前有大概50种动画。

#使用方法

#1、首先导入头文件

#import "UINavigationController+JZTransition.h"

#2、一行代码就可以调用

Push:

 [self.navigationController jz_pushViewController:(UIViewController *) animationType:(JZTransitionAnimationType)];
Present:

[self jz_presentViewController:(UIViewController *) animationType:(WXSTransitionAnimationType) completion:^{

}];
说明： JZTransitionAnimationType是转场动画类型，通过这个枚举选择你想要的转场动画。

#3、支持属性修改

[self jz_presentViewController:<#(UIViewController *)#> makeTransition:^(JZTransitionManager *transition) {
transition.animationType =  JZTransitionAnimationTypePointSpreadPresent;
transition.animationTime = 1;
}];
可以通过transition设置动画时间、类型等属性，目前可修改属性不多，以后版本会增加

#4、特殊调用

像point Spread 、ViewMoveToNextVC这样的动画，需要个起始view，只要将目标控制器的startView指向这个view就可以了，代码如下；

view_move_next.gif

DetailViewController *vc = [[DetailViewController alloc] init];
CollectionViewCell *cell = (CollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
vc.startView = cell.imgView;
[self.navigationController jz_pushViewController:vc makeTransition:^(JZTransitionManager *transition) {
transition.animationType = JZTransitionAnimationTypeViewMoveToNextVC;
transition.animationTime = 1;
}];



#系统动画

iOS自身其实有许多不错的转场动画，在这个转场动画集里也进行了封装，使用方法跟自定义转场动画一样。

Push:

[self.navigationController jz_pushViewController:<#(UIViewController *)#> animationType:<#(JZTransitionAnimationType)#>];
Present:

[self jz_presentViewController:<#(UIViewController *)#> animationType:<#(JZTransitionAnimationType)#> completion:<#^(void)completion#>]


