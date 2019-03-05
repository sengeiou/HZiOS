//
//  HZRequestRecordService.m
//  HZUIKIT
//
//  Created by KB on 2018/7/26.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "HZRequestRecordService.h"

@implementation HZRequestRecordService

+ (void)requestRecordServiceWithParams:(NSDictionary *)params completeHandler:(void(^)(bool isSuccess,NSString *message,NSArray *result))completeHandler{
    NSString *baseRequestUrl = @"https://www.xeno-canto.org/api/2/recordings";
    NSMutableString *requestStr = [NSMutableString stringWithFormat:@"%@?",baseRequestUrl];
    for (NSInteger index = 0; index < params.allKeys.count; index++) {
        NSString *key = params.allKeys[index];
        NSString *value = [params objectForKey:key];
        [requestStr appendString:[NSString stringWithFormat:@"%@=%@",key,value]];
        if (index < params.allKeys.count -1) {
            [requestStr appendString:@"&"];
        }
    }
   NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:requestStr] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
       NSDictionary * resDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
       dispatch_async(dispatch_get_main_queue(), ^{
           if (error == nil) {
               NSArray *recordings = [resDic objectForKey:@"recordings"];
               NSMutableArray *locs = [NSMutableArray array];
               for (NSDictionary *dic in recordings) {
                   [locs addObject:[dic objectForKey:@"loc"]];
               }
               completeHandler(YES,nil,[locs copy]);
           }else{
               completeHandler(NO,nil,nil);
           }
       });
   }];
    [dataTask resume];
}

@end
