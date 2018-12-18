[今日头条iOS客户端启动速度优化](https://techblog.toutiao.com/2017/01/17/iosspeed/)  

[贝聊APP启动优化](http://www.cocoachina.com/ios/20170816/20267.html)

app从点击icon到展示具体的页面可以分为两个部分：main()函数调用前、main()函数执行到第一个视图控制去完全展示,所以app的启动优化可以从这两个方面来做调整；  

## main()函数调用前系统都做了哪些操作     

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

## main()函数的执行做了哪些操作  

    
                                                加载info.plist
                                                       |④
                                             ①，       |                  ③
              App----执行-> main() ---call--> UIApplicationMain()------AppDelegate
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
                     
                     // 贝聊的优化  
                     	（1）	日志、统计等必须在 APP 一起动就最先配置的事件
                     	   属于必须一启动就加载的
	                     (2)	项目配置、环境配置、用户信息的初始化 、推送、IM等事件
	                        选择合适的时机加载，【如展示广告页】
	                     (3)  其他 SDK 和配置事件
	                       在第一个控制器执行viewDidAppear中加载
	                    （4）展示的第一个视图控制器优化
	                      可以先展示空壳UI，然后在viewDidAppear中进行数据请求和数据解析，然       后再做UI更新操作
         }
 
   
   
### 启动具体优化   

+ 首次安装解压zip资源包放在异步线程中；
+ 基于session的网络传输替换，避免同步请求；使用token机制
+ launchScreen使用的图片用tinyPNG进行压缩处理
+ 将不必要的网络请求延后处理；


