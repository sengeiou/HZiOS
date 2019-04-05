//
//  HZQueryPhoneNumberBelongToApi.m
//  HZThreeParty
//
//  Created by apple on 16/12/9.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import "HZQueryPhoneNumberBelongToApi.h"

@implementation HZQueryPhoneNumberBelongToApi{
    NSString* _phone;
}
-(instancetype)initWithTel:(NSString*)tel{
    self = [super init];
    if (self) {
        _phone = tel;
    }
    return self;
}

/*
  requestUrl如果设置完整的请求路径会覆盖掉baseUrl的设置
 */
-(NSString*)requestUrl{
  return @"/mobile/get";
}
-(YTKRequestMethod)requestMethod{
    return YTKRequestMethodGET;
}
-(id)requestArgument{
    return @{
              @"phone":_phone,
              @"KEY":@"JH9c4de675d85227720e3326179ad43eb0"
             };
}

// 服务器返回数据字段的类型验证
// 能够保证数据的使用上的安全
//- (id)jsonValidator {
//    return @{
//             @"nick": [NSString class],
//             @"level": [NSNumber class]
//             };
//}

// 控制缓存时间
- (NSInteger)cacheTimeInSeconds {
    // 3 分钟 = 180 秒
    return 60 * 3;
}
@end
