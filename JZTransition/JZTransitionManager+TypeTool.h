//
//  JZTransitionManager+TypeTool.h
//  JZTransition
//
//  Created by peijz on 16/9/20.
//  Copyright © 2016年 裴建忠. All rights reserved.
//

#import "JZTransitionManager.h"

@interface JZTransitionManager (TypeTool)
-(void)backAnimationTypeFromAnimationType:(JZTransitionAnimationType)type;
-(CATransition *)getSysTransitionWithType:(JZTransitionAnimationType )type;
@end
