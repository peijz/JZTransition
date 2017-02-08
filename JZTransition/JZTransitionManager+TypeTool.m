//
//  JZTransitionManager+TypeTool.m
//  JZTransition
//
//  Created by peijz on 16/9/20.
//  Copyright © 2016年 裴建忠. All rights reserved.
//

#import "JZTransitionManager+TypeTool.h"

@implementation JZTransitionManager (TypeTool)


-(void)backAnimationTypeFromAnimationType:(JZTransitionAnimationType)type{
    
    switch (type) {
        case JZTransitionAnimationTypeSysFade:{
            self.backAnimationType = JZTransitionAnimationTypeSysFade;
        }
            break;
        case JZTransitionAnimationTypeSysPushFromRight:{
            self.backAnimationType = JZTransitionAnimationTypeSysPushFromLeft;
        }
            break;
        case JZTransitionAnimationTypeSysPushFromLeft:{
            self.backAnimationType = JZTransitionAnimationTypeSysPushFromRight;
        }
            break;
        case JZTransitionAnimationTypeSysPushFromTop:{
            self.backAnimationType = JZTransitionAnimationTypeSysPushFromBottom;
        }
            break;
        case JZTransitionAnimationTypeSysPushFromBottom:{
            self.backAnimationType = JZTransitionAnimationTypeSysPushFromTop;
        }
            break;
        case JZTransitionAnimationTypeSysRevealFromRight:{
            self.backAnimationType = JZTransitionAnimationTypeSysMoveInFromLeft;
        }
            break;
        case JZTransitionAnimationTypeSysRevealFromLeft:{
            self.backAnimationType = JZTransitionAnimationTypeSysMoveInFromRight;
        }
            break;
        case JZTransitionAnimationTypeSysRevealFromTop:{
            self.backAnimationType = JZTransitionAnimationTypeSysMoveInFromBottom;
        }
            break;
        case JZTransitionAnimationTypeSysRevealFromBottom:{
            self.backAnimationType = JZTransitionAnimationTypeSysMoveInFromTop;
        }
            break;
        case JZTransitionAnimationTypeSysMoveInFromRight:{
            self.backAnimationType = JZTransitionAnimationTypeSysRevealFromLeft;
        }
            break;
        case JZTransitionAnimationTypeSysMoveInFromLeft:{
            self.backAnimationType = JZTransitionAnimationTypeSysRevealFromRight;
            
        }
            break;
        case JZTransitionAnimationTypeSysMoveInFromTop:{
            self.backAnimationType = JZTransitionAnimationTypeSysRevealFromBottom;
        }
            break;
        case JZTransitionAnimationTypeSysMoveInFromBottom:{
            self.backAnimationType = JZTransitionAnimationTypeSysRevealFromTop;
        }
            break;
        case JZTransitionAnimationTypeSysCubeFromRight:{
            self.backAnimationType = JZTransitionAnimationTypeSysCubeFromLeft;
        }
            break;
        case JZTransitionAnimationTypeSysCubeFromLeft:{
            self.backAnimationType = JZTransitionAnimationTypeSysCubeFromRight;
        }
            break;
        case JZTransitionAnimationTypeSysCubeFromTop:{
            self.backAnimationType = JZTransitionAnimationTypeSysCubeFromBottom;
        }
            break;
        case JZTransitionAnimationTypeSysCubeFromBottom:{
            self.backAnimationType = JZTransitionAnimationTypeSysCubeFromTop;
            
        }
            break;
        case JZTransitionAnimationTypeSysSuckEffect:{
            self.backAnimationType = JZTransitionAnimationTypeSysSuckEffect;
        }
            break;
        case JZTransitionAnimationTypeSysOglFlipFromRight:{
            self.backAnimationType = JZTransitionAnimationTypeSysOglFlipFromLeft;
        }
            break;
        case JZTransitionAnimationTypeSysOglFlipFromLeft:{
            self.backAnimationType = JZTransitionAnimationTypeSysOglFlipFromRight;
        }
            break;
        case JZTransitionAnimationTypeSysOglFlipFromTop:{
            self.backAnimationType = JZTransitionAnimationTypeSysOglFlipFromBottom;
        }
            break;
        case JZTransitionAnimationTypeSysOglFlipFromBottom:{
            self.backAnimationType = JZTransitionAnimationTypeSysOglFlipFromTop;
        }
            break;
        case JZTransitionAnimationTypeSysRippleEffect:{
            self.backAnimationType = JZTransitionAnimationTypeSysRippleEffect;
        }
            break;
        case JZTransitionAnimationTypeSysPageCurlFromRight:{
            self.backAnimationType = JZTransitionAnimationTypeSysPageUnCurlFromRight;
        }
            break;
        case JZTransitionAnimationTypeSysPageCurlFromLeft:{
            self.backAnimationType = JZTransitionAnimationTypeSysPageUnCurlFromLeft;
        }
            break;
        case JZTransitionAnimationTypeSysPageCurlFromTop:{
            self.backAnimationType = JZTransitionAnimationTypeSysPageUnCurlFromBottom;
        }
            break;
        case JZTransitionAnimationTypeSysPageCurlFromBottom:{
            self.backAnimationType = JZTransitionAnimationTypeSysPageUnCurlFromTop;
        }
            break;
        case JZTransitionAnimationTypeSysPageUnCurlFromRight:{
            self.backAnimationType = JZTransitionAnimationTypeSysPageCurlFromRight;
        }
            break;
        caseJZTransitionAnimationTypeSysPageUnCurlFromLeft:{
            self.backAnimationType = JZTransitionAnimationTypeSysPageCurlFromLeft;
        }
            break;
        case JZTransitionAnimationTypeSysPageUnCurlFromTop:{
            self.backAnimationType = JZTransitionAnimationTypeSysPageCurlFromBottom;
        }
            break;
        case JZTransitionAnimationTypeSysPageUnCurlFromBottom:{
            self.backAnimationType = JZTransitionAnimationTypeSysPageCurlFromTop;
        }
            break;
        case JZTransitionAnimationTypeSysCameraIrisHollowOpen:{
            self.backAnimationType = JZTransitionAnimationTypeSysCameraIrisHollowClose;
        }
            break;
        case JZTransitionAnimationTypeSysCameraIrisHollowClose:{
            self.backAnimationType = JZTransitionAnimationTypeSysCameraIrisHollowOpen;
            
        }
            break;
        default:
            break;
    }
}

-(CATransition *)getSysTransitionWithType:(JZTransitionAnimationType )type{
    
    CATransition *tranAnimation=[CATransition animation];
    tranAnimation.duration= self.animationTime;
    tranAnimation.delegate = self;
    switch (type) {
        case JZTransitionAnimationTypeSysFade:{
            tranAnimation.type=kCATransitionFade;
        }
            break;
        case JZTransitionAnimationTypeSysPushFromRight:{
            tranAnimation.type = kCATransitionPush;
            tranAnimation.subtype=kCATransitionFromRight;
        }
            break;
        case JZTransitionAnimationTypeSysPushFromLeft:{
            tranAnimation.type = kCATransitionPush;
            tranAnimation.subtype=kCATransitionFromLeft;
        }
            break;
        case JZTransitionAnimationTypeSysPushFromTop:{
            tranAnimation.type = kCATransitionPush;
            tranAnimation.subtype=kCATransitionFromTop;
        }
            break;
        case JZTransitionAnimationTypeSysPushFromBottom:{
            tranAnimation.type = kCATransitionPush;
            tranAnimation.subtype=kCATransitionFromBottom;
            
        }
            break;
        case JZTransitionAnimationTypeSysRevealFromRight:{
            tranAnimation.type = kCATransitionReveal;
            tranAnimation.subtype=kCATransitionFromRight;
        }
            break;
        case JZTransitionAnimationTypeSysRevealFromLeft:{
            tranAnimation.type = kCATransitionReveal;
            tranAnimation.subtype=kCATransitionFromLeft;
        }
            break;
        case JZTransitionAnimationTypeSysRevealFromTop:{
            tranAnimation.type = kCATransitionReveal;
            tranAnimation.subtype=kCATransitionFromTop;
        }
            break;
        case JZTransitionAnimationTypeSysRevealFromBottom:{
            tranAnimation.type = kCATransitionReveal;
            tranAnimation.subtype=kCATransitionFromBottom;
        }
            break;
        case JZTransitionAnimationTypeSysMoveInFromRight:{
            tranAnimation.type = kCATransitionMoveIn;
            tranAnimation.subtype=kCATransitionFromRight;
        }
            break;
        case JZTransitionAnimationTypeSysMoveInFromLeft:{
            tranAnimation.type = kCATransitionMoveIn;
            tranAnimation.subtype=kCATransitionFromLeft;
        }
            break;
        case JZTransitionAnimationTypeSysMoveInFromTop:{
            tranAnimation.type = kCATransitionMoveIn;
            tranAnimation.subtype=kCATransitionFromTop;
        }
            break;
        case JZTransitionAnimationTypeSysMoveInFromBottom:{
            tranAnimation.type = kCATransitionMoveIn;
            tranAnimation.subtype=kCATransitionFromBottom;
        }
            break;
        case JZTransitionAnimationTypeSysCubeFromRight:{
            tranAnimation.type = @"cube";
            tranAnimation.subtype=kCATransitionFromRight;
        }
            break;
        case JZTransitionAnimationTypeSysCubeFromLeft:{
            tranAnimation.type = @"cube";
            tranAnimation.subtype=kCATransitionFromLeft;
        }
            break;
        case JZTransitionAnimationTypeSysCubeFromTop:{
            tranAnimation.type=@"cube";
            tranAnimation.subtype=kCATransitionFromTop;
        }
            break;
        case JZTransitionAnimationTypeSysCubeFromBottom:{
            tranAnimation.type=@"cube";
            tranAnimation.subtype=kCATransitionFromBottom;
        }
            break;
        case JZTransitionAnimationTypeSysSuckEffect:{
            tranAnimation.type=@"suckEffect";
        }
            break;
        case JZTransitionAnimationTypeSysOglFlipFromRight:{
            tranAnimation.type=@"oglFlip";
            tranAnimation.subtype=kCATransitionFromRight;
        }
            break;
        case JZTransitionAnimationTypeSysOglFlipFromLeft:{
            tranAnimation.type=@"oglFlip";
            tranAnimation.subtype=kCATransitionFromLeft;
        }
            break;
        case JZTransitionAnimationTypeSysOglFlipFromTop:{
            tranAnimation.type=@"oglFlip";
            tranAnimation.subtype=kCATransitionFromTop;
        }
            break;
        case JZTransitionAnimationTypeSysOglFlipFromBottom:{
            tranAnimation.type=@"oglFlip";
            tranAnimation.subtype=kCATransitionFromBottom;
        }
            break;
        case JZTransitionAnimationTypeSysRippleEffect:{
            tranAnimation.type=@"rippleEffect";
        }
            break;
        case JZTransitionAnimationTypeSysPageCurlFromRight:{
            tranAnimation.type=@"pageCurl";
            tranAnimation.subtype=kCATransitionFromRight;
        }
            break;
        case JZTransitionAnimationTypeSysPageCurlFromLeft:{
            tranAnimation.type=@"pageCurl";
            tranAnimation.subtype=kCATransitionFromLeft;
        }
            break;
        case JZTransitionAnimationTypeSysPageCurlFromTop:{
            tranAnimation.type=@"pageCurl";
            tranAnimation.subtype=kCATransitionFromTop;
        }
            break;
        case JZTransitionAnimationTypeSysPageCurlFromBottom:{
            tranAnimation.type=@"pageCurl";
            tranAnimation.subtype=kCATransitionFromBottom;
        }
            break;
        case JZTransitionAnimationTypeSysPageUnCurlFromRight:{
            tranAnimation.type=@"pageUnCurl";
            tranAnimation.subtype=kCATransitionFromRight;
        }
            break;
        case JZTransitionAnimationTypeSysPageUnCurlFromLeft:{
            tranAnimation.type=@"pageUnCurl";
            tranAnimation.subtype=kCATransitionFromLeft;
        }
            break;
        case JZTransitionAnimationTypeSysPageUnCurlFromTop:{
            tranAnimation.type=@"pageUnCurl";
            tranAnimation.subtype=kCATransitionFromTop;
        }
            break;
        case JZTransitionAnimationTypeSysPageUnCurlFromBottom:{
            tranAnimation.type=@"pageUnCurl";
            tranAnimation.subtype=kCATransitionFromBottom;
        }
            break;
        case JZTransitionAnimationTypeSysCameraIrisHollowOpen:{
            tranAnimation.type=@"cameraIrisHollowOpen";
        }
            break;
        case JZTransitionAnimationTypeSysCameraIrisHollowClose:{
            tranAnimation.type=@"cameraIrisHollowClose";
        }
            break;
        default:
            break;
    }
    return tranAnimation;
}
@end
