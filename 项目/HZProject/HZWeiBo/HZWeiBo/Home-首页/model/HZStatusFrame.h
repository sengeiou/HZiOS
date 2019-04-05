//
//  HZStatusFrame.h
//  HZWeiBo
//
//  Created by 华天杰 on 2018/10/15.
//  Copyright © 2018年 BQ. All rights reserved.
//

#import <Foundation/Foundation.h>

// 间距
#define HZStatusPadding 10
// 昵称字体
#define HZStatusNameFont 14
// 时间字体
#define HZStatusTimeFont 10
// 来源字体
#define HZStatusSourceFont HZStatusTimeFont
// 正文字体
#define HZStatusContentFont 14

@class HZStatus;

@interface HZStatusFrame : NSObject

/** 原创微博父控件 */
@property (nonatomic, assign, readonly) CGRect originalViewF;
/** 原创微博头像 */
@property (nonatomic, assign, readonly) CGRect iconViewF;
/** 原创微博昵称 */
@property (nonatomic, assign, readonly) CGRect nameBtnF;
/** 原创微博vip */
@property (nonatomic, assign, readonly) CGRect vipViewF;
/** 原创微博时间 */
@property (nonatomic, assign, readonly) CGRect timeLabelF;
/** 原创微博来源 */
@property (nonatomic, assign, readonly) CGRect sourceLabelF;
/** 原创微博正文 */
@property (nonatomic, assign, readonly) CGRect contentLabelF;
/** 原创微博配图 */
@property (nonatomic, assign, readonly) CGRect photoViewF;

/** 转发微博父控件 */
@property (nonatomic, assign, readonly) CGRect retweetViewF;
/** 转发微博昵称 */
@property (nonatomic, assign, readonly) CGRect retweetNameBtnF;
/** 转发微博正文 */
@property (nonatomic, assign, readonly) CGRect retweetContentLabelF;
/** 转发微博配图 */
@property (nonatomic, assign, readonly) CGRect retweetPhotoViewF;

/** 微博工具条父控件 */
@property (nonatomic, assign, readonly) CGRect statusToolBarF;

/** cell的高度 */
@property (nonatomic, assign, readonly) CGFloat cellHeight;

@property (nonatomic, strong) HZStatus *status;
@end
