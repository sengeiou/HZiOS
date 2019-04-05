//
//  Person.h
//  ArchiverAndUnArchiver
//
//  Created by apple on 16/5/23.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import <Foundation/Foundation.h>

//自定义类的归档需要遵循NSCopying协议
@interface Person : NSObject<NSCopying>
@property(nonatomic,copy)   NSString* name;
@property(nonatomic,assign) NSInteger age;
@property(nonatomic,copy)   NSString* gender;
@end
