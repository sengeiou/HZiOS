//
//  NSString+HZ.m
//  HZWeiBo
//
//  Created by 华天杰 on 2018/10/15.
//  Copyright © 2018年 BQ. All rights reserved.
//

#import "NSString+HZ.h"

@implementation NSString (HZ)
- (CGSize)sizeWithFontSize:(CGFloat)fontSize
{
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    attributes[NSFontAttributeName] = [UIFont fontWithName:@"Helvetica" size:fontSize];
    CGSize size = [self sizeWithAttributes:attributes];
    return size;
}

- (CGRect)boundsWithFontSize:(CGFloat)fontSize textWidth:(CGFloat)width
{
    CGSize textSize = CGSizeMake(width, MAXFLOAT);
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    attributes[NSFontAttributeName] = [UIFont fontWithName:@"Helvetica" size:fontSize];
    CGRect frame = [self boundingRectWithSize:textSize
                                      options:NSStringDrawingUsesLineFragmentOrigin
                                   attributes:attributes
                                      context:nil];
    return frame;
}
@end
