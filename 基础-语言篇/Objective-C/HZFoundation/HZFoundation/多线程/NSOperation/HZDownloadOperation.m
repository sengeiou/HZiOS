//
//  HZDownloadOperation.m
//  HZFoundation
//
//  Created by KB on 2018/8/8.
//  Copyright © 2018年 HZ. All rights reserved.
/*
   什么是文件内存映射呢
 
   文件内存映射是指把一个文件的内容映射到进程的内存虚拟地址空间中，这个实际上并没有为文件内容分配物理内存。实际上就相当于将内存地址值指向文件的磁盘地址。如果对这些内存进行读写，实际上就是对文件在磁盘上内容进行读写。
 
 */

#import "HZDownloadOperation.h"

@implementation HZDownloadOperation

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
@end
