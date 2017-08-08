//
//  SpringAnimationVC.h
//  Animation-Demo
//
//  Created by 刘超 on 2017/8/2.
//  Copyright © 2017年 ogemray. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, LCSpringType) {
    LCSpringType_Bounds = 0,
    LCSpringType_Position = 1
};

@interface SpringAnimationVC : UIViewController

///动画类型
@property (nonatomic, assign) LCSpringType type;

@end
