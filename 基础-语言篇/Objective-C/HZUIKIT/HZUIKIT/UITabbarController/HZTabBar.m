//
//  HZTabBar.m
//  HZUIKIT
//
//  Created by KB on 2018/7/24.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "HZTabBar.h"

@interface HZTabBar()
@property(nonatomic,strong)UIButton *addButton;
@end

@implementation HZTabBar

/*
   1> 使用自定义tabbar时要结合KVC去设置
     HZTabBar *tabBar = [[HZTabBar alloc]initWithFrame:self.tabBar.frame];
   2> 用kvc把readonly的tabBar属性改成自定义的
     [self setValue:tabBar forKey:@"tabBar"];
 */

-(UIButton*)addButton{
    if (_addButton==nil) {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateSelected];
        
        [_addButton sizeToFit];
        [_addButton addTarget:self action:@selector(addBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_addButton];
    }
    return _addButton;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat w = self.bounds.size.width;
    CGFloat h = self.bounds.size.height;
    
    CGFloat btnX = 0 ;
    CGFloat btnY = 0 ;
    CGFloat btnW = w / 5;
    CGFloat btnH = h ;
    
    // 遍历tabbar上所有的tabbarItem，依次重新布局
    NSInteger i = 0;
    for(UIView *tabbarBtn in self.subviews){
        if ([tabbarBtn isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            btnX = i * btnW;
            tabbarBtn.frame = CGRectMake(btnX, btnY, btnW, btnH);
            if (i == 1) {
                i++;// 空出第三个位置
            }
            i++;
        }
    }
    // 将自定义按钮添加到tabbar上
    self.addButton.center = CGPointMake(w * 0.5, h * 0.5);
}

-(void)addBtnAction:(UIButton*)button{
    /*
      使用协议-委托或者block的方式将时间传递出去
     */
}

//处理超出区域点击无效的问题
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    UIView *view = [super hitTest:point withEvent:event];
    if (view == nil){
        //转换坐标
        CGPoint tempPoint = [self.addButton convertPoint:point fromView:self];
        //判断点击的点是否在按钮区域内
        if (CGRectContainsPoint(self.addButton.bounds, tempPoint)){
            //返回按钮
            return _addButton;
        }
    }
    return view;
}

@end
