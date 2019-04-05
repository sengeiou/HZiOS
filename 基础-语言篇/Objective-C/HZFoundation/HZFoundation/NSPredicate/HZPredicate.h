//
//  HZPredicate.h
//  HZFoundation
//
//  Created by apple on 16/10/9.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HZPredicate : NSObject
@property(nonatomic,copy)NSString* name;
@property(nonatomic,copy)NSString* sex;
@property(nonatomic,copy)NSString* address;

-(instancetype)initWithName:(NSString*)name sex:(NSString*)sex address:(NSString*)address;

+(BOOL)regexMathPassWord:(NSString*)password;

+(BOOL)validatePhoneNumber:(NSString*)phoneNumber;

+(NSString *)getRandomStringWithNum:(NSInteger)num;
@end
