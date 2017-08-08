//
//  TransitionVC.m
//  Animation-Demo
//
//  Created by 刘超 on 2017/7/31.
//  Copyright © 2017年 ogemray. All rights reserved.
//

#import "TransitionVC.h"

@interface TransitionVC ()

@property (nonatomic, strong) UIImageView *img;

@property (nonatomic, strong) NSArray *imgsArr;

@end

@implementation TransitionVC

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
     *  CATransition (type) 过渡动画的类型
     *
     *  kCATransitionFade   渐变
     *  kCATransitionMoveIn 覆盖
     *  kCATransitionPush   推出
     *  kCATransitionReveal 揭开(可以说是抽开)
     *
     *  私有动画类型的值有："cube"、"suckEffect"、"oglFlip"、 "rippleEffect"、"pageCurl"、"pageUnCurl"等等
     */
    
    /**
     *  CATransition (subtype) 过渡动画的方向
     *
     *  kCATransitionFromRight  从右边
     *  kCATransitionFromLeft   从左边
     *  kCATransitionFromTop    从顶部
     *  kCATransitionFromBottom 从底部
     */
    
    static int i = 0;
    i = i >= self.imgsArr.count-1 ? 0:i+1;
    self.img.image = [self.imgsArr objectAtIndex:i];
    CATransition *animation = [CATransition animation];
    animation.duration = 0.5;
    
    if (self.type == LCTransitionType_kCATransitionPush_kCATransitionFromRight) {
        
        animation.type = kCATransitionPush;
    }else if (self.type == LCTransitionType_kCATransitionFade_kCATransitionFromRight) {
        
        animation.type = kCATransitionFade;
    }else if (self.type == LCTransitionType_kCATransitionMoveIn_kCATransitionFromRight) {
        
        animation.type = kCATransitionMoveIn;
    }else if (self.type == LCTransitionType_kCATransitionReveal_kCATransitionFromRight) {
        
        animation.type = kCATransitionReveal;
    }else if (self.type == LCTransitionType_cube_kCATransitionFromRight) {
        
        animation.type = @"cube";
    }
    
    animation.subtype = kCATransitionFromRight;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.img.layer addAnimation:animation forKey:@"transition"];
    
    NSLog(@"--->%ld",self.img.layer.animationKeys.count);
    
}



- (UIImageView *)img
{
    if (!_img) {
        _img = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 130)];
        _img.center = self.view.center;
        _img.image = [self.imgsArr firstObject];
    }
    return _img;
}

- (UIImage *)returnImage1WithCGSize:(CGSize)size andColor:(UIColor *)color
{
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, size.width, size.height)];
    [color setFill];
    [path fill];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (NSArray *)imgsArr
{
    if (!_imgsArr) {
        _imgsArr = [NSArray arrayWithObjects:[self returnImage1WithCGSize:self.img.bounds.size andColor:[UIColor redColor]],
                    [self returnImage1WithCGSize:self.img.bounds.size andColor:[UIColor greenColor]],
                    [self returnImage1WithCGSize:self.img.bounds.size andColor:[UIColor cyanColor]],
                    [self returnImage1WithCGSize:self.img.bounds.size andColor:[UIColor magentaColor]], nil];
    }
    return _imgsArr;
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
