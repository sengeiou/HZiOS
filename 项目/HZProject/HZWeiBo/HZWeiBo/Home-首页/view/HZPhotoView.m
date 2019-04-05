//
//  HZPhotoView.m
//  HZWeiBo
//
//  Created by 华天杰 on 2018/10/15.
//  Copyright © 2018年 BQ. All rights reserved.
//

#import "HZPhotoView.h"
#import "HZPhoto.h"
#import <UIImageView+WebCache.h>

@interface HZPhotoView()
@property (nonatomic, weak) UIImageView *gifView;
@end

@implementation HZPhotoView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImage *gif = [UIImage imageNamed:@"timeline_image_gif"];
        UIImageView *gifView = [[UIImageView alloc] initWithImage:gif];
        [self addSubview:gifView];
        
        self.gifView = gifView;
    }
    return self;
}

- (void)setPhoto:(HZPhoto *)photo
{
    _photo = photo;
    
    self.gifView.hidden = ![photo.thumbnail_pic hasSuffix:@".gif"];
    
    [self sd_setImageWithURL:[NSURL URLWithString:photo.thumbnail_pic]
            placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.gifView.layer.anchorPoint = CGPointMake(1, 1);
    self.gifView.layer.position = CGPointMake(self.bounds.size.width, self.bounds.size.height);
}

@end
