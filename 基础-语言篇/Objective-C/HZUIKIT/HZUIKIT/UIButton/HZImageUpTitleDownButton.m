//
//  ImageUpTitleDownButton.m
//  UIScrollViewShowImage
//
//  Created by apple on 15/1/15.
//  Copyright (c) 2015年 DAFY. All rights reserved.
//

#import "HZImageUpTitleDownButton.h"
@interface HZImageUpTitleDownButton()
@end
@implementation HZImageUpTitleDownButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)decoder
{
    self = [super initWithCoder:decoder];
    if (self) {
        [self setup];
    }
    return self;
}

-(void)setup
{
    // 字体居中显示
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    //图片的显示居中
    [self.imageView setContentMode:UIViewContentModeScaleAspectFit];
}
//button 中imageVieW的位置
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW =contentRect.size.width;
    CGFloat imageH = contentRect.size.height*0.7;
    CGFloat imageX = 0;
    CGFloat imageY = 0;
    return CGRectMake(imageX, imageY, imageW, imageH);
}

//button 中label 的位置
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleX = 0;
    CGFloat titleY =contentRect.size.height*0.7;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height*0.3;
    
    return CGRectMake(titleX, titleY, titleW, titleH);
}

-(void)initWithTitle:(NSString*)title tintColor:(UIColor*)tintColor image:(NSString*)image fontSize:(CGFloat)fontSize{
    self.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    [self setTitleColor:tintColor forState:UIControlStateNormal];
    [self setTitle:title forState:UIControlStateNormal];
    [self setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
}
@end
