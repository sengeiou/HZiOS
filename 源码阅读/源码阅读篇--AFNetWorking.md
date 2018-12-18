---
title: 源码阅读篇--AFNetWorking
date: 2016-03-08 10:35:23
categories: iOS 
tags: [iOS基础]
---

AFNetworking对于iOS开发者来说是一个十分熟悉的网络请求三方框架，本文就是就是对这个优秀三方框架的学习的一些总结；首先看一下最新的AFNetworking结构目录：
![AFNetworking结构目录](http://upload-images.jianshu.io/upload_images/117735-065c16fb6d316dad.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)    
<!--more-->    
 
 
##### AFNetworking包含的模块 
  
- 网络请求模块
- 网络监控模块
- 安全策略模块  
- 网络请求/响应序列化模块  
- UIKit的扩展模块    

##### AFNetworking 整体框架  
 
      【        AFNetworking         】
      【        UIKit集成模块          】
      【   请求序列化  】  【 响应序列化  】
      【会话】【网络监听模块】【网络安全模块】   
      
      
##### AFNetworking的主要类关系图  

      NSURLSession ---   AFSecurityPolicy  ---   AFNetworkReachabilityManager
                          |
                          |
                   AFURLSessionManager
                          |
                          |  继承
                   AFHTTPSessionManager
                       |          |
                       |          |
     AFURLRequestSerialzation  AFURLReponseSerialzation  
     
##### AFURLSessionManager 主要功能    

+ 创建和管理NSURLSession、NSURLSessionTask
+ 实现NSURLSessionDelegate等协议
+ 使用AFSecurityPolicy设置安全请求
+ 使用AFNetworkingReachabilityManager监控网络状态
  
      
##### AFNetworking便捷之处  
 
AFNetworking在使用过程中仅仅需要开发者考虑，HTTP Method、URL、Params、回调的Block中解析响应数据、错误的回调Block中处理错误展示的信息；对于数据的上传、下载、安全策略配置等方面的支持AFNetworking更让开发者减轻了不少开发量；  

##### AFNetworking 的简单使用案例   

     -(void)requestPhoneNumberBelong{
    NSURLSessionConfiguration* sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFHTTPSessionManager* sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:nil sessionConfiguration:sessionConfiguration];
    [sessionManager GET:@"http://tcc.taobao.com/cc/json/mobile_tel_segment.htm" parameters:@{@"tel":@"18518487767"} success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        NSStringEncoding gbkEncoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
        NSString *pageSource = [[NSString alloc] initWithData:responseObject encoding:gbkEncoding];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    }];
     }   

#####  AFHTTPSessionManager的创建解析  

创建sessionManger也是使用NSURLSessionConfiguration配置SessionConfiguration，使用AFSecurityPolicy来配置安全策略；   

```  
   +(instancetype)httpManager{
    static HZHTTPManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        /*
           设置安全策略
         */
        AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        manager.securityPolicy = securityPolicy;
    });
    return manager;
} 
```

##### AFNetworking网络任务的创建是在哪个线程执行的？   

对于这个问题首先看一下网络任务创建的代码片段   
    
        __block NSURLSessionDataTask *dataTask = nil;
    dispatch_sync(url_session_manager_creation_queue(), ^{
        NSLog(@"---->%@",[NSThread currentThread]);
        dataTask = [self.session dataTaskWithRequest:request];
    });     
    //  url_session_manager_creation_queue 的创建
    static dispatch_queue_t url_session_manager_creation_queue() {
    static dispatch_queue_t af_url_session_manager_creation_queue;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        af_url_session_manager_creation_queue = dispatch_queue_create("com.alamofire.networking.session.manager.creation", DISPATCH_QUEUE_SERIAL);
    });

    return af_url_session_manager_creation_queue;
    }

使用dispatch_sync在url_session_manager_creation_queue()函数返回的serial queue中执行request的请求，因此AFNetworking在创建网络任务的时候所在的线程取决于你网络任务发起所在的线程（主线程或是你自己创建的线程中）；  
   
**对于这个段代码片段究竟有什么作用？看资料的解释是为了解决iOS 8.0以下版本中偶发的taskIdentifiers不唯一的bug；**   

##### AFNetworking网络任务的完成回调是在哪个线程执行的？   
  

      NSError *serializationError = nil;
    NSMutableURLRequest *request = [self.requestSerializer requestWithMethod:method URLString:[[NSURL URLWithString:URLString relativeToURL:self.baseURL] absoluteString] parameters:parameters error:&serializationError];
    if (serializationError) {
        if (failure) {
    #pragma clang diagnostic push
    #pragma clang diagnostic ignored "-Wgnu"
            dispatch_async(self.completionQueue ?: dispatch_get_main_queue(), ^{
                failure(nil, serializationError);
            });
    #pragma clang diagnostic pop
        }

        return nil;
    }

**代码中如果NSMutableURLRequest的对象创建失败，当completionQueue为nil时，会异步在main queue中执行失败回调，也就是在主线程中处理错误回调；**   

当数据请求完成会回调`- (void)URLSession:(__unused NSURLSession *)session   task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error` 方法；此方法中存在代码片段    

         dispatch_async(dispatch_get_main_queue(), ^{
                    [[NSNotificationCenter defaultCenter] postNotificationName:AFNetworkingTaskDidCompleteNotification object:task userInfo:userInfo];
                });    
所以AFNetworking在NSURLSession完成数据请求回调之后会在主线程里发送AFNetworkingTaskDidCompleteNotification通知，即AFNetworking网络任务的完成回调处理是在**主线程**中完成的；   

#####  AFSecurityPolicy      

AFSecurityPolicy可以简化客户端配置安全策略的工作量；AFSecurityPolicy提供了三种模式：  
  
- AFSSLPinningModeNone:这个模式表示不做SSL pinning，只跟浏览器一样在系统的信任机构列表里验证服务端返回的证书。若证书是信任机构签发的就会通过，若是自己服务器生成的证书，这里是不会通过的。   
- AFSSLPinningModeCertificate：这个模式表示用证书绑定方式验证证书，需要客户端保存有服务端的证书拷贝，这里验证分两步，第一步验证证书的域名/有效期等信息，第二步是对比服务端返回的证书跟客户端返回的是否一致。   
- AFSSLPinningModePublicKey：这个模式同样是用证书绑定方式验证，客户端要有服务端的证书拷贝，只是验证时只验证证书里的公钥，不验证证书的有效期等信息。只要公钥是正确的，就能保证通信不会被窃听，因为中间人没有私钥，无法解开通过公钥加密的数据。

#####  客户端配置HTTPS的方式   

客户端验证HTTPS协议的一种方式是将把服务端证书(需要转换成cer格式)放到APP项目资源里，AFSecurityPolicy会自动寻找根目录下所有cer文件   

     AFSecurityPolicy *securityPolicy = [AFSecurityPolicy               policyWithPinningMode:AFSSLPinningModePublicKey];
    securityPolicy.allowInvalidCertificates = YES;
     [AFHTTPRequestOperationManager manager].securityPolicy = securityPolicy;  
    [manager GET:@"https://example.com/" parameters:nil         success:^(AFHTTPRequestOperation *operation, id responseObject) {
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    }];

> [AFNetworking2.0](http://blog.cnbang.net/tech/2456/)这个系列对源码进行了更详细的解析可以参照。  


#### AFN2.X需要设置线程保活的原因    【2018/08/16更新】

AFN2.X基于NSURLConnection，而NSURLConnection的痛点是创建线程发请求，该线程不销毁一直等待回调，回调处理完成后销毁，这样就涉及频繁的线程创建和销毁，导致性能问题   

AFN2.X开辟了一个子线程，设置Runloop使得线程常驻，所有请求回调都在该线程上发起和回调   

**同一个常驻线程发起网络请求是不是网络请求就变成了单线程访问了**  

实际上每一个请求对应一个AFHTTPRequestOperation实例对象Operation创建后都被加入到了NSOperationQueue中，NSOperationQueue来控制并发，并且创建线程的数量也是由系统控制的；

#### AFN2.X是如何创建一个常驻线程的  

    + (NSThread*)networkRequestThread {
       static NSThread*_networkRequestThread = nil;
          static dispatch_once_t oncePredicate;
            dispatch_once(&oncePredicate, ^{
                   _networkRequestThread = [[NSThread alloc] initWithTarget:self selector:@selector(networkRequestThreadEntryPoint:) object:nil];
                [_networkRequestThread start];
            });
      return _networkRequestThread;
    }

	+ (void)networkRequestThreadEntryPoint:(id)__unused object {
	    @autoreleasepool {
	        [[NSThread currentThread] setName:@"AFNetworking"];
	        
	        NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
	        [runLoop addPort:[NSMachPort port] forMode:NSDefaultRunLoopMode];
	        [runLoop run];
	    }
	}

#### AFN3.X为什么不需要设置线程保活呢  

AFN3.X基于NSURLSession，NSURLSession发起的请求，不再需要在当前线程进行代理方法的回调！可以指定回调的delegateQueue，这样我们就不用为了等待代理回调方法而苦苦保活线程了。 

##### AFN3.X中指定的用于接收回调的Queue的maxConcurrentOperationCount设为了1，使得所有回调要串行执行，为什么要串行回调呢？   

AFN3.X在创建请求生成Task时同时创建一个delegate，并且将task的taskIdentifier作为key，delegate作为value存储到了一个字典中，回调回来后为了避免多线程访问存储字典问题，即使maxConcurrentOperationCount不设置1，由于已经加锁控制，并发访问也没有任何意义；
   

		- (AFURLSessionManagerTaskDelegate *)delegateForTask:(NSURLSessionTask *)task {
		    NSParameterAssert(task);
		    AFURLSessionManagerTaskDelegate *delegate = nil;
		    [self.lock lock];
		    //给所要访问的资源加锁，防止造成数据混乱
		    delegate = self.mutableTaskDelegatesKeyedByTaskIdentifier[@(task.taskIdentifier)];
		    [self.lock unlock];
		    return delegate;
		}


> [AFNetworking3.0后为什么不再需要常驻线程？](https://www.jianshu.com/p/b5c27669e2c1)





