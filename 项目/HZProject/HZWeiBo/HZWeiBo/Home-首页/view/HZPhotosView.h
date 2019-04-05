//
//  HZPhotosView.h
//  HZWeiBo
//
//  Created by 华天杰 on 2018/10/15.
//  Copyright © 2018年 BQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HZPhotosView : UIView
@property (nonatomic, strong) NSArray *photos;

/**
 *  根据图片个数返回photosView大小
 */
+ (CGSize)sizeWithPhotosCount:(int)count;
@end
