//
//  HZUser.h
//  HZWeiBo
//
//  Created by 华天杰 on 2018/10/15.
//  Copyright © 2018年 BQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HZUser : NSObject
/** 用户id */
@property (nonatomic, copy) NSString *idstr;
/** 用户头像 */
@property (nonatomic, copy) NSString *profile_image_url;
/** 用户昵称 */
@property (nonatomic, copy) NSString *name;
/** vip类型 */
@property (nonatomic, assign) int mbtype;
/** vip等级 */
@property (nonatomic, assign) int mbrank;
@end
