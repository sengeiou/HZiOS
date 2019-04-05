//
//  HZMacros.h
//  HZWeChat
//
//  Created by KB on 2018/6/20.
//  Copyright © 2018年 BQ. All rights reserved.
//

#ifndef HZMacros_h
#define HZMacros_h

#pragma mark -- 颜色

#define     RGBColor(r, g, b)           [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1.0]
#define     RGBAColor(r, g, b, a)       [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:a]


#pragma mark -- 国际化
#define     LOCSTR(str)                 NSLocalizedString(str, nil)


#endif /* HZMacros_h */
