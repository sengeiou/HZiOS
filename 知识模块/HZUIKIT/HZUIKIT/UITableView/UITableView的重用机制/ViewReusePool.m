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
    UIView *view = [_waitUsedQueue anyObject];
    if (view == nil) {
        return nil;
    }else{
        [_waitUsedQueue removeObject:view];
        [_usingQueue addObject:view];
     return view;
    }
}

-(void)addUsingView:(UIView *)view{
    if (view == nil) {
        return;
    }
    //添加视图到使用中的队列
    [_usingQueue addObject:view];
}

-(void)reset{
    UIView *view = nil;
    while ((view = [_usingQueue anyObject])) {
        // 从使用中队列移除
        [_usingQueue removeObject:view];
        // 加入等待使用的队列
        [_waitUsedQueue addObject:view];
    }
}

@end
