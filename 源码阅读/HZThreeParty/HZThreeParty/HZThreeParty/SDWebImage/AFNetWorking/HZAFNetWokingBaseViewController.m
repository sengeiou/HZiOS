//
//  HZAFNetWokingBaseViewController.m
//  HZThreeParty
//
//  Created by apple on 16/11/25.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import "HZAFNetWokingBaseViewController.h"
#import <AFNetworking.h>
#import "HZTestHTTPRequest.h"

#define UPDATA_APP_ZIP_FILE_NAME @"assets.zip"

#import "HZFindUUNewsLogic.h"

@interface HZAFNetWokingBaseViewController ()
@property(nonatomic,strong)NSMutableArray* waitUnZipFiles;
@property(nonatomic,strong)NSMutableArray* downLoadFailedFiles;
@property(nonatomic,strong)NSMutableArray* unZipFailedFiles;

@property(nonatomic,strong)HZHTTPRequestModel* uuNewsRequestModel;
@end

@implementation HZAFNetWokingBaseViewController

-(void)bq_requestHttpData{
    // 业务层基本请求参数构建
//   NSDictionary* requestLogicParams = @{@"id":@"12345",@"name":@"data"};
//   self.uuNewsRequestModel= [HZFindUUNewsLogic hz_requestFindUUNewsWithParams:requestLogicParams completeHandler:^(NSString *message, NSArray *uuNews) {
//        
//    }];
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.waitUnZipFiles = [NSMutableArray array];
    self.downLoadFailedFiles = [NSMutableArray array];
    self.unZipFailedFiles = [NSMutableArray array];
    UIButton* button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"request Data" forState:UIControlStateNormal];
    [button setFrame:CGRectMake(0, 0, 100, 50)];
    [button setCenter:self.view.center];
    [button addTarget:self action:@selector(httpGetRequestWithAFN) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}


#pragma mark -- 使用AFN发送get请求

-(void)httpGetRequestWithAFN{
    NSLog(@"111----->:%@",[NSThread currentThread]);
    AFHTTPSessionManager *sessionManager = [[AFHTTPSessionManager alloc] init];
    // 设置网络返回不在子线程执行
    //sessionManager 是否需要设置为一个单例对象？？？
    sessionManager.completionQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    [sessionManager GET:@"https://api.map.baidu.com/location/ip" parameters:@{@"ak":@"mFdpmvtRaOvlVVU1rIXH4Xvh",
                     @"coor":@"bd09ll",
                     @"mcode":@"com.dafy.YundaiMobile"}
               progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"----->:%@",responseObject);
         NSLog(@"222----->:%@",[NSThread currentThread]);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"----->:%@",error.localizedDescription);
    }];
}


-(void)getLoactionByIPWithBaiDuSDK{

    HZTestHTTPRequest* testHttpRequest = [[HZTestHTTPRequest alloc] initWithAK:@"mFdpmvtRaOvlVVU1rIXH4Xvh" coor:@"bd09ll" mcode:@"com.dafy.YundaiMobile"];
    [testHttpRequest httpRequestWithCompletionHandler:^(NSString *errorMessage, id dataModel) {
        
    }];
}



-(void)downLoadTest{
    dispatch_group_t group  = dispatch_group_create();
    // 创建的是concurrent queue 
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    for (NSUInteger index=0; index<10; index++) {
        // 执行下载任务
        NSString* downloadURL = [NSString stringWithFormat:@"https://www.uuqianbao.com:20003/wxuu/bgm.mp3"];
        dispatch_group_enter(group);
        dispatch_group_async(group,queue, ^{
            [self downLoad:downloadURL completeHandler:^{
                 dispatch_group_leave(group);
            }];
        });
    }
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"task finished===>:%@",self.waitUnZipFiles);//此任务在主线程中执行
        [self df_UnZipFiles:self.waitUnZipFiles];
        NSLog(@"downLoadFailed==>:%@",self.downLoadFailedFiles);
        if (self.downLoadFailedFiles.count>0) {
             // 继续失败的下载
        }
    });

}

-(void)downLoad:(NSString*)downloadURL completeHandler:(void(^)())completeHandler{
   NSDate* startDate = [NSDate date];
   NSURLRequest* downLoadrequest = [NSURLRequest requestWithURL:[NSURL URLWithString:downloadURL]];
   NSURLSessionDownloadTask *downloadTask =    [[AFHTTPSessionManager manager] downloadTaskWithRequest:downLoadrequest progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        NSString* downloadFileName = [[downloadURL componentsSeparatedByString:@"/"] lastObject];
        NSString* libraryDirectoryPath = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject];
        NSURL *zipFileSavePath= [NSURL fileURLWithPath:libraryDirectoryPath];
        return [zipFileSavePath URLByAppendingPathComponent:downloadFileName];
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        if (error) {
            @synchronized (self) {
                [self.downLoadFailedFiles addObject:downloadURL];
                completeHandler();
            }
        }else{
            NSDate* endDate = [NSDate date];
            NSTimeInterval duration = [endDate timeIntervalSinceDate:startDate];
            NSLog(@"%@===>下载时间：%f",downloadURL,duration);
            @synchronized (self) {
                if ([self.downLoadFailedFiles containsObject:downloadURL]) {
                    [self.downLoadFailedFiles removeObject:downloadURL];
                }
                [self.waitUnZipFiles addObject:filePath];
                completeHandler();
            }
        }
    }];
    [downloadTask resume];
}

-(void)df_UnZipFiles:(NSArray*)UnZipFiles{
    dispatch_group_t group  = dispatch_group_create();
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    for (NSString* unZipFilePath in UnZipFiles) {
        // 执行解压任务
        dispatch_group_enter(group);
        dispatch_group_async(group,queue, ^{
            NSString* moduleTagName = [[unZipFilePath componentsSeparatedByString:@"/"] lastObject];
            NSString* moduleName = [[moduleTagName componentsSeparatedByString:@"_"] firstObject];
            NSString* libraryDirectoryPath = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject];
            NSString* unZipdestinationPath = [[libraryDirectoryPath stringByAppendingPathComponent:UPDATA_APP_ZIP_FILE_NAME] stringByAppendingPathComponent:moduleName];
          BOOL isUnZipFileSuccess =  [self startUnZipFilePath:unZipFilePath destinationPath:unZipdestinationPath];
            if (!isUnZipFileSuccess) {
                @synchronized (self) {
                    [self.unZipFailedFiles addObject:unZipFilePath];
                }
            }else{
                @synchronized (self) {
                    if ([self.unZipFailedFiles containsObject:unZipFilePath]) {
                        [self.unZipFailedFiles removeObject:unZipFilePath];
                    }
                }
            }
            dispatch_group_leave(group);
        });
    }
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        if (self.unZipFailedFiles.count>0) {
            //[self df_UnZipFiles:self.unZipFailedFiles];
        }else{
            NSLog(@"解压成功！！！");
        }
    });
}

-(BOOL)startUnZipFilePath:(NSString*)filePath  destinationPath:(NSString*)destinationPath{
    return  NO;
}

#pragma mark- GET

-(void)requestPhoneNumberBelong{
    
    NSURLSessionConfiguration* sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFHTTPSessionManager* sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:nil sessionConfiguration:sessionConfiguration];
    [sessionManager GET:@"http://tcc.taobao.com/cc/json/mobile_tel_segment.htm" parameters:@{@"tel":@"18518487767"} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
