//
//  HZTestHTTPRequest.m
//  HZThreeParty
//
//  Created by apple on 17/3/23.
//  Copyright © 2017年 HZ. All rights reserved.
//

#import "HZTestHTTPRequest.h"

@implementation HZTestHTTPRequest

-(instancetype)initWithAK:(NSString*)ak coor:(NSString*)coor mcode:(NSString*)mcode{
   self =  [super init];
    if (self) {
        _ak = ak;
        _coor = coor;
        _mcode = mcode;
    }
    return self;
}

-(NSString*)baseURL{
   return @"https://api.map.baidu.com";
}
-(NSString*)requestFilePath{
  return @"location/ip";
}
-(NSDictionary*)parameters{
    return @{
             @"ak":_ak,
             @"coor":_coor,
             @"mcode":_mcode
             };
}

/*
             AFHTTPSessionManager* sessionManger = [AFHTTPSessionManager manager];
             [sessionManger GET:@"https://api.map.baidu.com/location/ip"  parameters:@{@"ak":@"mFdpmvtRaOvlVVU1rIXH4Xvh",@"coor":@"bd09ll",@"mcode":@"com.dafy.YundaiMobile"} progress:^(NSProgress * _Nonnull downloadProgress) {
             
             } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

             {
                     address = "CN|\U5317\U4eac|\U5317\U4eac|None|UNICOM|0|0";
                     content =    {
                     address = "\U5317\U4eac\U5e02";
                     "address_detail" =         {
                     city = "\U5317\U4eac\U5e02";
                     "city_code" = 131;
                     district = "";
                     province = "\U5317\U4eac\U5e02";
                     street = "";
                     "street_number" = "";
                     };
                     point =         {
                     x = "116.40387397";
                     y = "39.91488908";
                     };
                     };
                     status = 0;
                     }

            NSLog(@"%@",responseObject);
            NSInteger status = [(NSNumber*)[responseObject objectForKey:@"status"] integerValue];
            if (0==status) {
                NSDictionary* content = [responseObject objectForKey:@"content"];
                
                NSDictionary* address_detail = [content objectForKey:@"address_detail"];
                NSString* city = [address_detail objectForKey:@"city"];
                NSString* province = [address_detail objectForKey:@"province"];
                NSString* address = [address_detail objectForKey:@"address"];
                
                NSDictionary* point = [content objectForKey:@"'point"];
                NSString*  x  = [point objectForKey:@"x"];
                NSString*  y  = [point objectForKey:@"y"];
            }

            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
            }];

 */


-(void)hz_subClassHandleResponseData:(id)responseData errorMessage:(NSError *)errorMessage{
    if(errorMessage){
        
    }
    // 数据返回前端
    self.completionHandler(@"",@{});
}
@end
