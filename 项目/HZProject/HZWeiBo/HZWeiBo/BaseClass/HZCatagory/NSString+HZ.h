//
//  NSString+HZ.h
//  HZWeiBo
//
//  Created by 华天杰 on 2018/10/15.
//  Copyright © 2018年 BQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (HZ)
/**
 *  返回单行字符串对应的文本控件size(默认字体为'HelveticaNeue')
 *
 *  @param fontSize 字体大小
 */
- (CGSize)sizeWithFontSize:(CGFloat)fontSize;

/**
 *  返回多行字符串对应的文本控件frame(
 *
 *  @param fontSize 字体大小
 *  @param width    文本控件的最大宽度
 */
- (CGRect)boundsWithFontSize:(CGFloat)fontSize textWidth:(CGFloat)width;
@end
