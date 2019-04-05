//
//  HZThreadSafeMutableArray.m
//  Objective-C-Project
//
//  Created by 华天杰 on 2019/3/7.
//  Copyright © 2019年 HZ. All rights reserved.
//

#import "HZThreadSafeMutableArray.h"

@interface HZThreadSafeMutableArray ()
@property(nonatomic,strong) dispatch_queue_t syncQueue;
@property(nonatomic,strong)NSMutableArray *array;
@end

@implementation HZThreadSafeMutableArray

-(instancetype)initComon{
    self = [super init];
    if (self) {
        NSString *queueId = [NSString stringWithFormat:@"hz.com.%p",self];
        _syncQueue = dispatch_queue_create([queueId UTF8String], DISPATCH_QUEUE_CONCURRENT);
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _array = [NSMutableArray array];
    }
    return self;
}

#pragma mark - 数据操作方法 (凡涉及更改数组中元素的操作，使用异步派发+栅栏块；读取数据使用 同步派发+并行队列)

- (NSUInteger)count{
    
    __block NSUInteger count;
    dispatch_sync(_syncQueue, ^{
        count = self->_array.count;
    });
    return count;
}

- (id)objectAtIndex:(NSUInteger)index{
    
    __block id obj;
    dispatch_sync(_syncQueue, ^{
        if (index < [self->_array count]) {
            obj = self->_array[index];
        }
    });
    return obj;
}

- (NSEnumerator *)objectEnumerator{
    
    __block NSEnumerator *enu;
    dispatch_sync(_syncQueue, ^{
        enu = [self->_array objectEnumerator];
    });
    return enu;
}

- (void)insertObject:(id)anObject atIndex:(NSUInteger)index{
    
    dispatch_barrier_async(_syncQueue, ^{
        if (anObject && index < [self->_array count]) {
            [self->_array insertObject:anObject atIndex:index];
        }
    });
}

- (void)addObject:(id)anObject{
    
    dispatch_barrier_async(_syncQueue, ^{
        if(anObject){
            [self->_array addObject:anObject];
        }
    });
}

- (void)removeObjectAtIndex:(NSUInteger)index{
    
    dispatch_barrier_async(_syncQueue, ^{
        
        if (index < [self->_array count]) {
            [self->_array removeObjectAtIndex:index];
        }
    });
}

- (void)removeLastObject{
    
    dispatch_barrier_async(_syncQueue, ^{
        [self->_array removeLastObject];
    });
}

- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject{
    
    dispatch_barrier_async(_syncQueue, ^{
        if (anObject && index < [self->_array count]) {
            [self->_array replaceObjectAtIndex:index withObject:anObject];
        }
    });
}

- (NSUInteger)indexOfObject:(id)anObject{
    
    __block NSUInteger index = NSNotFound;
    dispatch_sync(_syncQueue, ^{
        for (int i = 0; i < [self->_array count]; i ++) {
            if ([self->_array objectAtIndex:i] == anObject) {
                index = i;
                break;
            }
        }
    });
    return index;
}

- (void)dealloc{
    
    if (_syncQueue) {
        _syncQueue = NULL;
    }
}

@end
