###  进程和线程 
  
+ 进程:系统所能分配资源和调度的基本单位
+ 线程：进程分配资源的最小单位，独立执行无分支的代码片段  

### 同步和异步 

+ 同步：在当前任务所处的线程中执行Task
+ 异步：新创建线程执行Task

### 串行和并发  并行

+ 串行：遵循队列属性，依次执行
+ 并发：多个任务交替使用CPU执行的
+ 并行： 多个任务在不同CPU中执行

### NSThread    

#### NSThread的启动过程  

    [NSThread new] --> start() --> 创建pthread --> main() --> [target performSelector:] --> exit()
    
#### 常驻线程  
 
####  NSThread 的内部实现机制  


### GCD  

#### 同步串行   

    - (void)viewDidLoad {

      #parma mark -- (1)
	    dispatch_sync(dispatch_get_main_queue(), ^{
	        /*
	         执行这段代码会造成死锁
	         + 主队列中存在viewDidLoad，block；
	         + viewDidLoad执行中调用Blcok
	         + 由于队列的属性block的执行依赖于viewDidLoad
	         + 因此会造成viewDidLoad与block之间相互等待,造成死锁
	         */
	    });
	    
	    #parma mark -- (2)
	     dispatch_queue_t serialQueue = dispatch_queue_create("serial_queue", DISPATCH_QUEUE_SERIAL);
    dispatch_sync(serialQueue, ^{
        // 在主队列中执行没有问题
    });
    }
    
#### 同步并发队列  

    - (void)viewDidLoad { 
    dispatch_queue_t concurrentQueue = dispatch_queue_create("concurrentQueue", DISPATCH_QUEUE_CONCURRENT);
    NSLog(@"1");
    dispatch_sync(concurrentQueue, ^{
        NSLog(@"2");
        dispatch_sync(concurrentQueue, ^{
            NSLog(@"3");
        });
        NSLog(@"4");
    });
    NSLog(@"5");  // 执行结果是 1-2-3-4-5
    }  
    
#### 异步串行    

    - (void)viewDidLoad {
	    [super viewDidLoad];
	    dispatch_async(dispatch_get_main_queue(), ^{
	        
	    });
    }
    
#### 异步并发   

	  - (void)viewDidLoad {
	    [super viewDidLoad];
	    dispatch_async(concurrentQueue, ^{
	        NSLog(@"1");
	        [self performSelector:@selector(printLog)
	                   withObject:nil
	                   afterDelay:0];
	        NSLog(@"3");
	        /*
	         执行结果是 1-3;
	         GCD创建子线程默认没有开启runloop循环
	         performSelector底层需要将Task加入到Runloop，，没有Runloop，
	         因此不会打印2
	         */
	        
	    });
	    }
	    
	   - (void)printLog{
         NSLog(@"2");
      }  
      
#### 实现多读单写操作  

	    #pragma mark -- 利用dispatch_barrier_async和DISPATCH_QUEUE_CONCURRENT实现对象属性读写的线程安全操作
	-(void)setCount:(NSInteger)count{
	    dispatch_barrier_async(_concurrentQueue, ^{
	        _count = count;
	    });
	}
	
	-(NSInteger)count{
	    __block NSInteger temp = 0 ;
	    dispatch_sync(_concurrentQueue, ^{
	        temp = _count;
	    });
	    return temp;
	}  
	
#### 实现多任务下载后的通知  

    -(void)dowloadTasks1{
    dispatch_group_t group  = dispatch_group_create();
    dispatch_queue_t queue = dispatch_queue_create("com.hua", DISPATCH_QUEUE_CONCURRENT);
    NSMutableArray* tempArray = [NSMutableArray array];//线程安全不安全，替换集合存储
    for (NSUInteger index=0; index<10; index++) {
        dispatch_group_enter(group);
        dispatch_group_async(group,queue, ^{
           
            // 下载任务
            dispatch_group_leave(group);
            [tempArray addObject:@(index)];
        });
    }
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"task finished===>:%@",tempArray);//此任务在主线程中执行
    });
    }
    
#### dispatch_semaphore_t   

      创建信号量
		 dispatch_semaphore_create
		 发送信号量 [使得信号量常数 +1]
		 dispatch_semaphore_signal
		 等待信号量 [如果信号量为0则根据设置的时间一直处于等待中，如果大于0则，做-1操作]
		 dispatch_semaphore_wait
    
### NSOperation
 
#### 利用NSOperationQueue+dispatch_semaphore_t实现 A->B->C网络请求任务    

    -(void)requestAWithCompleteHandler:(void(^)(NSArray *data))completerHandler{
	    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
	    //模拟网络请求
	    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
	        [NSThread sleepForTimeInterval:2.0];
	        completerHandler(nil);
	        dispatch_semaphore_signal(semaphore);
	    });
	    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
	    NSLog(@"task a ....");
     }

	-(void)requestBWithCompleteHandler:(void(^)(NSArray *data))completerHandler{
	    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
	    //模拟网络请求
	    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
	        [NSThread sleepForTimeInterval:1.0];
	        completerHandler(nil);
	        dispatch_semaphore_signal(semaphore);
	    });
	    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
	    NSLog(@"task b ....");
	    
	
	}

	-(void)requestCWithCompleteHandler:(void(^)(NSArray *data))completerHandler{
	    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
	    //模拟网络请求
	    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
	        [NSThread sleepForTimeInterval:0.5];
	        completerHandler(nil);
	        dispatch_semaphore_signal(semaphore);
	    });
	    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
	    NSLog(@"task c ....");
	}
	
	
	-(void)test1 {
	    // A --> B --> C  ： dispatch_semaphore_t + NSBlockOperation设置依赖
	    // 创建operationA
	    NSBlockOperation* blockOperationA = [NSBlockOperation blockOperationWithBlock:^{
	        [self requestAWithCompleteHandler:^(NSArray *data) {
	            NSLog(@"====> A");
	        }];
	    }];
	    // 创建operationB
	    NSBlockOperation* blockOperationB = [NSBlockOperation blockOperationWithBlock:^{
	        [self requestBWithCompleteHandler:^(NSArray *data) {
	            NSLog(@"====> B");
	        }];
	    }];
	    
    // 创建operationC
    NSBlockOperation* blockOperationC = [NSBlockOperation blockOperationWithBlock:^{
        [self requestCWithCompleteHandler:^(NSArray *data) {
            NSLog(@"====> C");
        }];
    }];
    
    // 创建operationQueue
    NSOperationQueue* operationQueue = [[NSOperationQueue alloc] init];
    
    // operation之间添加依赖关系
    [blockOperationB addDependency:blockOperationA];
    [blockOperationC addDependency:blockOperationB];
    
    [operationQueue addOperation:blockOperationA];
    [operationQueue addOperation:blockOperationB];
    [operationQueue addOperation:blockOperationC];
    
    }

#### 自定义NSOperation  

重写NSOperation的main方法  

	    -(void)main{
	    NSError *error = [[NSError alloc] initWithDomain:@"HZDownloadOperation" code:-1000 userInfo:@{@"msg":@"download error"}];
	    /*
	        NSDataReadingMappedIfSafe
	        使用此参数iOS不会将文件加载到内存空间中，而是放在进程的地址空间中，可以解决应用内存占用问题
	     */
	    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.downloadUrl] options:NSDataReadingMappedIfSafe error:&error];
	    dispatch_async(dispatch_get_main_queue(), ^{
	        if ([self.delegate respondsToSelector:@selector(downloadOperation:withData:)]) {
	            [self.delegate downloadOperation:self withData:imageData];
	        }
	    });
	 }

#### NSOperation的任务执行状态  

    blockOperation.isReady ;
    blockOperation.isExecuting;
    blockOperation.isFinished;
    blockOperation.isCancelled;  
    
#### NSOperation的任务执行控制  

+ 只是重写main()函数，任务执行状态{执行、退出}有系统自动控制
+ 如果重写start()方法，自行控制任务状态；{重写start()会覆盖掉系统实现的状态控制}、{NSOperation的移除是通过KVO实现的}

### 多线程中的锁   

#### @synchronized   
实现多线程安全创建单例对象  

#### atomic 属性关键字  

    self.array = [NSMutableArray array];// 线程安全
    [self.array addObject:@"1"];// 线程不安全  
    
#### 自旋锁：OSSpinLock  循环等待询问，不释放当前资源【类似while循环】  

用于轻量级数据访问。retainCount +1/-1  

#### NSLock   

    /*
      // A方法调用会导致死锁
      -(void)A{
         [lock lock];
         [self methodB];
         [lock unlock];
      }
      
      -(void)B{
        [lock lock];
         // 操作逻辑
        [lock unlock];
      }
      */   
       
#### 递归锁 NSRecursiveLock   

    /*
      NSRecursiveLock可以递归调用
     -(void)A{
         [RecursiveLock lock];
         [self methodB];
         [RecursiveLock unlock];
     }
     
     -(void)B{
         [RecursiveLock lock];
         // 操作逻辑
         [RecursiveLock unlock];
     }
     */
     
#### dispatch_semaphore_t    

     /*
     (1)   dispatch_semaphore_create(<#long value#>)
        struct semaphore {
            int value;
            List<thread>; // 线程队列
        };
     
      (2)   dispatch_semaphore_wait(){
         S.value = S.value -1 ;
         if S.value < 0 then Block(S.list) ==> 阻塞是一个主动的行为
         }
     
     (3)  dispatch_semaphore_signal(){
             S.value = S.value + 1;
             if S.value <= 0 then wakeup(S.list); ==> 唤醒是一个被动行为
          }
     
     */  
     



