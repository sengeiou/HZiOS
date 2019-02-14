//
//  AppDelegate.m
//  HZUIKIT
//
//  Created by dafy on 16/8/7.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()
@property(nonatomic,assign)UIBackgroundTaskIdentifier backgroundTaskIdentifier;
@property(nonatomic,strong)NSTimer* timer;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // 多久从后台获取一次数据
    [application setMinimumBackgroundFetchInterval:UIApplicationBackgroundFetchIntervalMinimum];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window setBackgroundColor:[UIColor whiteColor]];
    //
    UIViewController* viewController = [[ViewController alloc] init];
    UINavigationController* nav_VC = [[UINavigationController alloc] initWithRootViewController:viewController];
    [self.window setRootViewController:nav_VC];
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)application:(UIApplication *)application handleEventsForBackgroundURLSession:(NSString *)identifier completionHandler:(void (^)())completionHandler{
    if ([identifier isEqual:@"backgroundAction"]){
        self.completionHandler = completionHandler;
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    __weak typeof(self)weakSelf = self;
    // 将重要的信息在进去后台后发送给服务端
    // backgroundTimeRemaining ==> The amount of time the app has to run in the background.
    self.backgroundTaskIdentifier = [application beginBackgroundTaskWithExpirationHandler:^{
        [application endBackgroundTask:weakSelf.backgroundTaskIdentifier];
        weakSelf.backgroundTaskIdentifier = UIBackgroundTaskInvalid;
    }];
    __block NSInteger flag = 0;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
        // 避免阻塞主线程
        NSLog(@"===>:%lf",application.backgroundTimeRemaining);// 需要在主线程中调用
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
           // NSLog(@"===>:%ld",flag++);
//            if (flag == 30) {
//                [timer invalidate];
//                [application endBackgroundTask:weakSelf.backgroundTaskIdentifier];
//                weakSelf.backgroundTaskIdentifier = UIBackgroundTaskInvalid;
//            }
        });
    }];
    
    
    /*
     +  Audio。
     +  Location/GPS。
     +  VoIP。
     <key>UIBackgroundModes</key>
     <array>
     <string>voip</string>
     </array>
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(void)application:(UIApplication *)application performFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler{
    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfiguration];
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://www.jianshu.com/p/a668f1770efb"];
    NSURLSessionDataTask *task = [session dataTaskWithURL:url
                                        completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                            
                                            if (error) {
                                                completionHandler(UIBackgroundFetchResultFailed);
                                                return;
                                            }
                                            
                                            // Parse response/data and determine whether new content was available
                                            BOOL hasNewData = YES;
                                            if (hasNewData) {
                                                completionHandler(UIBackgroundFetchResultNewData);
                                            } else {
                                                completionHandler(UIBackgroundFetchResultNoData);
                                            }
                                        }];
    
    // Start the task
    [task resume];
}

@end
