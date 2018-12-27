//
//  HZMethodTarget.h
//  Objective-C-Project
//
//  Created by 华天杰 on 2018/12/25.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface HZMethodTarget : NSObject
- (void)hzMethod;

-(HZMethodTarget*)methodOne;
-(HZMethodTarget*)methodTwo;
-(HZMethodTarget*)methodThree;

- (NSString*)stringForDate:(NSDate*)date usingFormatter:(NSDateFormatter *)formatter;
@end

