title: iOS核心动画阅读笔记(五)
date: 2015-01-08 09:30  
categories: iOS 
tags: [iOS基础]
---
## 线程加载  
  
> 使用UICollectionView加载纯图片列表，图片尺寸在800x600左右；在列表发生滚动时，图片实时加载导致界面出现卡动；使用instrument显示时间都消耗在UIImage的+imageWithContentsOfFile:方法中了；  
  
<!--more-->

![屏幕快照 ](http://upload-images.jianshu.io/upload_images/117735-0e46651c3c598019.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)  
  
`可以肯定的是+imageWithContentsOfFile:将文件转化为图片然后在UIImageView上显示这个过程会消耗一定的时间，可以将该过程放在另外一个线程中处理`   
  
> 将图片获取放在另外线程中后的情况，如下图所示 
  

![屏幕快照](http://upload-images.jianshu.io/upload_images/117735-40384fb2f5a767b2.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)  
  
## 延迟解压  
  
> - 一旦图片文件被加载就必须要进行解码，解码过程是一个相当复杂的任务，需要消耗非常长的时间。解码后的图片将同样使用相当大的内存。  
>- 当加载图片的时候，iOS通常会延迟解压图片的时间，直到加载到内存之后。这就会在准备绘制图片的时候影响性能，因为需要在绘制之前进行解压（通常是消耗时间的问题所在  
  
## 缓存  
  
### +imageNamed:方法  
  
* [UIImage imageNamed:]方法仅仅适用于在应用程序资源束目录下的图片,对于其他资源图片无能为力
* [UIImage imageNamed:]缓存用来存储应用界面的图片（按钮，背景等等）。如果对照片这种大图也用这种缓存，那么iOS系统就很可能会移除这些图片来节省内存。那么在切换页面时性能就会下降  
* [UIImage imageNamed:]缓存机制并不是公开的，所以你不能很好地控制它
* [UIImage imageNamed:]能够解决系统的延迟解压  
  
### 自定义缓存  
  
> 设计一个缓存要考虑哪些方面  
  
* 要缓存数据的存储  
* 缓存数据的获取  
* 缓存数据的失效后更新 
* 缓存数据的移除  
  
### NSCache  
  
> NSCache和NSDictionary类似。你可以通过-setObject:forKey:和-object:forKey:方法分别来插入，检索。和字典不同的是，NSCache在系统低内存的时候自动丢弃存储的对象。

>  NSCache用来判断何时丢弃对象的算法并没有在文档中给出，但是你可以使用-setCountLimit:方法设置缓存大小，以及-setObject:forKey:cost:来对每个存储的对象指定消耗的值来提供一些暗示 

    - (UIImage *)loadImageAtIndex:(NSUInteger)index
	{
	    //set up cache
	    static NSCache *cache = nil;
	    if (!cache) {
	        cache = [[NSCache alloc] init];
	    }
	    //if already cached, return immediately
	    UIImage *image = [cache objectForKey:@(index)];
	    if (image) {
	        return [image isKindOfClass:[NSNull class]]? nil: image;
	    }
	    //set placeholder to avoid reloading image multiple times
	    [cache setObject:[NSNull null] forKey:@(index)];
	    //switch to background thread
	    dispatch_async( dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
	        //load image
	        NSString *imagePath = self.imagePaths[index];
	        UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
	        //redraw image using device context
	        UIGraphicsBeginImageContextWithOptions(image.size, YES, 0);
	        [image drawAtPoint:CGPointZero];
	        image = UIGraphicsGetImageFromCurrentImageContext();
	        UIGraphicsEndImageContext();
	        //set image for correct image view
	        dispatch_async(dispatch_get_main_queue(), ^{ //cache the image
	            [cache setObject:image forKey:@(index)];
	            //display the image
	            NSIndexPath *indexPath = [NSIndexPath indexPathForItem: index inSection:0]; UICollectionViewCell *cell = [self.collectionView cellForItemAtIndexPath:indexPath];
	            UIImageView *imageView = [cell.contentView.subviews lastObject];
	            imageView.image = image;
	           });
	    });
	    //not loaded yet
	    return nil;
	}  
 
  
## 图层性能  
  
### 隐式绘制  
  
#### 文本  
  
> CATextLayer和UILabel都是直接将文本绘制在图层的寄宿图中。事实上这两种方式用了完全不同的渲染方式：在iOS 6及之前，UILabel
用WebKit的HTML渲染引擎来绘制文本，而CATextLayer用的是Core Text.后者渲染更迅速，所以在所有需要绘制大量文本的情形下都优先使用它吧。但是这两种方法都用了软件的方式绘制，因此他们实际上要比硬件加速合成方式要慢   
  
####   光栅化
  
>  启用shouldRasterize
属性会将图层绘制到一个屏幕之外的图像。然后这个图像将会被缓存起来并绘制到实际图层的contents
和子图层。如果有很多的子图层或者有复杂的效果应用，这样做就会比重绘所有事务的所有帧划得来得多   
  
### 离屏渲染  
  
> 当图层属性的混合体被指定为在未预合成之前不能直接在屏幕中绘制时，屏幕外渲染就被唤起了。屏幕外渲染并不意味着软件绘制，但是它意味着图层必须在被显示之前在一个屏幕外上下文中被渲染（不论CPU还是GPU）。  
  
#### CAShapeLayer  
  
> cornerRadius和maskToBounds独立作用的时候都不会有太大的性能问题，但是当他俩结合在一起，就触发了屏幕外渲染