//
//  HZRequestPositionAPI.m
//  HZThreeParty
//
//  Created by KB on 2018/7/4.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "HZRequestPositionAPI.h"

@implementation HZRequestPositionAPI
-(instancetype)initWithAK:(NSString*)ak coor:(NSString*)coor mcode:(NSString*)mcode{
    self =  [super init];
    if (self) {
        _ak = ak;
        _coor = coor;
        _mcode = mcode;
    }
    return self;
}

-(NSString*)requestUrl{
    return @"/location/ip";
}
-(YTKRequestMethod)requestMethod{
    return YTKRequestMethodGET;
}
-(id)requestArgument{
    return @{
             @"ak":@"mFdpmvtRaOvlVVU1rIXH4Xvh",
             @"coor":@"bd09ll",
             @"mcode":@"com.dafy.YundaiMobile"
             };
}

// 控制缓存时间
- (NSInteger)cacheTimeInSeconds {
    // 3 分钟 = 180 秒
    return 60 * 3;
}

@end
