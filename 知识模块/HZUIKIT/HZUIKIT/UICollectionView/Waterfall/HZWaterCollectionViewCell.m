//
//  HZWaterCollectionViewCell.m
//  HZUIKIT
//
//  Created by apple on 16/12/12.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import "HZWaterCollectionViewCell.h"
#define WIDTH ([UIScreen mainScreen].bounds.size.width-20)/3  
@implementation HZWaterCollectionViewCell
- (void)setImage:(UIImage *)image{
    if (_image != image) {
        _image = image;
    }
    [self setNeedsDisplay];
}
- (void)drawRect:(CGRect)rect{
    float newHeight = _image.size.height / _image.size.width * WIDTH;
    [_image drawInRect:CGRectMake(0, 0, WIDTH, newHeight)];
    self.backgroundColor = [UIColor grayColor];
}
@end
