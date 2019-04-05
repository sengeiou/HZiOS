title: iOS核心动画阅读笔记(一)
date: 2015-01-03  09:30  
categories: iOS 
tags: [iOS基础]
---
---
[*参考文章*](https://www.gitbook.com/book/zsisme/ios-/details)
 
## 视图（UIView）
   * 界面元素显示的基础;  
   * 可管理子视图；  
   * 能够接受输入、触摸、绘图和放射变换(缩放，位移)等一系列的操作行为;
<!--more-->
## 图层 (CALayer)
   * 用来显示视图的内容；
   * 视图圆角、阴影、边框等效果的实现完全基于图层；  
   * 图层还负责管理显示内容的几何信息（位置、大小和变换）;
   * 执行自定义的动画；  
> UIView本身更像是一个CALayer的管理器； UIView是CALayer的一个delegate(weibo上的一句解释，感觉还好)  
  
###  有了UIView为什么还要CALayer！？ 

 - 这样做是为了职责的分离，避免代码重复；
 - 实际上这些背后关联的图层才是真正用来在屏幕上显示和做动画，UIView仅仅是对它的一个封装,提供了一些iOS类似于处理触摸的具体功能，以及Core Animation底层方法的高级接口。
           
## 寄宿图  
  
### contents属性  
> CALayer的一个属性，它真正要赋值的类型应该是CGImageRef ,可以给这个属性赋予一个CGImage就能让一个普通的UIView显示图像；   
 `self.layerView.layer.contents = (__bridge id _Nullable)(contentImage.CGImage);`   
  
### contentGravity属性  
> contentsGravity与UIView的contentMode类似，但是它是一个NSString类型 ；
 `self.layerView.layer.contentsGravity = kCAGravityResizeAspect;`
  
### maskToBounds属性  
> UIView有一个叫做clipsToBounds的属性可以用来决定是否显示超出边界的内容，CALayer对应的属性叫做masksToBounds  
  
### iOS设备屏幕  
> 在标准设备上，一个点就是一个像素，但是在Retina设备上，一个点等于2*2个像素。iOS用点作为屏幕的坐标测算体系就是为了在Retina设备和普通设备上能有一致的视觉效果  
  
### contentsRect属性  
> CALayer的contentsRect属性允许我们在图层边框里显示寄宿图的一个子域，默认的contentsRect是{0, 0, 1, 1}  
  
### 图片的拼接  
> 图片拼合后可以打包整合到一张大图上一次性载入。相比多次载入不同的图片，这样做能够带来很多方面的好处：内存使用，载入时间，渲染性能等等
  
## 图层几何学  
### 属性简介  
> UIView有三个比较重要的布局属性：frame，bounds和center，CALayer对应地叫做frame，bounds和position。为了能清楚区分，图层用了“position”，视图用了“center”，但是他们都代表同样的值
   
### 锚点  
> 通过position、anchorPoint和视图的宽高可以定位视图的位置

    - (void)setPosition:(CGPoint)point atAnchorPoint:(CGPoint)anchorPoint  {  
     CGFloat x = point.x - anchorPoint.x * self.width;  
     CGFloat y = point.y - anchorPoint.y * self.height;  
     [self setOrigin:CGPointMake(x, y)];  
     }
 
 
### 坐标系  
 - 将自身坐标从一个图层转到另一个图层上
 
       - (CGPoint)convertPoint:(CGPoint)point fromLayer:(CALayer *)layer;
       - (CGPoint)convertPoint:(CGPoint)point toLayer:(CALayer *)layer;
       - (CGRect)convertRect:(CGRect)rect fromLayer:(CALayer *)layer;
       - (CGRect)convertRect:(CGRect)rect toLayer:(CALayer *)layer;
  
 - Z坐标轴  
   + CALayer的属性：zPosition属性在大多数情况下其实并不常用。除了做变换之外，zPosition最实用的功能就是改变图层的显示顺序`self.greenView.layer.zPosition = 1.0f;`//这样能把图层提
   + CALayer的两个方法  
  (1) containsPoint:判断触摸点point是否在某个图层上，返回bool类型 (2)hitTest: 判断触摸点point是否在某个图层上，返回的是图层   
 
## 视觉效果
### 圆角的设置  
> CALayer有一个叫做conrnerRadius的属性控制着图层角的曲率，是一个浮点类型，把masksToBounds设置成YES的话，才能实现效果  
 `self.layerView.layer.cornerRadius = 1.0f;`
 `self.layerView.clipsToBounds = YES;`   
  
### 图层边框  
> CALayer另外两个非常有用属性就是borderWidth和borderColor。二者共同定义了图层边的绘制样式。
> 边框是绘制在图层边界里面的，而且在所有子内容之前，也在子图层之前.    
 `self.layerView.layer.borderWidth = 2.0f;`
 `self.layerView.layer.borderColor = [UIColor blackColor].CGColor; ` 

### 阴影
   - 给shadowOpacity属性一个大于默认值（也就是0）的值，阴影就可以显示在任意图层之下  
   - shadowOpacity是一个必须在0.0（不可见）和1.0（完全不透明）之间的浮点数	   layer.shadowOpacity   = 1.0f;//设置阴影显示
       layer.shadowRadius    = 8.0f;//值越大阴影越模糊
       layer.shadowOffset    = CGSizeMake(0, 3);//设置阴影显示方向，h值为正则阴影向下，反之向上   

   - 阴影剪裁
       + 阴影通常就是在Layer的边界之外，如果你开启了masksToBounds属性，所有从图层中突出来的内容都会被才剪掉
       + 这个可以使用两个图层来解决
   - shadowPath属性
       + shadowPath是一个CGPathRef类型（一个指向CGPath的指针）。CGPath是一个Core Graphics对象，用来指定任意的一个矢量图形
       	
             self.layerView.layer.shadowOpacity   = 0.5f;//设置阴影显示
             CGMutablePathRef squarePath = CGPathCreateMutable();
             CGPathAddRect(squarePath, NULL, self.layerView.bounds);
             self.layerView.layer.shadowPath = squarePath;
             self.layerView.layer.shadowOffset = CGSizeMake(0, 3);
             CGPathRelease(squarePath);

   - 图层蒙版  
    > 图层+图层蒙版 = 图层蒙版在图层上的轮廓
    
              CALayer *maskLayer = [CALayer layer];
              maskLayer.frame = self.layerView.bounds;
              UIImage *maskImage = [UIImage imageNamed:@"Cone.png"];
              maskLayer.contents = (__bridge id)maskImage.CGImage;
              self.imageView.layer.mask = maskLayer;
    
 
   - 图片拉伸
    > minification（缩小图片）和magnification（放大图片）默认的过滤器都是kCAFilterLinear，这个过滤器采用双线性滤波算法，它在大多数情况下都表现良好。双线性滤波算法通过对多个像素取样最终生成新的值，得到一个平滑的表现不错的拉伸。但是当放大倍数比较大的时候图片就模糊不清了。
   - 组透明度
    > 一个控件有子控件的情况下设置透明度会导致，透明度的混合增加
    
        - (UIButton *)customButton
         {
             //create button
             CGRect frame = CGRectMake(0, 0, 150, 50);
             UIButton *button = [[UIButton alloc] initWithFrame:frame];
             button.backgroundColor = [UIColor whiteColor];
             button.layer.cornerRadius = 10;
             //add label
             frame = CGRectMake(20, 10, 110, 30);
             UILabel *label = [[UILabel alloc] initWithFrame:frame];
             label.text = @"Hello World";
             label.textAlignment = NSTextAlignmentCenter;
             [button addSubview:label];
             return button;
         }      
         - (void)viewDidLoad
         {
             [super viewDidLoad];
             //create opaque button
             UIButton *button1 = [self customButton];
             button1.center = CGPointMake(50, 150);
             [self.containerView addSubview:button1];
             //create translucent button
             UIButton *button2 = [self customButton];
             button2.center = CGPointMake(250, 150);
             button2.alpha = 0.5;
             [self.containerView addSubview:button2];
             //设置下面两个属性就会解决透明度叠加的问题
             button2.layer.shouldRasterize = YES;
             button2.layer.rasterizationScale = [UIScreen mainScreen].scale;
         }  

    
## 变换  
### 仿射变换  
  
> UIView可以通过设置transform属性做变换，transform是一CGAffineTransform类型，CGAffineTransform是一个可以和二维空间向量（例如CGPoint）做乘法的3X2的矩阵    

![屏幕快照](http://upload-images.jianshu.io/upload_images/117735-19dec990cbeec1f5.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

> 我们使用的旋转常量是M_PI_4，而不是你想象的45，因为iOS的变换函数使用弧度而不是角度作为单位。弧度用数学常量pi的倍数表示，一个pi代表180度，所以四分之一的pi就是45度 
 `CGAffineTransform transform = CGAffineTransformMakeRotation(M_PI_4);`
 `self.layerView.layer.affineTransform = transform;`
 
### 混合变换
> Core Graphics提供了一系列的函数可以在一个变换的基础上做更深层次的变换，如果做一个既要缩放又要旋转的变换

    -(void)viewDidLoad
			             {
			                 [super viewDidLoad]; //create a new transform
			                 CGAffineTransform transform = CGAffineTransformIdentity; //scale by 50%
			                 transform = CGAffineTransformScale(transform, 0.5, 0.5); //rotate by 30 degrees
			                 transform = CGAffineTransformRotate(transform, M_PI / 180.0 * 30.0); //translate by 200 points
			                 transform = CGAffineTransformTranslate(transform, 200, 0);
			                 //apply transform to layer
			                 self.layerView.layer.affineTransform = transform;
		             }     
    
### 3D转换   
> 提到了zPosition属性，可以用来让图层靠近或者远离相机（用户视角），transform属性（CATransform3D类型）可以真正做到这点，即让图层在3D空间内移动或者旋转。和CGAffineTransform类似，CATransform3D也是一个矩阵，但是和2x3的矩阵不同，CATransform3D是一个可以在3维空间内做变换的4x4的矩阵

![屏幕快照](http://upload-images.jianshu.io/upload_images/117735-588ebfe4fb93f698.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)  

       -(void)viewDidLoad
		         {
		             [super viewDidLoad];
		             //效果：看起来图层并没有被旋转，而是仅仅在水平方向上的一个压缩
		             CATransform3D transform = CATransform3DMakeRotation(M_PI_4, 0, 1, 0);
		             self.layerView.layer.transform = transform;
	         }    
 
### 透视投影  

> CATransform3D的透视效果通过一个矩阵中一个很简单的元素来控制：m34；
> 34的默认值是0，我们可以通过设置m34为-1.0 / d来应用透视效果，d代表了想象中视角相机和屏幕之间的距离，以像素为单位，那应该如何计算这个距离呢？实际上并不需要，大概估算一个就好了

     - (void)viewDidLoad
         {
             [super viewDidLoad];
             //create a new transform
             CATransform3D transform = CATransform3DIdentity;
             //apply perspective
             transform.m34 = - 1.0 / 500.0;// 500-1000均可
             //rotate by 45 degrees along the Y axis
             transform = CATransform3DRotate(transform, M_PI_4, 0, 1, 0);
             //apply to layer
             self.layerView.layer.transform = transform;
         }   
 
### sublayerTransform属性 

> CALayer有一个属性叫做sublayerTransform。它也是CATransform3D类型，但和对一个图层的变换不同，它影响到所有的子图层。这意味着你可以一次性对包含这些图层的容器做变换，于是所有的子图层都自动继承了这个变换方法

             - (void)viewDidLoad
         {
             [super viewDidLoad];
             //apply perspective transform to container
             CATransform3D perspective = CATransform3DIdentity;
             perspective.m34 = - 1.0 / 500.0;
             self.containerView.layer.sublayerTransform = perspective;
             //rotate layerView1 by 45 degrees along the Y axis
             CATransform3D transform1 = CATransform3DMakeRotation(M_PI_4, 0, 1, 0);
             self.layerView1.layer.transform = transform1;
             //rotate layerView2 by 45 degrees along the Y axis
             CATransform3D transform2 = CATransform3DMakeRotation(-M_PI_4, 0, 1, 0);
             self.layerView2.layer.transform = transform2;
             //containerView 是layerView1、layerView2的父视图
         } 

### 扁平化图层
> 如果对包含已经做过变换的图层的图层做反方向的变换将会发什么什么呢？  
         
   - 2D：转化会抵消  
   - 3D：由于不在一个空间内部，所以不能复原