//
//  EOCNetworkFetcher.m
//  Effective-ObjC
//
//  Created by apple on 16/2/15.
//  Copyright © 2016年 HTJ. All rights reserved.
//

#import "EOCNetworkFetcher.h"

@interface EOCNetworkFetcher ()
{
    // 位段数据类型 （1代表位段占的二进制位的个数）
    struct{
        unsigned int didReceiveData : 1;
        unsigned int didFailWithError : 1;
        unsigned int didUpdateProgress : 1;
    } _delegateFlags;
}
@end

@implementation EOCNetworkFetcher

-(void)setDelegate:(id<EOCNetworkFetcherDelegate>)delegate{
    _delegate = delegate;
    
    // 这样完成代理实现方法判断的缓存，保证程序运行的性能
    _delegateFlags.didReceiveData = [delegate respondsToSelector:@selector(networkFetcher:didReceiveData:)];
    _delegateFlags.didFailWithError = [delegate respondsToSelector:@selector(networkFetcher:didFailWithError:)];
    _delegateFlags.didUpdateProgress = [delegate respondsToSelector:@selector(networkFetcher:didUpdateProgressto:)];
}

-(void)testMethod{
    if (_delegateFlags.didReceiveData) {
        NSData* data = nil;
        [self.delegate networkFetcher:self didReceiveData:data];
    }
}
@end
