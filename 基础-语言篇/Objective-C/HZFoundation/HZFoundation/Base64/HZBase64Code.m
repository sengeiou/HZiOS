//
//  HZBase64Code.m
//  HZFoundation
//
//  Created by apple on 16/9/19.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import "HZBase64Code.h"

@implementation HZBase64Code
-(void)test{
    /**
     *  将base64的字符串decode，先转化为NSData,然后在创建为NSString类型
     *  使用base64encode字符串可以防止一些特殊的字符被转义
     */
    NSString* testStr = @"eyJhZ2UiOiIxOCIsIm5hbWUiOiLljY7lpKnmnbAiLCJvYmoiOnsiYWdlIjoiMTgiLCJuYW1lIjoi5Y2O5aSp5p2wIiwic2hlbmdhbyI6IjE5OSJ9LCJzaGVuZ2FvIjoiMTk5In0=";
    NSData *data = [[NSData alloc]initWithBase64EncodedString:testStr options:0];
    NSLog(@"%@", [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);

}
@end
