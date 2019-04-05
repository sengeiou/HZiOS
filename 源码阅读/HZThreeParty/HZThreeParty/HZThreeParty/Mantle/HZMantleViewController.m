//
//  HZMantleViewController.m
//  HZThreeParty
//
//  Created by apple on 16/12/6.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import "HZMantleViewController.h"

#import <AFNetworking.h>
#import <Mantle.h>
#import "PhoneNumberDetail.h"

static  NSString* requestURL = @"https://apis.baidu.com/apistore/mobilenumber/mobilenumber";
static  NSString* appKey     = @"bfed2a04395f2c5dc2237f32fc748ef2";

@interface HZMantleViewController ()

@end

@implementation HZMantleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self obtainPhoneNumberBelonging:@"15501240959"];
}

/**
 *  获取手机号的归属地
 *
 *  @param phoneNumber 手机号码
 */
-(void)obtainPhoneNumberBelonging:(NSString*)phoneNumber{
    
    AFHTTPSessionManager* sessionManger = [AFHTTPSessionManager manager];
    sessionManger.responseSerializer = [AFHTTPResponseSerializer serializer];
    // 给HTTPHeaderField 设置值
    [sessionManger.requestSerializer setValue:appKey forHTTPHeaderField:@"apikey"];
    NSURLSessionDataTask* dataTask =  [sessionManger GET:requestURL parameters:@{@"phone":phoneNumber} success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        NSDictionary* responseObjectDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSDictionary* tempRetData = [responseObjectDic objectForKey:@"retData"];
        if (0 == [[responseObjectDic objectForKey:@"errNum"] integerValue]) {
            
            /*
             将JSON数据转换成Model对象
             */
            PhoneNumberDetail* phoneNumberDetail =  [MTLJSONAdapter modelOfClass:[PhoneNumberDetail class] fromJSONDictionary:tempRetData error:nil];
            /*
             将Model转换成JSON数据
             */
            NSError* error=nil;
            NSDictionary* tempTest =[MTLJSONAdapter JSONDictionaryFromModel:phoneNumberDetail error:&error];
            
        }else{
            
        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        NSLog(@"%@",[error description]);
    }];
    
    [dataTask resume];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
