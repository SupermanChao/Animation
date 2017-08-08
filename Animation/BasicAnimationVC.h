//
//  BasicAnimationVC.h
//  Animation-Demo
//
//  Created by 刘超 on 2017/7/31.
//  Copyright © 2017年 ogemray. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, LCBasicType) {
    LCBasicType_Position_XAndY = 0,
    LCBasicType_Translation_XAndY = 1,
    LCBasicType_Transform_Rotation_X = 2,
    LCBasicType_Transform_Rotation_Y = 3,
    LCBasicType_Transform_Rotation_Z = 4,
    LCBasicType_Transform_Scale = 5,
    LCBasicType_Bounds_XAndY = 6,
    LCBasicType_Bounds_WidthAndHeight = 7,
    LCBasicType_CornerRadiusAndBorderWidthAndBorderColor = 8,
    LCBasicType_Opacity = 9,
    LCBasicType_BackgroundColor = 10,
    LCBasicType_Contents = 11,
    LCBasicType_ShadowOffset = 12,
    LCBasicType_ShadowColor = 13,
    LCBasicType_ShadowOpacity = 14,
    LCBasicType_ShadowRadius = 15
};

@interface BasicAnimationVC : UIViewController

///动画类型
@property (nonatomic, assign) LCBasicType type;

@property (nonatomic, copy) NSString *topTitle;

@end
