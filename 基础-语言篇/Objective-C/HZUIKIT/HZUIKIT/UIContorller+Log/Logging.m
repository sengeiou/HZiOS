//
//  Logging.m
//  HZUIKIT
//
//  Created by apple on 16/8/31.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import "Logging.h"

@implementation Logging
+(void)logWithEventName:(NSString*)eventName{
    NSLog(@"%@:excute method!",eventName);
}
@end
