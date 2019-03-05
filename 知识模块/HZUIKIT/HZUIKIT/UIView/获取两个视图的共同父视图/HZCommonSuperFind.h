//
//  HZCommonSuperFind.h
//  HZUIKIT
//
//  Created by KB on 2018/8/15.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HZCommonSuperFind : NSObject
- (NSArray <UIView *> *)findCommonSuperView:(UIView *)viewOne other:(UIView *)otherView;
@end
