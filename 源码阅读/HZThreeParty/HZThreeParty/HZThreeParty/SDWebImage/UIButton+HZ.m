
//
//  UIButton+HZ.m
//  HZThreeParty
//
//  Created by 华天杰 on 2019/3/10.
//  Copyright © 2019年 HZ. All rights reserved.
//

#import "UIButton+HZ.h"

@implementation UIButton (HZ)
- (void)hz_addRounderCornerWithRadius:(CGFloat)radius size:(CGSize)size backgroundColor:(UIColor*)backgroundColor
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        UIGraphicsBeginImageContextWithOptions(size, NO, 0);
        CGContextRef cxt = UIGraphicsGetCurrentContext();
        
        CGContextSetFillColorWithColor(cxt, backgroundColor.CGColor);
        CGContextSetStrokeColorWithColor(cxt, [UIColor clearColor].CGColor);
        
        CGContextMoveToPoint(cxt, size.width, size.height-radius);
        CGContextAddArcToPoint(cxt, size.width, size.height, size.width-radius, size.height, radius);//右下角
        CGContextAddArcToPoint(cxt, 0, size.height, 0, size.height-radius, radius);//左下角
        CGContextAddArcToPoint(cxt, 0, 0, radius, 0, radius);//左上角
        CGContextAddArcToPoint(cxt, size.width, 0, size.width, radius, radius);//右上角
        CGContextClosePath(cxt);
        CGContextDrawPath(cxt, kCGPathFillStroke);
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            [self setBackgroundImage:image forState:UIControlStateNormal];
        });
    });
}
@end
