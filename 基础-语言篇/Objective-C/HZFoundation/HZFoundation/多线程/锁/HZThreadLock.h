//
//  HZThreadLock.h
//  HZFoundation
//
//  Created by KB on 2018/8/8.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HZThreadLock : NSObject

@property(atomic)NSMutableArray *array;

@end
