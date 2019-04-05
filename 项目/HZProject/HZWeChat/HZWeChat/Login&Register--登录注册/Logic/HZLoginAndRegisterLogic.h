//
//  HZLoginAndRegisterLogic.h
//  HZWeChat
//
//  Created by KB on 2018/6/20.
//  Copyright © 2018年 BQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HZLoginAndRegisterLogic : NSObject
+(void)loginWithPhoneNumber:(NSString*)phoneNumber passWord:(NSString*)passWord completeHandler:(void(^)(bool isSuccess,NSString*message))completeHandler;
@end
