//
//  HZPhotosView.m
//  HZWeiBo
//
//  Created by 华天杰 on 2018/10/15.
//  Copyright © 2018年 BQ. All rights reserved.
//

#import "HZPhotosView.h"
#import "HZPhotoView.h"
#import "HZPhoto.h"
#import "MJPhotoBrowser.h"
#import "MJPhoto.h"

#define HZPhotoW 70
#define HZPhotoH 70
#define HZPhotoMargin 10

@implementation HZPhotosView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 初始化9个子控件
        for (int index = 0; index < 9; index++) {
            HZPhotoView *photoView = [[HZPhotoView alloc] init];
            photoView.tag = index; // tag
            photoView.userInteractionEnabled = YES;
            [photoView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(photoTap:)]];
            [self addSubview:photoView];
        }
    }
    return self;
}

/**
 *  监听图片点击
 */
- (void)photoTap:(UITapGestureRecognizer *)tap
{
    int count = (int)self.photos.count;
    // 1.封装图片数据
    NSMutableArray *photos = [NSMutableArray arrayWithCapacity:count];
    for (int i = 0; i < count; i++) {
        MJPhoto *photo = [[MJPhoto alloc] init];
        
        // 图片路径
        // 替换为中等尺寸图片
        NSString *url = [[self.photos[i] thumbnail_pic] stringByReplacingOccurrencesOfString:@"thumbnail" withString:@"bmiddle"];
        photo.url = [NSURL URLWithString:url];
        
        // 来源于哪个UIImageView
        photo.srcImageView = self.subviews[i];
        
        [photos addObject:photo];
    }
    
    // 2.显示相册
    MJPhotoBrowser *browser = [[MJPhotoBrowser alloc] init];
    browser.currentPhotoIndex = tap.view.tag; // 弹出相册时显示的第一张图片是？
    browser.photos = photos; // 设置所有的图片
    [browser show];
}

- (void)setPhotos:(NSArray *)photos
{
    _photos = photos;
    
    for (int index = 0; index < self.subviews.count; index++) {
        HZPhotoView *photoView = self.subviews[index];
        
        if (index < photos.count) {
            photoView.hidden = NO;
            
            // 传递模型
            HZPhoto *photo = photos[index];
            photoView.photo = photo;
            
            // 设置frame
            int maxColumns = (photos.count == 4) ? 2 : 3;
            int col = index % maxColumns;
            int row = index / maxColumns;
            CGFloat photoX = col * (HZPhotoW + HZPhotoMargin);
            CGFloat photoY = row * (HZPhotoH + HZPhotoMargin);
            photoView.frame = CGRectMake(photoX, photoY, HZPhotoW, HZPhotoH);
            
            if (photos.count == 1) {
                photoView.contentMode = UIViewContentModeScaleAspectFit;
                photoView.clipsToBounds = NO;
            } else {
                photoView.contentMode = UIViewContentModeScaleAspectFill;
                photoView.clipsToBounds = YES;
            }
        } else {
            photoView.hidden = YES;
        }
    }
}

+ (CGSize)sizeWithPhotosCount:(int)count
{
    
    CGFloat margin = 10.0f;
    CGFloat photoWidth = (UIScreen.mainScreen.bounds.size.width - 4 * margin)/3 ;
    
    // 一行最多3列
    int maxColumns = (count == 4) ? 2 : 3;
    
    // 总行数
    int rows = (count + maxColumns - 1) / maxColumns;
    // 高度
    CGFloat photosH = rows * HZPhotoH + (rows - 1) * HZPhotoMargin;
    
    // 总列数
    int cols = (count >= maxColumns) ? maxColumns : count;
    // 宽度
    CGFloat photosW = cols * HZPhotoW + (cols - 1) * HZPhotoMargin;
    
    return CGSizeMake(photosW, photosH);
}
@end
