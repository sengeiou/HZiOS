//
//  HZFollowMoveBallView.m
//  HZUIKIT
//
//  Created by KB on 2018/7/24.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "HZFollowMoveBallView.h"

@interface HZFollowMoveBallView()
@property(nonatomic,assign)CGFloat currentX;
@property(nonatomic,assign)CGFloat currentY;
@end

@implementation HZFollowMoveBallView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _currentX = self.center.x;
        _currentY = self.center.y;
    }
    return self;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    // 通知组件重新绘制
    [self setNeedsDisplay];
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint lastTouchPoint = [touch locationInView:self];
    
    _currentX = lastTouchPoint.x;
    _currentY = lastTouchPoint.y;
    
}

-(void)drawRect:(CGRect)rect{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(ctx, [UIColor orangeColor].CGColor);
    CGContextFillEllipseInRect(ctx, CGRectMake(_currentX - 10, _currentY -10, 20, 20));

}
@end
