

在web开发中经常使用标签`div`来进行页面的布局，而在iOS开发中界面可视化元素基本都是`UIView`或是其子类元素构成，本文主要介绍如下内容： 
  
  + `UIView`和`CALayer`简介
  + `UIView`的生命周期和布局函数
  + 有了UIView为什么还要有CALayer 
  + UIWindow 简介
  + 视图的绘制过程
  + 视图的基本属性
  + 运行循环和重绘视图 
  + UI事件传递&响应 

#### `UIView`和`CALayer`简介 

`UIView`有两个主要功能：（1）负责渲染视图矩阵区域中的内容，但`UIView`真正绘图的部分是由`CALayer`类来管理的；设置`UIView`的一些行为属性，其实质是设置`CALayer`的相关属性。（2）视图通过层级关系管理子视图，响应该区域中发生的触碰事件；  
`CALayer`是`UIView`的一个属性，`CALayer`的contents用来显示内容（backing store --bitmap的位图），但`CALayer`不能响应事件，可以通过操作`CALayer`来设置视图的圆角、阴影、边框的颜色和宽度等。
<!--more-->  

#### `UIView`的生命周期和布局函数  
 
以下执行步骤是一个UIView从创建、设置属性、添加到父视图所执行的动作步骤：
  
+ 视图的创建可以通过xib或者手写代码的方式，xib创建视图调用的初始化方法为`-(instancetype)initWithCoder:(NSCoder *)aDecoder`,手写代码创建视图调用的初始化方法为`- (instancetype)initWithFrame:(CGRect)frame` ;如果需要对视图进行额外的设置可以在初始化方法中进行设置；   
+ 当我们创建了一个视图对象，需要对其属性进行设置时，会调用`-(void)setNeedsDisplay`对该视图打标记，设置一次属性就会触发一次`-(void)setNeedsDisplay`；
+ 当把视图添加到父视图上时会触发`-(void)layoutSubviews`,此函数可以重新定义子元素的位置和大小；`layoutSubviews`函数还会在frame发生变化、addsubView等动作下被触发；
+ 如果重写了视图的`- (void)drawRect:(CGRect)rect`，那么此函数将会被调用  

如果有需求直接触发`layoutSubviews` 可以调用`-(void)layoutIfNeeded`来触发；而直接显式的调用`-(void)setNeedsDisplay`会触发`- (void)drawRect:(CGRect)rect`；使用`setNeedsLayout`标记的视图在当前runloop快结束的时候会调用`layoutSubviews`

 

#### 有了UIView为什么还要有CALayer  

 - `UIView`作为`CALayer `的一个管理类
 - 遵循单一职责原则
 - iOS和MacOS的统一，两者共用core animation的API

#### UIWindow 简介 
- 什么是UIWindow  
> The UIWindow class defines an object known as a window that manages and coordinates the views an app displays on a device screen. Unless an app can display content on an external device screen, an app has only one window.  
UIWindow类定义了一个window对象来管理和协调显示在屏幕上的视图，除非一个app可以显示在额外的屏幕上，否则一个app只有一个window对象 任何一个应用有且只有一个UIWindow对象，它就像一个容器包含应用中的所有视图；应用需要在启动时创建并设置UIWindow；   

- 如何设置UIWindow  
   
```  
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // UIWindow 的设置
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window setBackgroundColor:[UIColor whiteColor]];
    [self.window setRootViewController:[[UIViewController alloc] init]];
    [self.window makeKeyAndVisible];
    return YES;
}   
```    
- 什么是keyWindow  
> 用来接收键盘以及非触摸类的消息事件的UIWindow，而且程序中每个时刻只能有一个UIWindow是keyWindow。  
- 设置UIWindowLevel   
 通过将UIWindow的UIWindowLevel设置的更高，可以将UIWindow盖在所有的应用界面之上；这个在做遮罩的时候可以选择做一个自定义的UIWindow显示在界面上；  

#### 视图的绘制过程  
 
 `UIView`从Draw到Render主要包含过程如下:
   
 
+  `UIView`包含一个`CALayer`属性，`CALayer`中包含一个`content`指针指向缓存块*backing store*
+  `UIView`的绘制和渲染是两个过程；一个视图由CPU进行Frame布局，首先准备视图和图层的层级关系，然后查询视图是否有重写`drawRect：`或者`drawLayer:inContext:`方法，如果有CPU会执行drawRect，然后CPU会将处理视图和图层层级关系打包，通过context将数据写入backing store
+  backing store写完后，通知render server将图层数据交给OpenGL ES 进行纹理生成和着色，生成前后帧缓存，再根据硬件的刷新频率，一般以设备的Vsync信号和CADisplayLink为标准，进行前后帧的切换。
+  最后将要显示在画面上的后帧缓存交给GPU去渲染，进行采集图片和形状，运行变换，应用纹理的混合，最终将bitMap数据显示在屏幕上
+  CPU绘制后把内容放入到缓存里，GPU负责从缓存里读取数据然后渲染到屏幕上。

GPU的操作涉及多个View的拼接（Compositing），纹理（Texture）的渲染等最后显示到屏幕上。GPU将纹理渲染到屏幕主要涉及到一下几个问题：  

+ 合成（Compositing）: 将多个纹理拼到一起的过程，对应UIKIT，是指处理多个View合到一起的情况，如果View没有叠加GPU只需要做普通的渲染即可，如果多个View之间有叠加部分，GPU需要做混合操作
+ 尺寸(Size) ：主要是image 大图直接填充到小尺寸的imageView中，不做处理，那么GPU就需要额外的操作，计算量会飙升
+ 渲染分为当前屏幕渲染和离屏渲染   
  - On-Screen Rendering即GPU的渲染操作是在当前屏幕缓冲区进行的
  - Off-Screen Rendering即离屏渲染，指的是GPU的渲染是在当前屏幕缓冲区以外进行渲染操作，涉及上下文的切换，造成性能损失

为什么需要离屏渲染？
图形属性的混合体（圆角、阴影、遮罩）被指定为在未预合成之前不能再屏幕上绘制，即当主屏的还会被绘制好的时候，就需要在屏幕外渲染

#### 视图的基本属性  
 
##### frame和bounds 属性  

- frame:保存视图的大小和相对父视图的位置；
- bounds：用于确定绘制区域，避免绘制到图层之外 ，修改bounds的origin会影响它子视图的布局 

##### UIView 缩放、旋转、位移  
通过设置`UIView`的transform属性可以对视图进行缩放、旋转、位移操作，其实质是操作CGAffineTransform仿射转换结构体【代表一种仿射变换矩阵】  

     func testTransform() -> Void {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        view.center = self.view.center
        view.backgroundColor = UIColor.orange
        self.view.addSubview(view)
        
        // 首先拿到视图的transform属性
        let transform = view.transform
        // view.transform = transform.translatedBy(x: 0, y: 100) 向下平移100
        //view.transform = transform.scaledBy(x: 1.5, y: 1.5) 缩放视图
        view.transform = transform.rotated(by: 3.14/4)  // 视图的旋转
        // self.view.transform = CGAffineTransform(rotationAngle: <#T##CGFloat#>)
    }

##### 像素和点 

在retina显示屏上，一个点相当于两个像素高和两个像素宽，非retina一个点相当于一个像素宽和一像素高；

##### 在drawRect:方法中自定义绘图  
 
视图根据drawRect:方法将自己绘制到视图上，UIView的子类可以覆盖drawRect:完成自定义的绘图任务；

#### 运行循环和重绘视图  

##### runloop  
> iOS应用启动时就会开始一个运行循环（runloop），runloop的工作就是监听事件，例如触摸；runloop会为相应的事件找到合适的处理方法，只有当这些处理方法都执行完毕后控制权才返回给runloop；  

##### 重绘  

+ 详细：core animation 在Runloop中注册了一个Observer，负责监听BeforeWating和Exit事件。这个Observer优先级为200000，低于常见的Observer；当触摸事件到来时，Runloop会被唤醒，App中的一些代码会执行一些操作，比如创建和调整视图的层级、设置UIView的Frame，修改透明度，为视图添加动画，这些都会被CALayer所捕获，并通过CATransaction提交一个中间状态。当上述操作结束，Runloop即将进入休眠，负责监听的Observer会得到通知，注册的回调函数会被执行，把所有的中间状态合并提交GPU去显示，

+ 大概：当业务处理方法执行完毕后，将控制权交还给runloop时，runloop首先会检查是否有等待重绘的视图（即当前循环收到过setNeedsDisplay消息的视图）；然后向等待绘制的视图发送drawRect:消息；最后所有视图组合成一个图像显示到屏幕中  
##### 为了界面的流畅iOS做了两方面的优化  
- 不重绘显示内容没有改变的视图；
- 在每次事件处理周期中只发送一次drawRect:消息；iOS会在运行循环的最后阶段集中处理需要绘制的视图，尤其是对属性发生多次改变的视图； 

####  UI事件传递&响应    

#### 响应者链（Responder Chain）的产生   
由于视图继承自UIResponder，因此他有一个nextResponder属性，结合视图的层次结构这样一个响应者链就产生了；子视图的nextResponder指向的是父视图；事件在传递的过程中根据nextResponder指针完成树状图的遍历直到有视图处理此次事件，否则就放弃事件的响应；  

#### 查找响应者 （Responder Object）  
屏幕中点击了一个按钮，事件由UIApplication从runloop的事件队列中取出通过[UIApplication sendEvent:]传递给UIWindow；此时会触发Hit-Testing View也就是触发UIWindow中的`- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event;`和`- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event;`方法；那么Hit-Testing View的过程是什么呢？

##### Hit-Testing View的过程   
Hit-Testing View实际是递归的使用`- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event;`和`- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event;`方法来找到*触摸点*所在的最上层视图然后返回；如下图所示： 

<center>
![图片来自网络](http://zhoon.github.io/img/artical/ios_event/iosevent_4.png) 
</center>  
 
Hit-Testing View 的执行流程图   

<center>
![图片来自网络](http://zhoon.github.io/img/artical/ios_event/iosevent_5.png) 
</center> 


当一个触摸事件产生后，事件传递链由UIApplication -> UIWindow -> UIView -> subViews -> lastView[hitTest-view];然后判断当前视图是否有处理事件的方法，如果没有则根据nextResponder指针将事件向上传递给父视图，如果一直没有找到则丢弃；


****  
> 内容来自iOS高级编程（第4版）视图与层次结构
> [理解UIView的绘制](https://www.cnblogs.com/feng9exe/p/8848663.html)
  
   

