//
//  HZHTTPCacheManager.h
//  HZThreeParty
//
//  Created by KB on 2018/7/4.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HZHTTPRequestModel.h"
@interface HZHTTPCacheManager : NSObject


+(NSDictionary*)getCacheWithRequestModel:(HZHTTPRequestModel*)httpRequestModel;
+(NSDictionary*)saveCacheWithRequestModel:(HZHTTPRequestModel*)httpRequestModel;
@end
