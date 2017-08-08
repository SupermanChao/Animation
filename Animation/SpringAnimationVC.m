//
//  SpringAnimationVC.m
//  Animation-Demo
//
//  Created by 刘超 on 2017/8/2.
//  Copyright © 2017年 ogemray. All rights reserved.
//

#import "SpringAnimationVC.h"

@interface SpringAnimationVC ()

@property (nonatomic, strong) UIImageView *img;

@end

@implementation SpringAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.img];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    /**
     *  fillMode 视图在非Active时的行为
     *
     *  kCAFillModeForwards 动画开始之后layer迅速移到动画开始的位置
     *  kCAFillModeBackwards 动画被添加的那一刻(动画开始之前)layer迅速移到开始位置,并且在 removedOnCompletion 为 NO 的情况下,动画结束会移到layer本身的位置
     *  kCAFillModeBoth 动画添加的那一刻(动画开始之前)layer迅速移到开始位置,并且在 removedOnCompletion 为 NO 的情况下,动画结束layer会停留在动画结束的位置
     *  kCAFillModeRemoved  动画开始之后layer迅速移到动画开始的位置,并且在 removedOnCompletion 为 NO 的情况下,动画结束回忆道layer本身位置
     */
    
    /**
     *  timingFunction  动画节奏 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]
     *
     *  kCAMediaTimingFunctionLinear            匀速
     *  kCAMediaTimingFunctionEaseIn            慢进
     *  kCAMediaTimingFunctionEaseOut           慢出
     *  kCAMediaTimingFunctionEaseInEaseOut     慢进慢出
     *  kCAMediaTimingFunctionDefault           默认值(慢进慢出)
     */
    
    /**
     *  removedOnCompletion 动画执行完毕后是否从图层上移除 默认为 YES (动画结束layer移到本身位置)
     */
    
    /**
     *  这样个要配合使用 repeatDuration = repeatCount * duration(动画一遍持续时间,主要控制速度)
     *  repeatCount     动画重复执行次数
     *  repeatDuration  动画重复执行时间
     */
    
    
    /**
     *  CASpringAnimation的重要属性：
     *
     *  mass：质量（影响弹簧的惯性，质量越大，弹簧惯性越大，运动的幅度越大）
     *  stiffness：弹性系数（弹性系数越大，弹簧的运动越快）
     *  damping：阻尼系数（阻尼系数越大，弹簧的停止越快）
     *  initialVelocity：初始速率（弹簧动画的初始速度大小，弹簧运动的初始方向与初始速率的正负一致，若初始速率为0，表示忽略该属性）
     *  settlingDuration：结算时间（根据动画参数估算弹簧开始运动到停止的时间，动画设置的时间最好根据此时间来设置）
     */
    
    if (self.type == LCSpringType_Bounds) {
        [self animation_CASpringAnimation_bounds];
    }else {
        [self animation_CASpringAnimation_position];
    }
    
    NSLog(@"--->%ld",self.img.layer.animationKeys.count);
}

- (void)animation_CASpringAnimation_bounds
{
    CASpringAnimation *animation = [CASpringAnimation animationWithKeyPath:@"bounds"];
    animation.mass = 10.0;
    animation.stiffness = 5000;
    animation.damping = 10;
    animation.initialVelocity = 10.0f;
    animation.duration = animation.settlingDuration;
    animation.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 150, 150)];
    [self.img.layer addAnimation:animation forKey:@"bounds"];
}

- (void)animation_CASpringAnimation_position
{
    CASpringAnimation *animation = [CASpringAnimation animationWithKeyPath:@"position"];
    animation.mass = 10.0;
    animation.stiffness = 500;
    animation.damping = 10;
    animation.initialVelocity = 5.0f;
    animation.duration = animation.settlingDuration;
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(self.img.center.x, self.img.center.y + 200)];
    [self.img.layer addAnimation:animation forKey:@"position"];
}


- (UIImageView *)img
{
    if (!_img) {
        _img = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        if (self.type == LCSpringType_Bounds) {
            _img.center = self.view.center;
        }else {
            _img.center = CGPointMake(self.view.center.x, self.view.center.y - 150);
        }
        _img.backgroundColor = [UIColor greenColor];
        _img.layer.masksToBounds = YES;
        _img.layer.cornerRadius = 15.0;
    }
    return _img;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
