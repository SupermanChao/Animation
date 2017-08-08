//
//  KeyframeAnimationVC.m
//  Animation-Demo
//
//  Created by 刘超 on 2017/7/31.
//  Copyright © 2017年 ogemray. All rights reserved.
//

#import "KeyframeAnimationVC.h"

@interface KeyframeAnimationVC ()

@property (nonatomic, strong) UIImageView *img;

@end

@implementation KeyframeAnimationVC

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
    
    if (self.type == LCKeyframeType_Position_rect) {
        
        [self animation_CAKeyframeAnimation_Rect];
        
    }else if (self.type == LCKeyframeType_Position_circle) {
        
        [self animation_CAKeyframeAnimation_Circle];
        
    }else {
        
        [self animation_CAKeyframeAnimation_Scale];
    }
    
    NSLog(@"--->%ld",self.img.layer.animationKeys.count);
    
}


//CAKeyframeAnimation矩形运动
- (void)animation_CAKeyframeAnimation_Rect
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.duration = 4.0;
    animation.repeatCount = 2;
    animation.repeatDuration = animation.duration * animation.repeatCount;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(self.img.center.x, self.img.center.y)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(self.img.center.x + 150, self.img.center.y)];
    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(self.img.center.x + 150, self.img.center.y + 150)];
    NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(self.img.center.x, self.img.center.y + 150)];
    NSValue *value5 = [NSValue valueWithCGPoint:CGPointMake(self.img.center.x, self.img.center.y)];
    animation.values = @[value1, value2, value3, value4, value5];
    animation.keyTimes = @[@0, @0.4, @0.5, @0.9, @1.0];
    
    /*  利用贝塞尔画的一个矩形,跟上面效果一样,只不过不能设置关键帧动画时间
     UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(self.img.center.x, self.img.center.y, 150, 150)];
     animation.path = path.CGPath;
     */
    
    [self.img.layer addAnimation:animation forKey:@"position"];
}

- (void)animation_CAKeyframeAnimation_Scale
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    animation.duration = 4.0;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.values = @[@1, @1.1, @1.2, @1.3, @1.4];
    [self.img.layer addAnimation:animation forKey:@"transform.scale"];
}

- (void)animation_CAKeyframeAnimation_Circle
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.duration = 3;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animation.repeatCount = 2;
    animation.repeatDuration = animation.repeatCount * animation.duration;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.img.center.x + 75, self.img.center.y) radius:75 startAngle:M_PI endAngle:3*M_PI clockwise:YES];
    
    animation.path = path.CGPath;
    [self.img.layer addAnimation:animation forKey:@"position"];
}

- (UIImageView *)img
{
    if (!_img) {
        _img = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        _img.center = self.view.center;
        _img.backgroundColor = [UIColor greenColor];
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
