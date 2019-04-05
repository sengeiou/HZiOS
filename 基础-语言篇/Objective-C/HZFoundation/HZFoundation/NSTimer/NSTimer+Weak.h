//
//  NSTimer+Weak.h
//  HZFoundation
//
//  Created by KB on 2018/7/13.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (Weak)

+(NSTimer*)scheduledWeakTimerWithTimeInterval:(NSTimeInterval)ti
                                       target:(id)aTarget
                                     selector:(SEL)aSelector
                                     userInfo:(id)userInfo
                                      repeats:(BOOL)yesOrNo;
@end
