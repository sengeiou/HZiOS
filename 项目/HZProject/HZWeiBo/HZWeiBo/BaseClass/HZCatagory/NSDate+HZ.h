//
//  NSDate+HZ.h
//  HZWeiBo
//
//  Created by 华天杰 on 2018/10/15.
//  Copyright © 2018年 BQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (HZ)
/**
 *  是否是今天
 */
- (BOOL)isToday;
/**
 *  是否是昨天
 */
- (BOOL)isYesterday;
/**
 *  是否是今年
 */
- (BOOL)isThisYear;

/**
 *  获取与当前时间的差距
 */
- (NSDateComponents *)deltaToNow;
@end
