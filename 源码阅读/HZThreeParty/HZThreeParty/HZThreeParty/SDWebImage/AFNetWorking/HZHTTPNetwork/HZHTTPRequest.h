//
//  HZHTTPRequest.h
//  HZThreeParty
//
//  Created by KB on 2018/7/4.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HZHTTPRequestModel;
@interface HZHTTPRequest : NSObject

+(NSMutableURLRequest*)createHTTPRequestWithHTTPRequestModel:(HZHTTPRequestModel*)httpRequestModel;
@end
