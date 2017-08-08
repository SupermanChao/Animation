//
//  TransitionVC.h
//  Animation-Demo
//
//  Created by 刘超 on 2017/7/31.
//  Copyright © 2017年 ogemray. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, LCTransitionType) {
    
    LCTransitionType_kCATransitionPush_kCATransitionFromRight = 0,
    LCTransitionType_kCATransitionFade_kCATransitionFromRight = 1,
    LCTransitionType_kCATransitionMoveIn_kCATransitionFromRight = 2,
    LCTransitionType_kCATransitionReveal_kCATransitionFromRight = 3,
    LCTransitionType_cube_kCATransitionFromRight = 4
    
};

@interface TransitionVC : UIViewController

///动画类型
@property (nonatomic, assign) LCTransitionType type;

@end
