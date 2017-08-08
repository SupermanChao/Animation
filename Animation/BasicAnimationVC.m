//
//  BasicAnimationVC.m
//  Animation-Demo
//
//  Created by 刘超 on 2017/7/31.
//  Copyright © 2017年 ogemray. All rights reserved.
//

#import "BasicAnimationVC.h"

@interface BasicAnimationVC ()

@property (nonatomic, strong) UIImageView *img;

@end

@implementation BasicAnimationVC

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
    
    switch (self.type) {
        case LCBasicType_Position_XAndY:
        {
            [self animation_CABasicAnimation_position_y];
            [self animation_CABasicAnimation_position_x];
        }
            break;
        case LCBasicType_Translation_XAndY:
        {
            [self animation_CABasicAnimation_translation_x];
            [self animation_CABasicAnimation_translation_y];
        }
            break;
        case LCBasicType_Transform_Rotation_X:
        {
            [self animation_CABasicAnimation_transform_rotation_x];
        }
            break;
        case LCBasicType_Transform_Rotation_Y:
        {
            [self animation_CABasicAnimation_transform_rotation_y];
        }
            break;
        case LCBasicType_Transform_Rotation_Z:
        {
            [self animation_CABasicAnimation_transform_rotation_z];
        }
            break;
        case LCBasicType_Transform_Scale:
        {
            [self animation_CABasicAnimation_transform_scale];
        }
            break;
        case LCBasicType_Bounds_XAndY:
        {
            [self animation_CABasicAnimation_bounds_x];
            [self animation_CABasicAnimation_bounds_y];
        }
            break;
        case LCBasicType_Bounds_WidthAndHeight:
        {
            [self animation_CABasicAnimation_bounds_width];
            [self animation_CABasicAnimation_bounds_height];
        }
            break;
        case LCBasicType_CornerRadiusAndBorderWidthAndBorderColor:
        {
            [self animation_CABasicAnimation_cornerRadius];
            [self animation_CABasicAnimation_borderWidth];
            [self animation_CABasicAnimation_borderColor];
        }
            break;
        case LCBasicType_Opacity:
        {
            [self animation_CABasicAnimation_opacity];
        }
            break;
        case LCBasicType_BackgroundColor:
        {
            [self animation_CABasicAnimation_backgroundColor];
        }
            break;
        case LCBasicType_Contents:
        {
            [self animation_CABasicAnimation_contents];
        }
            break;
        case LCBasicType_ShadowOffset:
        {
            [self animation_CABasicAnimation_shadowOffset];
        }
            break;
        case LCBasicType_ShadowColor:
        {
            [self animation_CABasicAnimation_shadowColor];
        }
            break;
        case LCBasicType_ShadowOpacity:
        {
            [self animation_CABasicAnimation_shadowOpacity];
        }
            break;
        case LCBasicType_ShadowRadius:
        {
            [self animation_CABasicAnimation_shadowRadius];
        }
            break;
        default:
            break;
    }
    
    NSLog(@"--->%ld",self.img.layer.animationKeys.count);
    
}

#pragma mark ------<移动>
/**
 *  position fromValue:默认自身位置为起始位置  toValue:移动后的位置
 *  transform.translation  fromValue:默认自身位置为起始位置(默认0)  toValue:相对于layer原始位置距离
 */

/// y轴方向移动  fromValue:默认自身位置为起始位置 toValue:移动后的位置
- (void)animation_CABasicAnimation_position_y
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position.y"];
    //animation.fromValue = @(self.img.center.y); 默认初始位置
    animation.toValue = @(self.img.center.y + 100);
    animation.duration = 3;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.img.layer addAnimation:animation forKey:@"position.y"];
}

- (void)animation_CABasicAnimation_position_x
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position.x"];
    //animation.fromValue = @(self.img.center.x); 默认初始位置
    animation.toValue = @(self.img.center.x + 100);
    animation.duration = 3;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.img.layer addAnimation:animation forKey:@"position.x"];
}

- (void)animation_CABasicAnimation_translation_x
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    //animation.fromValue = @0; 默认初始位置
    animation.toValue = @100;
    animation.duration = 3;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.img.layer addAnimation:animation forKey:@"transform.translation.x"];
}

- (void)animation_CABasicAnimation_translation_y
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
    //animation.fromValue = @0; 默认初始位置
    animation.toValue = @100;
    animation.duration = 3;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.img.layer addAnimation:animation forKey:@"transform.translation.y"];
}


#pragma mark ------<旋转>
- (void)animation_CABasicAnimation_transform_rotation_x
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
    animation.toValue = @(M_PI * 2);
    animation.duration = 3;
    animation.repeatCount = 10;
    animation.repeatDuration = animation.repeatCount * animation.duration;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.img.layer addAnimation:animation forKey:@"transform.rotation.x"];
}

- (void)animation_CABasicAnimation_transform_rotation_y
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    animation.toValue = @(M_PI * 2);
    animation.duration = 3;
    animation.repeatCount = 10;
    animation.repeatDuration = animation.repeatCount * animation.duration;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.img.layer addAnimation:animation forKey:@"transform.rotation.y"];
}

- (void)animation_CABasicAnimation_transform_rotation_z
{
    //transform_rotation = transform.rotation.z
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.toValue = @(M_PI * 2);
    animation.duration = 1;
    animation.repeatCount = 10;
    animation.repeatDuration = animation.repeatCount * animation.duration;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.img.layer addAnimation:animation forKey:@"transform.rotation.z"];
}

#pragma mark ------<缩放>

- (void)animation_CABasicAnimation_transform_scale
{
    //transform.scale.x transform.scale.y transform.scale.z
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.toValue = @8.0;
    animation.duration = 3;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.img.layer addAnimation:animation forKey:@"transform.scale"];
}

#pragma mark ------<自身大小相关>

/**
 *  动画view图层上图层和view上的其他控件 不动画view本身
 *  fromValue: 默认为layer初始布局位置 (0)
 *  toValue: 方向x 右为负 左为正
 */
- (void)animation_CABasicAnimation_bounds_x
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"bounds.origin.x"];
    //animation.fromValue = @0; 默认自身位置为开始位置 为0
    animation.toValue = @(-self.img.bounds.size.width * 0.5);
    animation.duration = 3;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.img.layer addAnimation:animation forKey:@"bounds.origin.x"];
}

/**
 *  动画view图层上图层和view上的其他控件 不动画view本身
 *  fromValue: 默认为layer初始布局位置 (0)
 *  toValue: 方向y 上为负 下为正
 */
- (void)animation_CABasicAnimation_bounds_y
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"bounds.origin.y"];
    //animation.fromValue = @0; 默认自身位置为开始位置 为0
    animation.toValue = @(-self.img.bounds.size.height * 0.5);
    animation.duration = 3;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.img.layer addAnimation:animation forKey:@"bounds.origin.y"];
}

/**
 *  动画view本身 不动画view上的其他控件
 */
- (void)animation_CABasicAnimation_bounds_width
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"bounds.size.width"];
    //animation.fromValue = @(self.img.bounds.size.width); 默认起始值为自身宽度
    animation.toValue = @(self.img.bounds.size.width * 0.5);
    animation.duration = 3;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.img.layer addAnimation:animation forKey:@"bounds.size.width"];
}

/**
 *  动画view本身 不动画view上的其他控件
 */
- (void)animation_CABasicAnimation_bounds_height
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"bounds.size.height"];
    //animation.fromValue = @(self.img.bounds.size.height); 默认起始值为自身高度
    animation.toValue = @(self.img.bounds.size.height * 0.5);
    animation.duration = 3;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.img.layer addAnimation:animation forKey:@"bounds.size.height"];
}

#pragma mark ------<边角动画>
/// 圆角动画 默认从自身现有状态为开始
- (void)animation_CABasicAnimation_cornerRadius
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    //animation.fromValue = @(self.img.layer.cornerRadius); 默认自身圆角为起始值
    animation.toValue = @50;
    animation.duration = 3;
    animation.repeatCount = 3;
    animation.repeatDuration = animation.duration * animation.repeatCount;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.img.layer addAnimation:animation forKey:@"cornerRadius"];
}

- (void)animation_CABasicAnimation_borderWidth
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"borderWidth"];
    //animation.fromValue = @(self.img.layer.borderWidth); 默认自身边框宽度为起始值
    animation.toValue = @20;
    animation.duration = 3;
    animation.repeatCount = 3;
    animation.repeatDuration = animation.duration * animation.repeatCount;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.img.layer addAnimation:animation forKey:@"borderWidth"];
}

- (void)animation_CABasicAnimation_borderColor
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"borderColor"];
    //animation.toValue = (__bridge id _Nullable)([self.img.layer borderColor]); //默认自身边框颜色为起始值
    animation.toValue = (__bridge id _Nullable)([[UIColor cyanColor] CGColor]);
    animation.duration = 3;
    animation.repeatCount = 3;
    animation.repeatDuration = animation.duration * animation.repeatCount;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.img.layer addAnimation:animation forKey:@"borderColor"];
}

#pragma mark ------<自身的一些属性>
/// 透明度(不透明 -> 透明)
- (void)animation_CABasicAnimation_opacity
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation.fromValue = @1;
    animation.toValue = @0;
    animation.duration = 3;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.img.layer addAnimation:animation forKey:@"opacity"];
}

- (void)animation_CABasicAnimation_backgroundColor
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    animation.toValue = (__bridge id _Nullable)([[UIColor yellowColor] CGColor]);
    animation.duration = 3;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.img.layer addAnimation:animation forKey:@"backgroundColor"];
}

- (void)animation_CABasicAnimation_contents
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"contents"];
    animation.fromValue = (__bridge id _Nullable)([[UIImage imageNamed:@"春雨医生"] CGImage]);
    animation.toValue = (__bridge id _Nullable)([[UIImage imageNamed:@"丁香医生"] CGImage]);
    animation.duration = 3;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.img.layer addAnimation:animation forKey:@"contents"];
}

#pragma mark ------<阴影动画>
- (void)animation_CABasicAnimation_shadowOffset
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"shadowOffset"];
    animation.fromValue = [NSValue valueWithCGSize:CGSizeMake(0, 0)];
    animation.toValue = [NSValue valueWithCGSize:CGSizeMake(20, 20)];
    animation.duration = 3;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.img.layer addAnimation:animation forKey:@"shadowOffset"];
}

- (void)animation_CABasicAnimation_shadowColor
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"shadowColor"];
    animation.toValue = (__bridge id _Nullable)([UIColor redColor].CGColor);
    animation.duration = 3;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.img.layer addAnimation:animation forKey:@"shadowColor"];
}

- (void)animation_CABasicAnimation_shadowOpacity
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"shadowOpacity"];
    animation.fromValue = @0;
    animation.toValue = @1;
    animation.duration = 3;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.img.layer addAnimation:animation forKey:@"shadowOpacity"];
}

- (void)animation_CABasicAnimation_shadowRadius
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"shadowRadius"];
    animation.fromValue = @3;
    animation.toValue = @10;
    animation.duration = 3;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.img.layer addAnimation:animation forKey:@"shadowRadius"];
}

- (UIImageView *)img
{
    if (!_img) {
        _img = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        _img.center = self.view.center;
        _img.backgroundColor = [UIColor greenColor];
        _img.layer.borderColor = [[UIColor yellowColor] CGColor];
        
        if (self.type == LCBasicType_CornerRadiusAndBorderWidthAndBorderColor) {
            _img.layer.masksToBounds = YES;
        }
        
        if (self.type == LCBasicType_ShadowOffset) {
            _img.layer.shadowOpacity = 0.5;
            _img.layer.shadowOffset = CGSizeMake(0, 0);
        }else if (self.type == LCBasicType_ShadowColor || self.type == LCBasicType_ShadowOpacity || self.type == LCBasicType_ShadowRadius) {
            _img.layer.shadowOpacity = 0.5;
            _img.layer.shadowOffset = CGSizeMake(20, 20);
        }
        
        if (self.type == LCBasicType_Transform_Rotation_X || self.type == LCBasicType_Transform_Rotation_Y || self.type == LCBasicType_Transform_Rotation_Z || self.type == LCBasicType_Transform_Scale || self.type == LCBasicType_Bounds_XAndY || self.type == LCBasicType_Bounds_WidthAndHeight || self.type == LCBasicType_CornerRadiusAndBorderWidthAndBorderColor || self.type == LCBasicType_Opacity || self.type == LCBasicType_BackgroundColor || self.type == LCBasicType_ShadowOffset || self.type == LCBasicType_ShadowColor || self.type == LCBasicType_ShadowOpacity || self.type == LCBasicType_ShadowRadius) {
            
            CGFloat lineWidth = 5.0;
            UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(lineWidth, lineWidth, _img.frame.size.width - (2 * lineWidth), _img.frame.size.height - (2 * lineWidth))];
            [path moveToPoint:CGPointMake(20, _img.frame.size.height * 0.5)];
            [path addLineToPoint:CGPointMake(_img.frame.size.width - 20, _img.frame.size.height / 2.0)];
            [path closePath];
            [path moveToPoint:CGPointMake(_img.frame.size.width * 0.5, 20)];
            [path addLineToPoint:CGPointMake(_img.frame.size.width * 0.5, _img.frame.size.height - 20)];
            [path closePath];
            
            /** 画出来的图片放大时会失帧
             path.lineWidth = lineWidth;
             UIGraphicsBeginImageContextWithOptions(CGSizeMake(100, 100), NO, [[UIScreen mainScreen] scale]);
             //CGContextRef context = UIGraphicsGetCurrentContext();
             //CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
             [[UIColor redColor] setStroke]; //这个直接给当前面板上的画笔上色 (少了手动获取上下文面板步骤)
             [path stroke];
             UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
             UIGraphicsEndImageContext();
             _img.image = image;
             */
            
            //图层画出来的不会失真
            CAShapeLayer *layer = [CAShapeLayer layer];
            layer.frame = _img.bounds;
            layer.path = path.CGPath;
            layer.lineWidth = lineWidth;
            layer.fillColor = [UIColor clearColor].CGColor;
            layer.strokeColor = [UIColor redColor].CGColor;
            [_img.layer addSublayer:layer];
        }
    }
    return _img;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
