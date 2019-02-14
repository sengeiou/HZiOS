//
//  UILabel+HZ.h
//  HZUIKIT
//
//  Created by KB on 2018/8/17.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (HZ)
-(instancetype)initWithText:(NSString*)text
                  textColor:(NSString*)textColor
                   fontSize:(NSInteger)fontSize
              textAlignment:(NSTextAlignment)textAlignment
                      frame:(CGRect)frame;
@end
