//
//  JZTypedefConfig.h
//  JZTransition
//
//  Created by 裴建忠 on 16/6/3.
//  Copyright © 2016年 裴建忠. All rights reserved.
//

#ifndef JZTypedefConfig_h
#define JZTypedefConfig_h


// ************** Enum **************
typedef NS_ENUM(NSInteger,JZTransitionAnimationType){
    //----------- 系统 ------------
    JZTransitionAnimationTypeSysFade = 1,                   //淡入淡出
    
    JZTransitionAnimationTypeSysPushFromRight,
    JZTransitionAnimationTypeSysPushFromLeft,
    JZTransitionAnimationTypeSysPushFromTop,
    JZTransitionAnimationTypeSysPushFromBottom,//Push
    
    JZTransitionAnimationTypeSysRevealFromRight,
    JZTransitionAnimationTypeSysRevealFromLeft,
    JZTransitionAnimationTypeSysRevealFromTop,
    JZTransitionAnimationTypeSysRevealFromBottom,//揭开
    
    JZTransitionAnimationTypeSysMoveInFromRight,
    JZTransitionAnimationTypeSysMoveInFromLeft,
    JZTransitionAnimationTypeSysMoveInFromTop,
    JZTransitionAnimationTypeSysMoveInFromBottom,//覆盖
    
    JZTransitionAnimationTypeSysCubeFromRight,
    JZTransitionAnimationTypeSysCubeFromLeft,
    JZTransitionAnimationTypeSysCubeFromTop,
    JZTransitionAnimationTypeSysCubeFromBottom,//立方体
    
    JZTransitionAnimationTypeSysSuckEffect,                 //吮吸
    
    JZTransitionAnimationTypeSysOglFlipFromRight,
    JZTransitionAnimationTypeSysOglFlipFromLeft,
    JZTransitionAnimationTypeSysOglFlipFromTop,
    JZTransitionAnimationTypeSysOglFlipFromBottom, //翻转
    
    JZTransitionAnimationTypeSysRippleEffect,               //波纹
    
    JZTransitionAnimationTypeSysPageCurlFromRight,
    JZTransitionAnimationTypeSysPageCurlFromLeft,
    JZTransitionAnimationTypeSysPageCurlFromTop,
    JZTransitionAnimationTypeSysPageCurlFromBottom,//翻页
    
    JZTransitionAnimationTypeSysPageUnCurlFromRight,
    JZTransitionAnimationTypeSysPageUnCurlFromLeft,
    JZTransitionAnimationTypeSysPageUnCurlFromTop,
    JZTransitionAnimationTypeSysPageUnCurlFromBottom,//反翻页
    
    JZTransitionAnimationTypeSysCameraIrisHollowOpen,       //开镜头
    
    JZTransitionAnimationTypeSysCameraIrisHollowClose,      //关镜头
    
    //----------- 自定义 ------------
    JZTransitionAnimationTypeDefault,
    
    JZTransitionAnimationTypePageTransition,
    
    JZTransitionAnimationTypeViewMoveToNextVC,
    JZTransitionAnimationTypeViewMoveNormalToNextVC,
    
    JZTransitionAnimationTypeCover,
    
    JZTransitionAnimationTypeSpreadFromRight,
    JZTransitionAnimationTypeSpreadFromLeft,
    JZTransitionAnimationTypeSpreadFromTop,
    JZTransitionAnimationTypeSpreadFromBottom,
    JZTransitionAnimationTypePointSpreadPresent,
    
    JZTransitionAnimationTypeBoom,
    
    JZTransitionAnimationTypeBrickOpenVertical,
    JZTransitionAnimationTypeBrickOpenHorizontal,
    JZTransitionAnimationTypeBrickCloseVertical,
    JZTransitionAnimationTypeBrickCloseHorizontal,
    
    JZTransitionAnimationTypeInsideThenPush,
    
    JZTransitionAnimationTypeFragmentShowFromRight,
    JZTransitionAnimationTypeFragmentShowFromLeft,
    JZTransitionAnimationTypeFragmentShowFromTop,
    JZTransitionAnimationTypeFragmentShowFromBottom,
    
    JZTransitionAnimationTypeFragmentHideFromRight,
    JZTransitionAnimationTypeFragmentHideFromLeft,
    JZTransitionAnimationTypeFragmentHideFromTop,
    JZTransitionAnimationTypeFragmentHideFromBottom,
    
};

typedef NS_ENUM(NSInteger,JZTransitionType){
    
    JZTransitionTypePop,
    JZTransitionTypePush,
    JZTransitionTypePresent,
    JZTransitionTypeDismiss,
};


typedef NS_ENUM(NSInteger,JZGestureType){

    JZGestureTypeNone,
    JZGestureTypePanLeft,
    JZGestureTypePanRight,
    JZGestureTypePanUp,
    JZGestureTypePanDown,
    
};
//系统动画类型
typedef NS_ENUM(NSInteger,JZTransitionSysAnimationType){
    
    JZTransitionSysAnimationTypeFade = 1,                   //淡入淡出
    JZTransitionSysAnimationTypePush,                       //推挤
    JZTransitionSysAnimationTypeReveal,                     //揭开
    JZTransitionSysAnimationTypeMoveIn,                     //覆盖
    JZTransitionSysAnimationTypeCube,                       //立方体
    JZTransitionSysAnimationTypeSuckEffect,                 //吮吸
    JZTransitionSysAnimationTypeOglFlip,                    //翻转
    JZTransitionSysAnimationTypeRippleEffect,               //波纹
    JZTransitionSysAnimationTypePageCurl,                   //翻页
    JZTransitionSysAnimationTypePageUnCurl,                 //反翻页
    JZTransitionSysAnimationTypeCameraIrisHollowOpen,       //开镜头
    JZTransitionSysAnimationTypeCameraIrisHollowClose,      //关镜头
    JZTransitionSysAnimationTypeCurlDown,                   //下翻页
    JZTransitionSysAnimationTypeCurlUp,                     //上翻页
    JZTransitionSysAnimationTypeFlipFromLeft,               //左翻转
    JZTransitionSysAnimationTypeFlipFromRight,              //右翻转
    
};



#endif /* JZTypedefConfig_h */
