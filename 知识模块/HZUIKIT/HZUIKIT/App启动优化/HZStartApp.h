//
//  HZStartApp.h
//  HZUIKIT
//
//  Created by KB on 2018/8/6.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HZStartApp : NSObject

/*
 
 App启动 ==> Load所有的可执行文件（*.o）==> 加载dyld（动态连接器）
 |
 |
 v
 加载app用到的所有动态链接库
 
 
 动态链接库 = {
 libObjc ： runtime
 libSystem
 libDispatch : GCD
 libSystem_block : block
 }
 
 Objc setUp(静态调整) = {
 
 1： 注册Objc类
 2： 将catagory的定义插入方法列表中
 3： 保证每一个selector唯一
 }
 
 (1) 减少 +(void)load的使用，或者将不必须的逻辑移到+initialize中
 app在加载完可执行文件后，经历过Objc setUp会依次调用+(void)load函数，如果有耗时操作则会增加app的启动时间；
 （2）清除一些不使用的动态链接库
 （3）移除不使用的类文件、方法、三方库
 
 */


/*
                                                加载info.plist
                                                       |④
                                             ①，       |                  ③
                   App----执行-> main() ---call--> UIApplicationMain()--------> AppDelegate
                                                        |②
                                    ⑤，create&manage    | create
                            Runloop <--------------- UIApplication
                                                         |
                                                         |
                                                         V
                                           didFinishLaunchingWithOptions
                                                         |
                                                         |
                                                         V
                                        create  window&rootViewController
 
         可以优化的地方分为两部分={
                     didFinishLaunchingWithOptions = {
                         初始化三方SDK，
                         IO操作，
                         加载（本地、远程）资源，
 
                       // 具体 【头条做法】
                       （1）  纯代码方式而不是storyboard加载首页UI。
                       （2） 对didFinishLaunching里的函数考虑能否挖掘可以延迟加载或者懒加载，需要与各个业务方pm和rd共同check 对于一些已经下线的业务，删减冗余代码。
                       （3） 对于一些与UI展示无关的业务，如微博认证过期检查、图片最大缓存空间设置等做延迟加载
                     }，
                     rootViewController = {
                          类似didFinishLaunchingWithOptions查询耗时操作
                     }
         }
 */
@end
