//
//  HZMethodTarget.m
//  Objective-C-Project
//
//  Created by 华天杰 on 2018/12/25.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "HZMethodTarget.h"

@implementation HZMethodTarget
- (void)hzMethod{
    NSLog(@"HZMethodTarget--hzMethod");
}

+ (void)initialize{
    NSLog(@"HZMethodTarget initialize");
}

- (NSString*)stringForDate:(NSDate*)date usingFormatter:(NSDateFormatter *)formatter{
    return [formatter stringFromDate:date];
}
@end
