//
//  NSData+DFEngineSecurity.h
//  DFCloudLoan
//
//  Created by apple on 16/11/2.
//  Copyright © 2016年 DF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (DFEngineSecurity)
- (NSData *)aes256EncryptWithKey:(NSData *)key iv:(NSData *)iv ;

- (NSData *)aes256DecryptWithkey:(NSData *)key iv:(NSData *)iv ;

+ (NSData *)dataWithBase64EncodedString:(NSString *)base64EncodedString ;

- (NSString *)base64EncodedString;
@end
