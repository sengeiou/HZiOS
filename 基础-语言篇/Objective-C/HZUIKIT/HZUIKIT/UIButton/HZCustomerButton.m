//
//  HZCustomerButton.m
//  HZUIKIT
//
//  Created by 华天杰 on 2018/7/4.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "HZCustomerButton.h"

@implementation HZCustomerButton

-(UIView*)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    if (self.hidden||!self.userInteractionEnabled||self.alpha<=0.01) {
        return nil;
    }else{
        if ([self pointInside:point withEvent:event]) {
            //遍历子视图做hitTest
            __block UIView *hit = nil;
            [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                CGPoint p = [self convertPoint:point toView:obj];
                // hitTest
               hit = [obj hitTest:p  withEvent:event];
                if (hit) {
                    *stop = YES;
                }
            }];
            if (hit) {
                return hit;
            }else{
               return self;
            }
        }else{
            return nil;
        }
    }
}

-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    CGFloat x1 = point.x;
    CGFloat y1 = point.y;
    
    // 当前坐标系原点是button视图的左上角
    CGFloat x2 = self.frame.size.width/2;
    CGFloat y2 = self.frame.size.height/2;
    
    double dis = sqrt((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2));
    if (dis<=self.frame.size.width/2) {
        return YES;
    }else{
        return NO;
    }
    
}

@end
