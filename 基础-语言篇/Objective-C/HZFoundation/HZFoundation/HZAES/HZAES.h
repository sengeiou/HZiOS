//
//  HZAES.h
//  HZFoundation
//
//  Created by KB on 2018/2/8.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HZAES : NSObject

+(NSString*)encryptedStrWithInputText:(NSString*)inputText Key:(NSString*)key;

+(NSString*)dencryptedStrWithInputText:(NSString*)inputText Key:(NSString*)key;

@end
