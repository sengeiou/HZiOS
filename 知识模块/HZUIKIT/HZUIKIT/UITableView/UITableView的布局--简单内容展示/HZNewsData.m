//
//  HZNewsData.m
//  HZThreeParty
//
//  Created by 华天杰 on 2018/10/16.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "HZNewsData.h"

@implementation HZNewsData
+ (NSArray *)newsData{
    return @[
             @{@"avatar_image_url":@"http://tvax2.sinaimg.cn/crop.0.0.512.512.1024/ee14d0c0ly8fr9wg48vczj20e80e8jrp.jpg",
               @"title":@"cpu01",
               @"content":@"每一个UIView都",
               @"detail_image_url":@"http://wx3.sinaimg.cn/bmiddle/470bf257ly1fwa19r96rzj20hs0dcabj.jpg"}
             ,
             @{@"avatar_image_url":@"http://tvax3.sinaimg.cn/crop.0.0.1002.1002.50/791ffc07ly8fkxeajz01aj20ru0rvq3d.jpg",
               @"title":@"cpu02",
               @"content":@"UIView的绘制和渲染是两个过程，当UIView被绘制时，CPU执行drawRect，通过context将数据写入backing store"
               },
             @{@"avatar_image_url":@"http://tvax1.sinaimg.cn/crop.0.0.1098.1098.50/470bf257ly1fgjiyat1xfj20uk0ukaff.jpg",
               @"title":@"003-123text",
               @"content":@"当backing store"
               },
             @{@"avatar_image_url":@"http://tva1.sinaimg.cn/crop.97.0.395.395.50/763d0907gw1eicpf6s9m3j20gi0b00wg.jpg",
               @"title":@"004123",
               @"content":@"每一个UIView都有一个layer，每一个layer都有个content，这个content指向的是一块缓存，叫做backing store。",
               @"detail_image_url":@"http://wx3.sinaimg.cn/bmiddle/470bf257ly1fwa19r96rzj20hs0dcabj.jpg"},
             @{@"avatar_image_url":@"http://tvax2.sinaimg.cn/crop.0.0.512.512.1024/ee14d0c0ly8fr9wg48vczj20e80e8jrp.jpg",
               @"title":@"cpu01",
               @"content":@"每一个",
               @"detail_image_url":@"http://wx3.sinaimg.cn/bmiddle/470bf257ly1fwa19r96rzj20hs0dcabj.jpg"}
             ,
             @{@"avatar_image_url":@"http://tvax3.sinaimg.cn/crop.0.0.1002.1002.50/791ffc07ly8fkxeajz01aj20ru0rvq3d.jpg",
               @"title":@"cpu02",
               @"content":@"UIView的绘制和渲染是两个过程，当UIView被绘制时，CPU执行drawRect，通过context将数据写入backing store"
               },
             @{@"avatar_image_url":@"http://tvax1.sinaimg.cn/crop.0.0.1098.1098.50/470bf257ly1fgjiyat1xfj20uk0ukaff.jpg",
               @"title":@"003-123text",
               @"content":@"当backing store写完后，通过render server交给GPU去渲染，将backing store中的bitmap数据显示在屏幕上。"
               },
             @{@"avatar_image_url":@"http://tva1.sinaimg.cn/crop.97.0.395.395.50/763d0907gw1eicpf6s9m3j20gi0b00wg.jpg",
               @"title":@"004123",
               @"content":@"每一个UIView都有一个layer，每一个layer都有个content，这个content指向的是一块缓存，叫做backing store。",
               @"detail_image_url":@"http://wx3.sinaimg.cn/bmiddle/470bf257ly1fwa19r96rzj20hs0dcabj.jpg"}
             ,
             @{@"avatar_image_url":@"http://tvax2.sinaimg.cn/crop.0.0.512.512.1024/ee14d0c0ly8fr9wg48vczj20e80e8jrp.jpg",
               @"title":@"cpu01",
               @"content":@"每一个UIView都有一个layer，每一个layer都有个content，这个content指向的是一块缓存，叫做backing store。",
               @"detail_image_url":@"http://wx3.sinaimg.cn/bmiddle/470bf257ly1fwa19r96rzj20hs0dcabj.jpg"}
             ,
             @{@"avatar_image_url":@"http://tvax3.sinaimg.cn/crop.0.0.1002.1002.50/791ffc07ly8fkxeajz01aj20ru0rvq3d.jpg",
               @"title":@"cpu02",
               @"content":@"UIView的绘制和渲染是两个过程，当UIView被绘制时，CPU执行drawRect，通过context将数据写入backing store"
               },
             @{@"avatar_image_url":@"http://tvax1.sinaimg.cn/crop.0.0.1098.1098.50/470bf257ly1fgjiyat1xfj20uk0ukaff.jpg",
               @"title":@"003-123text",
               @"content":@"当backing store写完后，通过render server交给GPU去渲染，将backing store中的bitmap数据显示在屏幕上。"
               },
             @{@"avatar_image_url":@"http://tva1.sinaimg.cn/crop.97.0.395.395.50/763d0907gw1eicpf6s9m3j20gi0b00wg.jpg",
               @"title":@"004123",
               @"content":@"每一个UIView都有一个layer，每一个layer都有个content，这个content指向的是一块缓存，叫做backing store。",
               @"detail_image_url":@"http://wx3.sinaimg.cn/bmiddle/470bf257ly1fwa19r96rzj20hs0dcabj.jpg"},
             @{@"avatar_image_url":@"http://tvax2.sinaimg.cn/crop.0.0.512.512.1024/ee14d0c0ly8fr9wg48vczj20e80e8jrp.jpg",
               @"title":@"cpu01",
               @"content":@"每一个UIView都有一个layer，每一个layer都有个content，这个content指向的是一块缓存，叫做backing store。",
               @"detail_image_url":@"http://wx3.sinaimg.cn/bmiddle/470bf257ly1fwa19r96rzj20hs0dcabj.jpg"}
             ,
             @{@"avatar_image_url":@"http://tvax3.sinaimg.cn/crop.0.0.1002.1002.50/791ffc07ly8fkxeajz01aj20ru0rvq3d.jpg",
               @"title":@"cpu02",
               @"content":@"UIView的绘制和渲染是两个过程，当UIView被绘制时，CPU执行drawRect，通过context将数据写入backing store"
               },
             @{@"avatar_image_url":@"http://tvax1.sinaimg.cn/crop.0.0.1098.1098.50/470bf257ly1fgjiyat1xfj20uk0ukaff.jpg",
               @"title":@"003-123text",
               @"content":@"当backing store写完后，通过render server交给GPU去渲染，将backing store中的bitmap数据显示在屏幕上。"
               },
             @{@"avatar_image_url":@"http://tva1.sinaimg.cn/crop.97.0.395.395.50/763d0907gw1eicpf6s9m3j20gi0b00wg.jpg",
               @"title":@"004123",
               @"content":@"每一个UIView都有一个layer，每一个layer都有个content，这个content指向的是一块缓存，叫做backing store。",
               @"detail_image_url":@"http://wx3.sinaimg.cn/bmiddle/470bf257ly1fwa19r96rzj20hs0dcabj.jpg"},
             @{@"avatar_image_url":@"http://tvax2.sinaimg.cn/crop.0.0.512.512.1024/ee14d0c0ly8fr9wg48vczj20e80e8jrp.jpg",
               @"title":@"cpu01",
               @"content":@"每一个UIView都有一个layer，每一个layer都有个content，这个content指向的是一块缓存，叫做backing store。",
               @"detail_image_url":@"http://wx3.sinaimg.cn/bmiddle/470bf257ly1fwa19r96rzj20hs0dcabj.jpg"}
             ,
             @{@"avatar_image_url":@"http://tvax3.sinaimg.cn/crop.0.0.1002.1002.50/791ffc07ly8fkxeajz01aj20ru0rvq3d.jpg",
               @"title":@"cpu02",
               @"content":@"UIView的绘制和渲染是两个过程，当UIView被绘制时，CPU执行drawRect，通过context将数据写入backing store"
               },
             @{@"avatar_image_url":@"http://tvax1.sinaimg.cn/crop.0.0.1098.1098.50/470bf257ly1fgjiyat1xfj20uk0ukaff.jpg",
               @"title":@"003-123text",
               @"content":@"当backing store写完后，通过render server交给GPU去渲染，将backing store中的bitmap数据显示在屏幕上。"
               },
             @{@"avatar_image_url":@"http://tva1.sinaimg.cn/crop.97.0.395.395.50/763d0907gw1eicpf6s9m3j20gi0b00wg.jpg",
               @"title":@"004123",
               @"content":@"每一个UIView都有一个layer，每一个layer都有个content，这个content指向的是一块缓存，叫做backing store。",
               @"detail_image_url":@"http://wx3.sinaimg.cn/bmiddle/470bf257ly1fwa19r96rzj20hs0dcabj.jpg"},
             @{@"avatar_image_url":@"http://tvax2.sinaimg.cn/crop.0.0.512.512.1024/ee14d0c0ly8fr9wg48vczj20e80e8jrp.jpg",
               @"title":@"cpu01",
               @"content":@"每一个UIView都有一个layer，每一个layer都有个content，这个content指向的是一块缓存，叫做backing store。",
               @"detail_image_url":@"http://wx3.sinaimg.cn/bmiddle/470bf257ly1fwa19r96rzj20hs0dcabj.jpg"}
             ,
             @{@"avatar_image_url":@"http://tvax3.sinaimg.cn/crop.0.0.1002.1002.50/791ffc07ly8fkxeajz01aj20ru0rvq3d.jpg",
               @"title":@"cpu02",
               @"content":@"UIView的绘制和渲染是两个过程，当UIView被绘制时，CPU执行drawRect，通过context将数据写入backing store"
               },
             @{@"avatar_image_url":@"http://tvax1.sinaimg.cn/crop.0.0.1098.1098.50/470bf257ly1fgjiyat1xfj20uk0ukaff.jpg",
               @"title":@"003-123text",
               @"content":@"当backing store写完后，通过render server交给GPU去渲染，将backing store中的bitmap数据显示在屏幕上。"
               },
             @{@"avatar_image_url":@"http://tva1.sinaimg.cn/crop.97.0.395.395.50/763d0907gw1eicpf6s9m3j20gi0b00wg.jpg",
               @"title":@"004123",
               @"content":@"每一个UIView都有一个layer，每一个layer都有个content，这个content指向的是一块缓存，叫做backing store。",
               @"detail_image_url":@"http://wx3.sinaimg.cn/bmiddle/470bf257ly1fwa19r96rzj20hs0dcabj.jpg"},
             @{@"avatar_image_url":@"http://tvax2.sinaimg.cn/crop.0.0.512.512.1024/ee14d0c0ly8fr9wg48vczj20e80e8jrp.jpg",
               @"title":@"cpu01",
               @"content":@"每一个UIView都有一个layer，每一个layer都有个content，这个content指向的是一块缓存，叫做backing store。",
               @"detail_image_url":@"http://wx3.sinaimg.cn/bmiddle/470bf257ly1fwa19r96rzj20hs0dcabj.jpg"}
             ,
             @{@"avatar_image_url":@"http://tvax3.sinaimg.cn/crop.0.0.1002.1002.50/791ffc07ly8fkxeajz01aj20ru0rvq3d.jpg",
               @"title":@"cpu02",
               @"content":@"UIView的绘制和渲染是两个过程，当UIView被绘制时，CPU执行drawRect，通过context将数据写入backing store"
               },
             @{@"avatar_image_url":@"http://tvax1.sinaimg.cn/crop.0.0.1098.1098.50/470bf257ly1fgjiyat1xfj20uk0ukaff.jpg",
               @"title":@"003-123text",
               @"content":@"当backing store写完后，通过render server交给GPU去渲染，将backing store中的bitmap数据显示在屏幕上。"
               },
             @{@"avatar_image_url":@"http://tva1.sinaimg.cn/crop.97.0.395.395.50/763d0907gw1eicpf6s9m3j20gi0b00wg.jpg",
               @"title":@"004123",
               @"content":@"每一个UIView都有一个layer，每一个layer都有个content，这个content指向的是一块缓存，叫做backing store。",
               @"detail_image_url":@"http://wx3.sinaimg.cn/bmiddle/470bf257ly1fwa19r96rzj20hs0dcabj.jpg"}
             ,
             @{@"avatar_image_url":@"http://tvax2.sinaimg.cn/crop.0.0.512.512.1024/ee14d0c0ly8fr9wg48vczj20e80e8jrp.jpg",
               @"title":@"cpu01",
               @"content":@"每一个UIView都有一个layer，每一个layer都有个content，这个content指向的是一块缓存，叫做backing store。",
               @"detail_image_url":@"http://wx3.sinaimg.cn/bmiddle/470bf257ly1fwa19r96rzj20hs0dcabj.jpg"}
             ,
             @{@"avatar_image_url":@"http://tvax3.sinaimg.cn/crop.0.0.1002.1002.50/791ffc07ly8fkxeajz01aj20ru0rvq3d.jpg",
               @"title":@"cpu02",
               @"content":@"UIView的绘制和渲染是两个过程，当UIView被绘制时，CPU执行drawRect，通过context将数据写入backing store"
               },
             @{@"avatar_image_url":@"http://tvax1.sinaimg.cn/crop.0.0.1098.1098.50/470bf257ly1fgjiyat1xfj20uk0ukaff.jpg",
               @"title":@"003-123text",
               @"content":@"当backing store写完后，通过render server交给GPU去渲染，将backing store中的bitmap数据显示在屏幕上。"
               },
             @{@"avatar_image_url":@"http://tva1.sinaimg.cn/crop.97.0.395.395.50/763d0907gw1eicpf6s9m3j20gi0b00wg.jpg",
               @"title":@"004123",
               @"content":@"每一个UIView都有一个layer，每一个layer都有个content，这个content指向的是一块缓存，叫做backing store。",
               @"detail_image_url":@"http://wx3.sinaimg.cn/bmiddle/470bf257ly1fwa19r96rzj20hs0dcabj.jpg"},
             @{@"avatar_image_url":@"http://tvax2.sinaimg.cn/crop.0.0.512.512.1024/ee14d0c0ly8fr9wg48vczj20e80e8jrp.jpg",
               @"title":@"cpu01",
               @"content":@"每一个UIView都有",
               @"detail_image_url":@"http://wx3.sinaimg.cn/bmiddle/470bf257ly1fwa19r96rzj20hs0dcabj.jpg"}
             ,
             @{@"avatar_image_url":@"http://tvax3.sinaimg.cn/crop.0.0.1002.1002.50/791ffc07ly8fkxeajz01aj20ru0rvq3d.jpg",
               @"title":@"cpu02",
               @"content":@"UIView的绘制和渲染是两个过程，当UIView被绘制时，CPU执行drawRect，通过context将数据写入backing store"
               },
             @{@"avatar_image_url":@"http://tvax1.sinaimg.cn/crop.0.0.1098.1098.50/470bf257ly1fgjiyat1xfj20uk0ukaff.jpg",
               @"title":@"003-123text",
               @"content":@"当backing store写完后，通过render server交给GPU去渲染，将backing store中的bitmap数据显示在屏幕上。"
               },
             @{@"avatar_image_url":@"http://tva1.sinaimg.cn/crop.97.0.395.395.50/763d0907gw1eicpf6s9m3j20gi0b00wg.jpg",
               @"title":@"004123",
               @"content":@"每一个UIView都有一个layer，每一个layer都有个content，这个content指向的是一块缓存，叫做backing store。",
               @"detail_image_url":@"http://wx3.sinaimg.cn/bmiddle/470bf257ly1fwa19r96rzj20hs0dcabj.jpg"},
             @{@"avatar_image_url":@"http://tvax2.sinaimg.cn/crop.0.0.512.512.1024/ee14d0c0ly8fr9wg48vczj20e80e8jrp.jpg",
               @"title":@"cpu01",
               @"content":@"每一个UIView都有一个layer，每一个layer都有个content，这个content指向的是一块缓存，叫做backing store。",
               @"detail_image_url":@"http://wx3.sinaimg.cn/bmiddle/470bf257ly1fwa19r96rzj20hs0dcabj.jpg"}
             ,
             @{@"avatar_image_url":@"http://tvax3.sinaimg.cn/crop.0.0.1002.1002.50/791ffc07ly8fkxeajz01aj20ru0rvq3d.jpg",
               @"title":@"cpu02",
               @"content":@"UIView的绘制和渲染是两个过程，当UIView被绘制时，CPU执行drawRect，通过context将数据写入backing store"
               },
             @{@"avatar_image_url":@"http://tvax1.sinaimg.cn/crop.0.0.1098.1098.50/470bf257ly1fgjiyat1xfj20uk0ukaff.jpg",
               @"title":@"003-123text",
               @"content":@"当backing store写完后，通过render server交给GPU去渲染，将backing store中的bitmap数据显示在屏幕上。"
               },
             @{@"avatar_image_url":@"http://tva1.sinaimg.cn/crop.97.0.395.395.50/763d0907gw1eicpf6s9m3j20gi0b00wg.jpg",
               @"title":@"004123",
               @"content":@"每一个UIView都有一个layer，每一个layer都有个content，这个content指向的是一块缓存，叫做backing store。",
               @"detail_image_url":@"http://wx3.sinaimg.cn/bmiddle/470bf257ly1fwa19r96rzj20hs0dcabj.jpg"},
             @{@"avatar_image_url":@"http://tvax2.sinaimg.cn/crop.0.0.512.512.1024/ee14d0c0ly8fr9wg48vczj20e80e8jrp.jpg",
               @"title":@"cpu01",
               @"content":@"每一个UIView都有一个layer，每一个layer都有个content，这个content指向的是一块缓存，叫做backing store。",
               @"detail_image_url":@"http://wx3.sinaimg.cn/bmiddle/470bf257ly1fwa19r96rzj20hs0dcabj.jpg"}
             ,
             @{@"avatar_image_url":@"http://tvax3.sinaimg.cn/crop.0.0.1002.1002.50/791ffc07ly8fkxeajz01aj20ru0rvq3d.jpg",
               @"title":@"cpu02",
               @"content":@"UIView的绘制和渲染是两个过程，当UIView被绘制时，CPU执行drawRect，通过context将数据写入backing store"
               },
             @{@"avatar_image_url":@"http://tvax1.sinaimg.cn/crop.0.0.1098.1098.50/470bf257ly1fgjiyat1xfj20uk0ukaff.jpg",
               @"title":@"003-123text",
               @"content":@"当backing store写完后，通过render server交给GPU去渲染，将backing store中的bitmap数据显示在屏幕上。"
               },
             @{@"avatar_image_url":@"http://tva1.sinaimg.cn/crop.97.0.395.395.50/763d0907gw1eicpf6s9m3j20gi0b00wg.jpg",
               @"title":@"004123",
               @"content":@"每一个UIView都有一个layer，每一个layer都有个content，这个content指向的是一块缓存，叫做backing store。",
               @"detail_image_url":@"http://wx3.sinaimg.cn/bmiddle/470bf257ly1fwa19r96rzj20hs0dcabj.jpg"},
             @{@"avatar_image_url":@"http://tvax2.sinaimg.cn/crop.0.0.512.512.1024/ee14d0c0ly8fr9wg48vczj20e80e8jrp.jpg",
               @"title":@"cpu01",
               @"content":@"每一个UIView都有一个layer，每一个layer都有个content，这个content指向的是一块缓存，叫做backing store。",
               @"detail_image_url":@"http://wx3.sinaimg.cn/bmiddle/470bf257ly1fwa19r96rzj20hs0dcabj.jpg"}
             ,
             @{@"avatar_image_url":@"http://tvax3.sinaimg.cn/crop.0.0.1002.1002.50/791ffc07ly8fkxeajz01aj20ru0rvq3d.jpg",
               @"title":@"cpu02",
               @"content":@"UIView的绘制和渲染是两个过程，当UIView被绘制时，CPU执行drawRect，通过context将数据写入backing store"
               },
             @{@"avatar_image_url":@"http://tvax1.sinaimg.cn/crop.0.0.1098.1098.50/470bf257ly1fgjiyat1xfj20uk0ukaff.jpg",
               @"title":@"003-123text",
               @"content":@"当backing store写完后，通过render server交给GPU去渲染，将backing store中的bitmap数据显示在屏幕上。"
               },
             @{@"avatar_image_url":@"http://tva1.sinaimg.cn/crop.97.0.395.395.50/763d0907gw1eicpf6s9m3j20gi0b00wg.jpg",
               @"title":@"004123",
               @"content":@"每一个UIView都有一个layer，每一个layer都有个content，这个content指向的是一块缓存，叫做backing store。",
               @"detail_image_url":@"http://wx3.sinaimg.cn/bmiddle/470bf257ly1fwa19r96rzj20hs0dcabj.jpg"}
             ,
             @{@"avatar_image_url":@"http://tvax2.sinaimg.cn/crop.0.0.512.512.1024/ee14d0c0ly8fr9wg48vczj20e80e8jrp.jpg",
               @"title":@"cpu01",
               @"content":@"每一个UIView都有一个layer，每一个layer都有个content，这个content指向的是一块缓存，叫做backing store。",
               @"detail_image_url":@"http://wx3.sinaimg.cn/bmiddle/470bf257ly1fwa19r96rzj20hs0dcabj.jpg"}
             ,
             @{@"avatar_image_url":@"http://tvax3.sinaimg.cn/crop.0.0.1002.1002.50/791ffc07ly8fkxeajz01aj20ru0rvq3d.jpg",
               @"title":@"cpu02",
               @"content":@"UIView的绘制和渲染是两个过程，当UIView被绘制时，CPU执行drawRect，通过context将数据写入backing store"
               },
             @{@"avatar_image_url":@"http://tvax1.sinaimg.cn/crop.0.0.1098.1098.50/470bf257ly1fgjiyat1xfj20uk0ukaff.jpg",
               @"title":@"003-123text",
               @"content":@"当backing store写完后，通过render server交给GPU去渲染，将backing store中的bitmap数据显示在屏幕上。"
               },
             @{@"avatar_image_url":@"http://tva1.sinaimg.cn/crop.97.0.395.395.50/763d0907gw1eicpf6s9m3j20gi0b00wg.jpg",
               @"title":@"004123",
               @"content":@"每一个UIView都有一个layer，每一个layer都有个content，这个content指向的是一块缓存，叫做backing store。",
               @"detail_image_url":@"http://wx3.sinaimg.cn/bmiddle/470bf257ly1fwa19r96rzj20hs0dcabj.jpg"},
             @{@"avatar_image_url":@"http://tvax2.sinaimg.cn/crop.0.0.512.512.1024/ee14d0c0ly8fr9wg48vczj20e80e8jrp.jpg",
               @"title":@"cpu01",
               @"content":@"每一个UIView都有一个layer，每一个layer都有个content，这个content指向的是一块缓存，叫做backing store。",
               @"detail_image_url":@"http://wx3.sinaimg.cn/bmiddle/470bf257ly1fwa19r96rzj20hs0dcabj.jpg"}
             ,
             @{@"avatar_image_url":@"http://tvax3.sinaimg.cn/crop.0.0.1002.1002.50/791ffc07ly8fkxeajz01aj20ru0rvq3d.jpg",
               @"title":@"cpu02",
               @"content":@"UIView的绘制和渲染是两个过程，当UIView被绘制时，CPU执行drawRect，通过context将数据写入backing store"
               },
             @{@"avatar_image_url":@"http://tvax1.sinaimg.cn/crop.0.0.1098.1098.50/470bf257ly1fgjiyat1xfj20uk0ukaff.jpg",
               @"title":@"003-123text",
               @"content":@"当backing store写完后，通过render server交给GPU去渲染，将backing store中的bitmap数据显示在屏幕上。"
               },
             @{@"avatar_image_url":@"http://tva1.sinaimg.cn/crop.97.0.395.395.50/763d0907gw1eicpf6s9m3j20gi0b00wg.jpg",
               @"title":@"004123",
               @"content":@"每一个UIView都有一个layer，每一个layer都有个content，这个content指向的是一块缓存，叫做backing store。",
               @"detail_image_url":@"http://wx3.sinaimg.cn/bmiddle/470bf257ly1fwa19r96rzj20hs0dcabj.jpg"},
             @{@"avatar_image_url":@"http://tvax2.sinaimg.cn/crop.0.0.512.512.1024/ee14d0c0ly8fr9wg48vczj20e80e8jrp.jpg",
               @"title":@"cpu01",
               @"content":@"每一个UIView都有一个layer，每一个layer都有个content，这个content指向的是一块缓存，叫做backing store。",
               @"detail_image_url":@"http://wx3.sinaimg.cn/bmiddle/470bf257ly1fwa19r96rzj20hs0dcabj.jpg"}
             ,
             @{@"avatar_image_url":@"http://tvax3.sinaimg.cn/crop.0.0.1002.1002.50/791ffc07ly8fkxeajz01aj20ru0rvq3d.jpg",
               @"title":@"cpu02",
               @"content":@"UIView的绘制和渲染是两个过程，当UIView被绘制时，CPU执行drawRect，通过context将数据写入backing store"
               },
             @{@"avatar_image_url":@"http://tvax1.sinaimg.cn/crop.0.0.1098.1098.50/470bf257ly1fgjiyat1xfj20uk0ukaff.jpg",
               @"title":@"003-123text",
               @"content":@"当backing store写完后，通过render server交给GPU去渲染，将backing store中的bitmap数据显示在屏幕上。"
               },
             @{@"avatar_image_url":@"http://tva1.sinaimg.cn/crop.97.0.395.395.50/763d0907gw1eicpf6s9m3j20gi0b00wg.jpg",
               @"title":@"004123",
               @"content":@"每一个UIView都有一个layer，每一个layer都有个content，这个content指向的是一块缓存，叫做backing store。",
               @"detail_image_url":@"http://wx3.sinaimg.cn/bmiddle/470bf257ly1fwa19r96rzj20hs0dcabj.jpg"},
             @{@"avatar_image_url":@"http://tvax2.sinaimg.cn/crop.0.0.512.512.1024/ee14d0c0ly8fr9wg48vczj20e80e8jrp.jpg",
               @"title":@"cpu01",
               @"content":@"每一个UIView都有一个layer，每一个layer都有个content，这个content指向的是一块缓存，叫做backing store。",
               @"detail_image_url":@"http://wx3.sinaimg.cn/bmiddle/470bf257ly1fwa19r96rzj20hs0dcabj.jpg"}
             ,
             @{@"avatar_image_url":@"http://tvax3.sinaimg.cn/crop.0.0.1002.1002.50/791ffc07ly8fkxeajz01aj20ru0rvq3d.jpg",
               @"title":@"cpu02",
               @"content":@"UIView的绘制和渲染是两个过程，当UIView被绘制时，CPU执行drawRect，通过context将数据写入backing store"
               },
             @{@"avatar_image_url":@"http://tvax1.sinaimg.cn/crop.0.0.1098.1098.50/470bf257ly1fgjiyat1xfj20uk0ukaff.jpg",
               @"title":@"003-123text",
               @"content":@"当backing store写完后，通过render server交给GPU去渲染，将backing store中的bitmap数据显示在屏幕上。"
               },
             @{@"avatar_image_url":@"http://tva1.sinaimg.cn/crop.97.0.395.395.50/763d0907gw1eicpf6s9m3j20gi0b00wg.jpg",
               @"title":@"004123",
               @"content":@"每一个UIView都有一个layer，每一个layer都有个content，这个content指向的是一块缓存，叫做backing store。",
               @"detail_image_url":@"http://wx3.sinaimg.cn/bmiddle/470bf257ly1fwa19r96rzj20hs0dcabj.jpg"},
             @{@"avatar_image_url":@"http://tvax2.sinaimg.cn/crop.0.0.512.512.1024/ee14d0c0ly8fr9wg48vczj20e80e8jrp.jpg",
               @"title":@"cpu01",
               @"content":@"每一个UIView都有一个layer，每一个layer都有个content，这个content指向的是一块缓存，叫做backing store。",
               @"detail_image_url":@"http://wx3.sinaimg.cn/bmiddle/470bf257ly1fwa19r96rzj20hs0dcabj.jpg"}
             ,
             @{@"avatar_image_url":@"http://tvax3.sinaimg.cn/crop.0.0.1002.1002.50/791ffc07ly8fkxeajz01aj20ru0rvq3d.jpg",
               @"title":@"cpu02",
               @"content":@"UIView的绘制和渲染是两个过程，当UIView被绘制时，CPU执行drawRect，通过context将数据写入backing store"
               },
             @{@"avatar_image_url":@"http://tvax1.sinaimg.cn/crop.0.0.1098.1098.50/470bf257ly1fgjiyat1xfj20uk0ukaff.jpg",
               @"title":@"003-123text",
               @"content":@"当backing store写完后，通过render server交给GPU去渲染，将backing store中的bitmap数据显示在屏幕上。"
               },
             @{@"avatar_image_url":@"http://tva1.sinaimg.cn/crop.97.0.395.395.50/763d0907gw1eicpf6s9m3j20gi0b00wg.jpg",
               @"title":@"004123",
               @"content":@"每一个UIView都有一个layer，每一个layer都有个content，这个content指向的是一块缓存，叫做backing store。",
               @"detail_image_url":@"http://wx3.sinaimg.cn/bmiddle/470bf257ly1fwa19r96rzj20hs0dcabj.jpg"}
             ,
             @{@"avatar_image_url":@"http://tvax2.sinaimg.cn/crop.0.0.512.512.1024/ee14d0c0ly8fr9wg48vczj20e80e8jrp.jpg",
               @"title":@"cpu01",
               @"content":@"每一个UIView都有一个layer，每一个layer都有个content，这个content指向的是一块缓存，叫做backing store。",
               @"detail_image_url":@"http://wx3.sinaimg.cn/bmiddle/470bf257ly1fwa19r96rzj20hs0dcabj.jpg"}
             ,
             @{@"avatar_image_url":@"http://tvax3.sinaimg.cn/crop.0.0.1002.1002.50/791ffc07ly8fkxeajz01aj20ru0rvq3d.jpg",
               @"title":@"cpu02",
               @"content":@"UIView的绘制和渲染是两个过程，当UIView被绘制时，CPU执行drawRect，通过context将数据写入backing store"
               },
             @{@"avatar_image_url":@"http://tvax1.sinaimg.cn/crop.0.0.1098.1098.50/470bf257ly1fgjiyat1xfj20uk0ukaff.jpg",
               @"title":@"003-123text",
               @"content":@"当backing store写完后，通过render server交给GPU去渲染，将backing store中的bitmap数据显示在屏幕上。"
               },
             @{@"avatar_image_url":@"http://tva1.sinaimg.cn/crop.97.0.395.395.50/763d0907gw1eicpf6s9m3j20gi0b00wg.jpg",
               @"title":@"004123",
               @"content":@"每一个UIView都有一个layer，每一个layer都有个content，这个content指向的是一块缓存，叫做backing store。",
               @"detail_image_url":@"http://wx3.sinaimg.cn/bmiddle/470bf257ly1fwa19r96rzj20hs0dcabj.jpg"},
             @{@"avatar_image_url":@"http://tvax2.sinaimg.cn/crop.0.0.512.512.1024/ee14d0c0ly8fr9wg48vczj20e80e8jrp.jpg",
               @"title":@"cpu01",
               @"content":@"每一个UIView都有一个layer，每一个layer都有个content，这个content指向的是一块缓存，叫做backing store。",
               @"detail_image_url":@"http://wx3.sinaimg.cn/bmiddle/470bf257ly1fwa19r96rzj20hs0dcabj.jpg"}
             ,
             @{@"avatar_image_url":@"http://tvax3.sinaimg.cn/crop.0.0.1002.1002.50/791ffc07ly8fkxeajz01aj20ru0rvq3d.jpg",
               @"title":@"cpu02",
               @"content":@"UIView的绘制和渲染是两个过程，当UIView被绘制时，CPU执行drawRect，通过context将数据写入backing store"
               },
             @{@"avatar_image_url":@"http://tvax1.sinaimg.cn/crop.0.0.1098.1098.50/470bf257ly1fgjiyat1xfj20uk0ukaff.jpg",
               @"title":@"003-123text",
               @"content":@"当backing store写完后，通过render server交给GPU去渲染，将backing store中的bitmap数据显示在屏幕上。"
               },
             @{@"avatar_image_url":@"http://tva1.sinaimg.cn/crop.97.0.395.395.50/763d0907gw1eicpf6s9m3j20gi0b00wg.jpg",
               @"title":@"004123",
               @"content":@"每一个UIView都有一个layer，每一个layer都有个content，这个content指向的是一块缓存，叫做backing store。",
               @"detail_image_url":@"http://wx3.sinaimg.cn/bmiddle/470bf257ly1fwa19r96rzj20hs0dcabj.jpg"},
             @{@"avatar_image_url":@"http://tvax2.sinaimg.cn/crop.0.0.512.512.1024/ee14d0c0ly8fr9wg48vczj20e80e8jrp.jpg",
               @"title":@"cpu01",
               @"content":@"每一个UIView都有一个layer，每一个layer都有个content，这个content指向的是一块缓存，叫做backing store。",
               @"detail_image_url":@"http://wx3.sinaimg.cn/bmiddle/470bf257ly1fwa19r96rzj20hs0dcabj.jpg"}
             ,
             @{@"avatar_image_url":@"http://tvax3.sinaimg.cn/crop.0.0.1002.1002.50/791ffc07ly8fkxeajz01aj20ru0rvq3d.jpg",
               @"title":@"cpu02",
               @"content":@"UIView的绘制和渲染是两个过程，当UIView被绘制时，CPU执行drawRect，通过context将数据写入backing store"
               },
             @{@"avatar_image_url":@"http://tvax1.sinaimg.cn/crop.0.0.1098.1098.50/470bf257ly1fgjiyat1xfj20uk0ukaff.jpg",
               @"title":@"003-123text",
               @"content":@"当backing store写完后，通过render server交给GPU去渲染，将backing store中的bitmap数据显示在屏幕上。"
               },
             @{@"avatar_image_url":@"http://tva1.sinaimg.cn/crop.97.0.395.395.50/763d0907gw1eicpf6s9m3j20gi0b00wg.jpg",
               @"title":@"004123",
               @"content":@"每一个UIView都有一个layer，每一个layer都有个content，这个content指向的是一块缓存，叫做backing store。",
               @"detail_image_url":@"http://wx3.sinaimg.cn/bmiddle/470bf257ly1fwa19r96rzj20hs0dcabj.jpg"}
             ];
}
@end
