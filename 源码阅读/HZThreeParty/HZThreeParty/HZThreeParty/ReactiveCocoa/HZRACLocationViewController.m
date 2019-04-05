//
//  HZRACLocationViewController.m
//  HZThreeParty
//
//  Created by 华天杰 on 2018/11/13.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "HZRACLocationViewController.h"

#import <ReactiveObjC.h>

#import <CoreLocation/CoreLocation.h>

@interface HZRACLocationViewController ()<CLLocationManagerDelegate>
@property(nonatomic,strong)CLLocationManager* locationManager;
@property(nonatomic,strong)CLGeocoder* geocoder;
@end

@implementation HZRACLocationViewController

- (CLLocationManager *)manager{
    if (_locationManager == nil) {
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
    }
    return _locationManager;
}

-(CLGeocoder *)geocoder{
    if (_geocoder == nil) {
        _geocoder = [[CLGeocoder alloc] init];
    }
    return _geocoder;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [[[[[self authorizedSignal] filter:^BOOL(id  _Nullable value) {
        // filter-->代表是否授权
        return [value boolValue];
    }] flattenMap:^__kindof RACSignal * _Nullable(id  _Nullable value) {
        return [[[[[[self rac_signalForSelector:@selector(locationManager:didUpdateLocations:) fromProtocol:@protocol(CLLocationManagerDelegate)] map:^id _Nullable(RACTuple * _Nullable value) {
            return value[1];
        }] merge:[[self rac_signalForSelector:@selector(locationManager:didFailWithError:) fromProtocol:@protocol(CLLocationManagerDelegate)] map:^id _Nullable(RACTuple * _Nullable value) {
            return [RACSignal error:value[1]];
        }]] take:1] initially:^{
            [self.locationManager startUpdatingHeading];
        }] finally:^{
            [self.locationManager stopUpdatingHeading];
        }] ;
    }] flattenMap:^__kindof RACSignal * _Nullable(id  _Nullable value) {
        CLLocation *location = [value firstObject];
        
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            [self.geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
                if (error) {
                    [subscriber sendError:error];
                }else{
                    [subscriber sendNext:[placemarks firstObject]];
                    [subscriber sendCompleted];
                }
            }];
            return [RACDisposable disposableWithBlock:^{
                
            }];
        }];
    }]subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@",x);
    }]  ;
}


#pragma mark -- 地理位置权限获取

-(RACSignal*)authorizedSignal{
    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined) {
        [self.locationManager requestAlwaysAuthorization];
        return [[self rac_signalForSelector:@selector(locationManager:didChangeAuthorizationStatus:) fromProtocol:@protocol(CLLocationManagerDelegate)] map:^id _Nullable(RACTuple * _Nullable value) {
            return @([value[1] integerValue] == kCLAuthorizationStatusAuthorizedAlways);
        }];
    }
    return [RACSignal return:@([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedAlways)];
}

#pragma mark -- 实现类似KVO的方式

-(void)observerObject{
    RACSignal *signal = RACObserve(self, title);
    [signal subscribeNext:^(id  _Nullable x) {
        
    }];
    
    // 实现绑定
    //RAC(object,title) = RACObserve(self, title);
}

@end
