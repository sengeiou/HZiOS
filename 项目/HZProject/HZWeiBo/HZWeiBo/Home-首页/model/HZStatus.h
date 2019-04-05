//
//  HZStatus.h
//  HZWeiBo
//
//  Created by 华天杰 on 2018/10/15.
//  Copyright © 2018年 BQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HZUser;
@class HZPhoto;
/*
   微博模型
 */
@interface HZStatus : NSObject
/** 原创微博id */
@property (nonatomic, copy) NSString *idstr;
/** 原创微博作者 */
@property (nonatomic, strong) HZUser *user;
/** 原创微博时间 */
@property (nonatomic, copy) NSString *created_at;
/** 原创微博来源 */
@property (nonatomic, copy) NSString *source;
/** 原创微博正文 */
@property (nonatomic, copy) NSString *text;;
/** 原创微博配图 */
@property (nonatomic, strong) NSArray *pic_urls;
@property(nonatomic,strong)HZPhoto* photo;
/** 被转发的微博 */
@property (nonatomic, strong) HZStatus *retweeted_status ;

/** 微博转发数 */
@property (nonatomic, assign) int reposts_count;
/** 微博评论数 */
@property (nonatomic, assign) int comments_count;
/** 微博表态数 */
@property (nonatomic, assign) int attitudes_count ;


// 待完善视频展示
@end
