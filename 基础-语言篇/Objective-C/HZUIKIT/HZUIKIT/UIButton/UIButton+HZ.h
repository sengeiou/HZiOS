//
//  UIButton+HZ.h
//  HZUIKIT
//
//  Created by dafy on 16/8/18.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (HZ)
// 可以使用runtime的关联（associate）来给分类添加属性
// 给分类添加属性 需要重写属性的set和get方法
@property(nonatomic,assign)BOOL isDelayClick;
@end
