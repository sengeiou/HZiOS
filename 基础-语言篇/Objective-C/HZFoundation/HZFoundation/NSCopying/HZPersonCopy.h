//
//  HZPersonCopy.h
//  HZFoundation
//
//  Created by apple on 16/12/7.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import <Foundation/Foundation.h>

//NSCopying: 得到的是一个新的对象
// 遵守NSCopying协议就是在copyWithZone中新创建一个对象，有属性还需要将属性赋值！
@interface HZPersonCopy : NSObject<NSCopying>{
    NSString* __weak name;
}

@property(weak)id thing;

@property(nonatomic,copy)NSString* name;
-(void)test;
@end
