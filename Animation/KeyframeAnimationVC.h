//
//  KeyframeAnimationVC.h
//  Animation-Demo
//
//  Created by 刘超 on 2017/7/31.
//  Copyright © 2017年 ogemray. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, LCKeyframeType) {
    
    LCKeyframeType_Position_rect = 0,
    LCKeyframeType_Position_circle = 1,
    LCKeyframeType_Scale = 2
    
};

@interface KeyframeAnimationVC : UIViewController

///动画类型
@property (nonatomic, assign) LCKeyframeType type;

@end
