//
//  UIImage+HZ.h
//  HZWeiBo
//
//  Created by 华天杰 on 2018/10/15.
//  Copyright © 2018年 BQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (HZ)
/**
 *  返回一张可拉伸的图片
 */
+ (instancetype)resizedImageWithName:(NSString *)imageName;
+ (instancetype)resizedImageWithName:(NSString *)imageName width:(CGFloat)width height:(CGFloat)height;
@end
