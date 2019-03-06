## UITableView的重用机制 

+ UITableView在创建cell时，触发	`cellForRowAtIndexPath`，首先会在重用池中根据`Identifier`查询，如果没有则会创建cell；
+ UITableView一次创建cell的数量为整个屏幕可显示的cell数量
+ 当UITableView发生滚动时，顶部的cell将要移除屏幕，此时因重用池中没有identitier标识的cell，所以会再创建一个cell，
+ 当顶部的cell被移除屏幕后就会被加入到重用池中，

## 重用池使用的数据结构

猜想应该是`NSCache`，（1）根据key值可以快速查询（2）收到内存警告可以自动清理缓存

## 设计一个视图的重用池


	#import <Foundation/Foundation.h>
	#import <UIKit/UIKit.h>
	@interface ViewReusePool : NSObject
	// 从重用池中取出一个可重用的view
	-(UIView*)dequeueReusableView;
	//向重用池中添加一个视图
	-(void)addUsingView:(UIView*)view;
	// 重置方法，将当前使用中的视图移动到可重用队列当中
	-(void)reset;
	@end



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

+ usingQueue: 新创建的视图或者从缓存中获取的视图都会被加入到usingQueue
+ waitUsedQueue:当重用池被reset后，usingQueue中的视图会被迁移到usingQueue中；

     


