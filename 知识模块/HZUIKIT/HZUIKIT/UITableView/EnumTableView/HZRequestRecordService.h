//
//  HZRequestRecordService.h
//  HZUIKIT
//
//  Created by KB on 2018/7/26.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HZRequestRecordService : NSObject
+ (void)requestRecordServiceWithParams:(NSDictionary *)params completeHandler:(void(^)(bool isSuccess,NSString *message,NSArray *result))completeHandler;
@end
