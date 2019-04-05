//
//  HZRSA.h
//  HZFoundation
//
//  Created by 华天杰 on 2017/8/14.
//  Copyright © 2017年 HZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HZRSA : NSObject
+ (NSString *)encryptString:(NSString *)str publicKey:(NSString *)pubKey;
@end
