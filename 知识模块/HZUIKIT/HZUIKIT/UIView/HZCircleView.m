//
//  HZCircleView.m
//  HZUIKIT
//
//  Created by KB on 2018/6/3.
//  Copyright © 2018年 HZ. All rights reserved.

#import "HZCircleView.h"

@interface HZCircleView()
@property(nonatomic,strong)UIColor* circleColor;
@end

@implementation HZCircleView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor clearColor]];
        self.circleColor = [UIColor lightGrayColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect{
    CGRect bounds = self.bounds;
    CGFloat centerX = bounds.size.width/2;
    CGFloat centerY = bounds.size.height/2;
    CGFloat radius = MIN(centerX, centerY);
    
    UIBezierPath* path = [[UIBezierPath alloc] init];
    NSInteger circleCount = radius/20;// 可以绘制圆的个数
    for (NSInteger index=0; index<circleCount; index++) {
        [path addArcWithCenter:CGPointMake(centerX, centerY) radius:radius startAngle:0 endAngle:M_PI*2 clockwise:YES];
        [self.circleColor  setStroke];
        [path stroke];
        radius= radius - 20 ; // 下一个绘制圆的半径
        [path moveToPoint:CGPointMake(radius+centerX, centerY)];// 使得绘制结束的绘制点落在下一个内圆的路径上
    }

    UIImage* cirlceImage = [UIImage imageNamed:@"circle"];
    [cirlceImage drawInRect:CGRectMake(centerX-100/2, centerY-100/2, 100, 100)];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    float red = (arc4random()%100)/100.0;
    float green = (arc4random()%100)/100.0;
    float blue = (arc4random()%100)/100.0;
    
    UIColor* randomColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    self.circleColor = randomColor;
    [self setNeedsDisplay];
}




@end
