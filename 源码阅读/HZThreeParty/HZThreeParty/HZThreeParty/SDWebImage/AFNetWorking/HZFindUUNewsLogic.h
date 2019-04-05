//
//  HZFindUUNewsLogic.h
//  HZThreeParty
//
//  Created by KB on 2018/2/9.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HZHTTPRequestModel.h"
@interface HZFindUUNewsLogic : NSObject
+(HZHTTPRequestModel*)hz_requestFindUUNewsWithParams:(NSDictionary*)params completeHandler:(void(^)(NSString*message,NSArray*uuNews))completeHandler;
@end
