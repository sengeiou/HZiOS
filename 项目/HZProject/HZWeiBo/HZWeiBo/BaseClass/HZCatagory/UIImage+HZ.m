//
//  UIImage+HZ.m
//  HZWeiBo
//
//  Created by 华天杰 on 2018/10/15.
//  Copyright © 2018年 BQ. All rights reserved.
//

#import "UIImage+HZ.h"

@implementation UIImage (HZ)
+ (instancetype)resizedImageWithName:(NSString *)imageName{
    return [self resizedImageWithName:imageName width:0.5 height:0.5];
}

+ (instancetype)resizedImageWithName:(NSString *)imageName width:(CGFloat)width height:(CGFloat)height{
    UIImage *image = [UIImage imageNamed:imageName];
    return [image stretchableImageWithLeftCapWidth:image.size.width * width
                                      topCapHeight:image.size.height * height];
}

@end
