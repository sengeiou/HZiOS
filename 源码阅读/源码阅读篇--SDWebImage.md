title: 源码阅读篇--SDWebImage
date: 2016-10-26 17:49:27
categories: iOS 
tags: [iOS开源代码阅读]
---

SDWebImage提供的简洁的获取远程URL图片的API；平时开发中使用最多场景就是列表中的cell中要显示远程图片的需求，在具体的实现中要避免加载图片造成的界面卡顿，列表卡顿等现象的出现；所以需要编码实现如下功能：  
  
 - 使用占位图片显示UI界面，异步线程加载图片成功后刷新控件
 - 缓存机制，下载过的图片做内存缓存和磁盘缓存 
 - app内存吃紧的状态下移除缓存的内容 
 
<!--more-->    
 
**对于上述的需求SDWebImage已经完全优雅的实现，并且提供了更多简洁的API供开发者使用**   

#### SDWebImage的框架结构  

        【UIImageView + WebCache】
          【SDWebImageManager】
    【SDImageCache】 【SDWebImageDownloader】 

#### github上一个关于SDWebImage的时序图  

<div align=center>
<img src="https://raw.githubusercontent.com/rs/SDWebImage/master/Docs/SDWebImageSequenceDiagram.png" width="800" height="300" alt="SDWebImage浅析"/>
</div>      

上述的时序图大致介绍了SDWebImage的工作流程，而SDWebImage框架的构成是由多个组件构成，下面就一一介绍SDWebImage提供的便利组件；

#### SDImageCache  

SDImageCache这个类主要的任务就是对图像进行存储；内存缓存，本地磁盘缓存，使用处理后的URL作为key，便于查找，删除，存储操作；SDImageCache提供了如下API

    - (void)storeImage:(UIImage *)image forKey:(NSString *)key;
    - (void)storeImage:(UIImage *)image forKey:(NSString *)key toDisk:(BOOL)toDisk;
    
    - (UIImage *)imageFromMemoryCacheForKey:(NSString *)key;
    - (UIImage *)imageFromDiskCacheForKey:(NSString *)key;   
    
##### SDImageCacheType  

在使用SD时，SDImageCache提供了多种缓存类型来适应不同的场景需求  

       
    typedef NS_ENUM(NSInteger, SDImageCacheType) {
    /**
     * The image wasn't available the SDWebImage caches, but was downloaded from the web.
     */
    SDImageCacheTypeNone,
    /**
     * The image was obtained from the disk cache.
     */
    SDImageCacheTypeDisk,
    /**
     * The image was obtained from the memory cache.
     */
    SDImageCacheTypeMemory
    };   
 
    
##### 内存缓存  

- 内存存储SD选用的存储类是NSCache；它具有的优点是线程安全，可控存储大小，内存吃紧时系统会自动回收缓存对象；而SD在创建NSCache时也监听了UIApplicationDidReceiveMemoryWarningNotification、UIApplicationWillTerminateNotification、UIApplicationDidEnterBackgroundNotification等通知，适当的时期移除了内存缓存的图像；  
- SDImageCache 暴露了maxMemoryCost、maxMemoryCountLimit等属性来供使用者设置内存缓存的存储空间   

##### 磁盘存储  

- SD对于磁盘存储同样开放自定义存储路径  
- SD创建了一个serial queue 来异步执行耗时的磁盘存储任务；将NSData写到指定目录，同时默认不执行iCloud同步  

#### SDWebImageDecoder 
   
**一道面试题问道SD为什么要对图片进行解压缩？**  

> “解压图片 - PNG或者JPEG压缩之后的图片文件会比同质量的位图小得多。但是在图片绘制到屏幕上之前，必须把它扩展成完整的未解压的尺寸（通常等同于图片宽 x 长 x 4个字节）。为了节省内存，iOS通常直到真正绘制的时候才去解码图片。根据你加载图片的方式，第一次对图层内容赋值的时候（直接或者间接使用UIImageView）或者把它绘制到Core Graphics中，都需要对它解压，这样的话，对于一个较大的图片，都会占用一定的时间”  

**在图片解压操作中SD的一些优化处理** 

在下载大量图片时产生了 the bitmap context，为了避免管理内存 SD自创建autoreleasepool来管理；解压的过程实质是创建一个适合的画布将压缩的image对象绘制到画布上然后返回绘制的image对象  

**阿尔法通道(Alpha Channel)是指一张图片的透明和半透明度** 

#### SDWebImageManager  

SDWebImageManager这个类负责了整个框架API的调用；（1）图片从缓存中获取（2）图片从服务端获取 （3）图片下载之后的缓存 （4）图片的解码 （5）未下载完成图片operation的取消 这些操作统一由 SDWebImageManager来调用各个组件进行完成；     

SDWebImageManager提供下面的API来完成图片的获取操作  

    - (id <SDWebImageOperation>)downloadImageWithURL:(NSURL *)url
                                         options:(SDWebImageOptions)options
                                        progress:(SDWebImageDownloaderProgressBlock)progressBlock
                                       completed:(SDWebImageCompletionWithFinishedBlock)completedBlock;   
                                       
 具体的执行包括  
   
 - 缓存获取图片返回image对象  
 - 缓存中未获取图片  
    - 有正在执行的任务cancel掉当前operation  
    - 执行下载操作  
    - 下载成功返回image对象
    - 缓存图片
                                          

#### SDWebImageDownloader  

SD基于NSURLSession实现下载图片任务，同时结合NSOperationQueue控制最大的并发task量为6；
默认的下载是first in frist out 新加入的operation执行要依赖最后添加到队列中的task；  

SDWebImageDownloader提供如下API来实现图片的下载操作 

    - (id <SDWebImageOperation>)downloadImageWithURL:(NSURL *)url
                                         options:(SDWebImageDownloaderOptions)options
                                        progress:(SDWebImageDownloaderProgressBlock)progressBlock
                                       completed:(SDWebImageDownloaderCompletedBlock)completedBlock;   
                                         

#### SDWebImageDownloaderOperation   
 
执行下载操作的类，对网络请求的数据进行解析和处理操作   

#### 当某一个UIImageView执行下载图片但是它有下载任务还未完成该如何操作？  

通常解决这类问题就是设置一个属性字段作为标识符但是在objective-c的分类中不能增加属性来标识当前UIImageView有下载任务；那么该如何解决？
SD的解决方案是运用运行时的关联对象的特性给UIImageView增加了一个可变字典属性  

    - (NSMutableDictionary *)operationDictionary {
    NSMutableDictionary *operations = objc_getAssociatedObject(self, &loadOperationKey);
    if (operations) {
        return operations;
    }
    operations = [NSMutableDictionary dictionary];
    objc_setAssociatedObject(self, &loadOperationKey, operations, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return operations;
    }




<div align=center>
<img src="https://raw.githubusercontent.com/rs/SDWebImage/master/SDWebImage_logo.png" width="300" height="100" alt="SDWebImage浅析"/>
</div>


 
 

 

