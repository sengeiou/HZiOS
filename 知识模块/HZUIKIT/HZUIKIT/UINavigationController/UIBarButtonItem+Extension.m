//
//  UIBarButtonItem+Extension.m
//  HZUIKIT
//
//  Created by KB on 2018/7/24.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)

+(UIBarButtonItem*)itemWithTarget:(id)target
                           action:(SEL)action
                            image:(NSString*)image
                   highlightImage:(NSString*)highlightImage{
    UIButton *customerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [customerBtn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [customerBtn setBackgroundImage:[UIImage imageNamed:highlightImage] forState:UIControlStateHighlighted];
    [customerBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    // 设置尺寸
    CGSize imageSize = customerBtn.currentBackgroundImage.size;
    customerBtn.frame = CGRectMake(0, 0, imageSize.width, imageSize.height);
    UIBarButtonItem *barBtnItem = [[UIBarButtonItem alloc] initWithCustomView:customerBtn];
    return barBtnItem;
}

@end
