//
//  APEBaseDataController.h
//  YTKMVVM
//
//  Created by 华天杰 on 2017/4/17.
//  Copyright © 2017年 HZ. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^APECompletionCallback)(NSError* error);
typedef void(^APEDataCallback)(NSError* error,id data);
@interface APEBaseDataController : NSObject

@end
