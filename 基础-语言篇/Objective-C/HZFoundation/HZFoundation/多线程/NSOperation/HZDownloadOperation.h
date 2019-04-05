//
//  HZDownloadOperation.h
//  HZFoundation
//
//  Created by KB on 2018/8/8.
//  Copyright © 2018年 HZ. All rights reserved.
/*
 * 自定义NSOperation
 */

#import <Foundation/Foundation.h>

@class HZDownloadOperation;
@protocol HZDownloadOperationDelegate<NSObject>
-(void)downloadOperation:(HZDownloadOperation *)operation withData:(NSData *)data;
@end

@interface HZDownloadOperation : NSOperation
@property(nonatomic,copy)NSString  *downloadUrl;
@property(nonatomic,strong)NSIndexPath *indexPath;
@property(nonatomic,weak)id<HZDownloadOperationDelegate> delegate;
@end

/*
   不借助SDWebImage如何在列表中加载图片
 
 //保证一个url对应一个image对象
 86     UIImage *image=self.images[app.icon];   // images可使用NSCache存储{内存+本地}
 87     if (image) {//缓存中有图片
 88         cell.imageView.image=image;
 89     }else       //  缓存中没有图片，得下载
 90     {
 91         //先设置一张占位图片
 92         cell.imageView.image=[UIImage imageNamed:@"57437179_42489b0"];
 93         YYdownLoadOperation *operation=self.operations[app.icon];
 94         if (operation) {//正在下载
 95             //什么都不做
 96         }else  //当前没有下载，那就创建操作
 97         {
 98             operation=[[YYdownLoadOperation alloc]init];
 99             operation.url=app.icon;
 100             operation.indexPath=indexPath;
 101             operation.delegate=self;
 102             [self.queue addOperation:operation];//异步下载
 103             self.operations[app.icon]=operation;
 104         }
 105     }
 */
