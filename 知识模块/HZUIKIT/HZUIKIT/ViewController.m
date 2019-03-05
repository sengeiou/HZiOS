//
//  ViewController.m
//  HZUIKIT
//
//  Created by dafy on 16/8/7.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
 #import <CoreLocation/CoreLocation.h>
static NSMutableArray* backupURLS;
static char urlCurrentRequestCount;
@interface ViewController ()<CLLocationManagerDelegate>
@property(nonatomic,strong)NSMutableArray *downLoadUrls;
@property(nonatomic,strong)dispatch_queue_t  syncQueue;
@property(nonatomic,strong)NSDictionary* localBackUpURLS;

@property(nonatomic,strong)CLLocationManager* locationManager;
@end

@implementation ViewController


-(void)operationQueue{
    // 创建operation
    NSBlockOperation* blockOperation = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"blockOp:%@",[NSThread currentThread]);
    }];
    
    NSBlockOperation* blockOperation1 = [NSBlockOperation blockOperationWithBlock:^{
        [NSThread sleepForTimeInterval:2.0];
        NSLog(@"blockOp1:%@",[NSThread currentThread]);
    }];
    
    blockOperation1.completionBlock = ^{
         // 执行下一步操作
        NSLog(@"after blockOperation1 finished");
    };
    // 创建operationQueue
    NSOperationQueue* operationQueue = [[NSOperationQueue alloc] init];
    [operationQueue setMaxConcurrentOperationCount:4]; // 设置task最大执行并发数
    [blockOperation addDependency:blockOperation1];// operation之间添加依赖关系
    [operationQueue waitUntilAllOperationsAreFinished];// 等待所有的operation执行完毕后
    //[operationQueue cancelAllOperations];//取消所有operation操作
    [operationQueue addOperation:blockOperation];
    [operationQueue addOperation:blockOperation1];
    NSLog(@"finished operation!!!");
    
}

-(void)notificationAction{
    NSLog(@"notificationAction--%@",[NSThread currentThread]);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationAction) name:@"postNotification" object:nil];
//
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        [NSThread sleepForTimeInterval:3.0];
//        [[NSNotificationCenter defaultCenter] postNotificationName:@"postNotification" object:nil];
//    });
//

    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"UIKIT";
    self.tableViewItems = @[@"HZUIViewController",@"HZNavigationViewController",@"HZFirstiOSAppViewController",@"HZWebViewViewController",@"HZURLSessionViewController",@"HZViewController",@"HZCollectionViewController",@"UILabelViewController",@"UIButtonViewController",@"UIControlViewController",@"UIScrollViewViewController",@"HZRunLoopViewController",@"HZAlertViewViewController",@"HZTableViewController",@"HZResponderViewController",@"HZAnimationViewController",@"HZBezierPathViewController",@"HZNeteaseMainViewController"];

    // self.syncQueue = dispatch_queue_create("com.effectiveObjectiveC.syncQueue", NULL);
   // [self dowloadTasks];
    
    self.localBackUpURLS = @{
                                 @"huatianjie":@[@"huatianjie123",@"huatianjie456",@"huatianjie789"]
                                 };
    [self reuqestServalWithURL:@"huatianjie"];
    
    
    self.locationManager = [[CLLocationManager alloc] init];
    [self.locationManager requestAlwaysAuthorization];
    self.locationManager.delegate = self;
    [self.locationManager startUpdatingLocation];
    if([[[UIDevice currentDevice] systemVersion]floatValue] >=9) {
        self.locationManager.allowsBackgroundLocationUpdates=YES;
    }
}

-(void)locationManager:(nonnull CLLocationManager *)manager didUpdateLocations:(nonnull NSArray<CLLocation*> *)locations{
    NSLog(@"每当请求到位置信息时, 都会调用此方法");
}


-(void)reuqestServalWithURL:(NSString*)url{
    backupURLS = [[self.localBackUpURLS objectForKey:url] mutableCopy];
    NSDictionary* map = objc_getAssociatedObject(self, &urlCurrentRequestCount);
    NSString* currentCount= [map objectForKey:url];
    NSInteger currentCountInteger  = 0;
    if (currentCount==nil) {
        currentCountInteger = 0 ;
    }else{
        currentCountInteger   = [currentCount integerValue];
    }
    if (backupURLS.count<currentCountInteger+1) {
        NSString* newURL = [backupURLS objectAtIndex:currentCountInteger];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSLog(@"%@---尝试请求",newURL);
            [backupURLS removeObject:newURL];
            [self  refreshWithURL:url];
        });
    }else{
       NSLog(@"%@----------failed",url);
    }
}

-(void)refreshWithURL:(NSString*)url{
    [NSThread sleepForTimeInterval:1.0f];
    NSDictionary* map = objc_getAssociatedObject(self, &urlCurrentRequestCount);
    NSString* currentCount= [map objectForKey:@"currentCount"];
    currentCount = [NSString stringWithFormat:@"%ld",[currentCount integerValue]+1];
    [map setValue:@"currentCount" forKey:currentCount];
    objc_setAssociatedObject(self, &urlCurrentRequestCount, map, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self reuqestServalWithURL:url];
}

-(void)dowloadTasks{
    dispatch_group_t group  = dispatch_group_create();
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    NSMutableArray* tempArray = [NSMutableArray array];
    for (NSUInteger index=0; index<10; index++) {
        dispatch_group_enter(group);
        dispatch_group_async(group,queue, ^{
            NSLog(@"adsgadsgadfg");
            [NSThread sleepForTimeInterval:3.0f];
            @synchronized (self) {
                  [tempArray addObject:@(index)];
            }
            dispatch_group_leave(group);
        });
    }
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"task finished===>:%@",tempArray);//此任务在主线程中执行
    });
}



/*
 _syncQueue = dispatch_queue_create("com.effectiveObjectiveC.syncQueue", NULL);
 - (NSString *)someString
 {
 __weak NSString *localSomeString;
 dispatch_sync(_syncQueue, ^{
 localSomeString = _someString;
 });
 return localSomeString;
 }
 - (void)setSomeString:(NSString *)someString
 {
 dispatch_sync(_syncQueue, ^{
 _someString = someString;
 });
 }
 */



//-(void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:animated];
//    NSLog(@"viewWillAppear");
//}
//-(void)viewDidAppear:(BOOL)animated{
//    [super viewDidAppear:animated];
//    NSLog(@"viewDidAppear");
//}
//
//-(void)viewWillDisappear:(BOOL)animated{
//    [super viewWillDisappear:animated];
//     NSLog(@"viewWillDisappear");
//}
//
//-(void)viewDidDisappear:(BOOL)animated{
//    [super viewDidDisappear:animated];
//    NSLog(@"viewDidDisappear");
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
