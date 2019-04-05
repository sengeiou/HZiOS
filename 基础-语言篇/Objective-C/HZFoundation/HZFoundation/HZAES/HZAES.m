//
//  HZAES.m
//  HZFoundation
//
//  Created by KB on 2018/2/8.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "HZAES.h"
#import <CommonCrypto/CommonCryptor.h>
#import "CommonCrypto/CommonDigest.h"
#import "NSData+DFEngineSecurity.h"

@implementation HZAES

+(NSString*)encryptedStrWithInputText:(NSString*)inputText  Key:(NSString*)key{
    NSString*  newkey    = [key substringWithRange:NSMakeRange(0, 16)];
    NSData* key_Data= [newkey dataUsingEncoding:NSUTF8StringEncoding];
    NSData* encryptedData = [inputText dataUsingEncoding:NSUTF8StringEncoding];
    NSData* encryptedData_aes = [encryptedData aes256EncryptWithKey:key_Data iv:key_Data];
    NSString* lastText = [encryptedData_aes base64EncodedString];
    return lastText;
}

+(NSString*)dencryptedStrWithInputText:(NSString*)inputText Key:(NSString*)key{
    key     = [key substringWithRange:NSMakeRange(0, 16)];
    NSData* key_Data= [key dataUsingEncoding:NSUTF8StringEncoding];
    NSData* base64Data = [NSData dataWithBase64EncodedString:inputText];
    NSData* aesdencryptedData = [base64Data aes256DecryptWithkey:key_Data iv:key_Data];
    NSString* lastText = [[NSString alloc] initWithData:aesdencryptedData encoding:NSUTF8StringEncoding];
    return lastText;
}

@end
