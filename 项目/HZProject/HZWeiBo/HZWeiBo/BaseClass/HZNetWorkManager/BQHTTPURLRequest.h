//
//  BQHTTPURLRequest.h
//  BeiqiWallet
//
//  Created by KB on 2018/2/27.
//  Copyright © 2018年 citic. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BQHTTPRequestModel;
@interface BQHTTPURLRequest : NSObject

+(NSMutableURLRequest*)bqCreateHttpURLRequestWithModel:(BQHTTPRequestModel*)requestModel;
@end
