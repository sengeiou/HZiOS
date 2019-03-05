//
//  UIBarButtonItem+Extension.h
//  HZUIKIT
//
//  Created by KB on 2018/7/24.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)

// 自定义导航栏上部按钮
+(UIBarButtonItem*)itemWithTarget:(id)target
                           action:(SEL)action
                            image:(NSString*)image
                   highlightImage:(NSString*)highlightImage;
@end
