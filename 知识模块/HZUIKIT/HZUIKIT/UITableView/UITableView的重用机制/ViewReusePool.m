//
//  ViewReusePool.m
//  HZUIKIT
//
//  Created by 华天杰 on 2019/2/25.
//  Copyright © 2019年 HZ. All rights reserved.
//

#import "ViewReusePool.h"

@interface ViewReusePool()
// 等待使用的队列
@property(nonatomic,strong)NSMutableSet *waitUsedQueue;
// 使用中的队列
@property(nonatomic,strong)NSMutableSet *usingQueue;
@end

@implementation ViewReusePool
- (instancetype)init
{
    self = [super init];
    if (self) {
        _waitUsedQueue = [NSMutableSet set];
        _usingQueue = [NSMutableSet set];
    }
    return self;
}

- (UIView *)dequeueReusableView{
    UIView *view = [UIView new];
    return view;
}
@end
