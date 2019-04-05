//
//  HZString.m
//  HZDataStructure
//
//  Created by KB on 2018/6/4.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "HZString.h"

@implementation HZString
-(void)selectedString{
    
    NSString* str1 = @"ababacbabacba";
    NSString* str2 = @"bac";
    BOOL isSelect = NO;
    for (NSInteger i=0; i<str1.length; i++) {
        for (NSInteger j=0; j<str2.length; j++) {
            if (j+i>=str1.length) {
                isSelect = NO;
                break;
            }
           NSString* a = [str1 substringWithRange:NSMakeRange(j+i, 1)];
           NSString* b = [str2 substringWithRange:NSMakeRange(j, 1)];
            if (![a isEqualToString:b]) {
                isSelect = NO;
                break;
            }else{
                isSelect = YES;
            }
        }
        if (isSelect) {
            NSLog(@"---->:%ld",i);
        }
    }
    
}
@end
