//
//  EOCNetworkFetcher.h
//  Effective-ObjC
//
//  Created by apple on 16/2/15.
//  Copyright © 2016年 HTJ. All rights reserved.
//

#import <Foundation/Foundation.h>
@class EOCNetworkFetcher;

@protocol EOCNetworkFetcherDelegate<NSObject>
@optional
- (void)networkFetcher:(EOCNetworkFetcher*)networkFetcher didReceiveData:(NSData*)data;
- (void)networkFetcher:(EOCNetworkFetcher *)networkFetcher didFailWithError:(NSError *)error;
- (void)networkFetcher:(EOCNetworkFetcher *)networkFetcher didUpdateProgressto:(NSData *)progress;
@end

@interface EOCNetworkFetcher : NSObject
@property(nonatomic,weak)id<EOCNetworkFetcherDelegate> delegate;
@end
