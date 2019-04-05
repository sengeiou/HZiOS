title: iOS核心动画阅读笔记二)
date: 2015-01-04  09:30  
categories: iOS 
tags: [iOS基础]
---
[参考文章](https://zsisme.gitbooks.io/ios-/content/chapter6/specialized-layers.html)  
## CAShapeLayer  
  
> `CAShapeLayer`继承自`CALayer`,能够设置**lineWidth、lineJoin、lineCap、fillColor、strokeColor**等属性，通过赋值属性**path**绘制图形。
<!--more-->   
### *1 和使用`Core Gaphics`相比的优点*  
  
  - 渲染快速，`CAShapeLayer`使用了硬件加速  
  - 高效使用内存
  - 不会被clipToBounds属性影响
  - 不会出现像素化  
    
### *2 创建一个CGPath*

    -(void)drawWithCAShapeLayer{
	    //create path
	    UIBezierPath *path=({
	        UIBezierPath *path = [[UIBezierPath alloc] init];
	        [path moveToPoint:CGPointMake(175, 100)];
	        [path addArcWithCenter:CGPointMake(150, 100) radius:25 startAngle:0 endAngle:2*M_PI clockwise:YES];
	        [path moveToPoint:CGPointMake(150, 125)];
	        [path addLineToPoint:CGPointMake(150, 175)];
	        [path addLineToPoint:CGPointMake(125, 225)];
	        [path moveToPoint:CGPointMake(150, 175)];
	        [path addLineToPoint:CGPointMake(175, 225)];
	        [path moveToPoint:CGPointMake(100, 150)];
	        [path addLineToPoint:CGPointMake(200, 150)];
	        path;
	    });
	    CAShapeLayer *shapeLayer = ({
	        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
	        shapeLayer.strokeColor = [UIColor redColor].CGColor;
	        shapeLayer.fillColor = [UIColor clearColor].CGColor;
	        shapeLayer.lineWidth = 5;
	        shapeLayer.lineJoin = kCALineJoinRound;
	        shapeLayer.lineCap = kCALineCapRound;
	        shapeLayer.path = path.CGPath;
	        shapeLayer;
	    });
	    [self.containerView.layer addSublayer:shapeLayer];
}
 
    
### *3 圆角*  

      -(void)drawCricle:(CAShapeLayer*)shapeLayer onView:(UIView*)view{
    //使用CALayer只能创建四角的圆角，而CAShapeLayer可以单独创建指定圆角
    CGRect rect = CGRectMake(50, 50, 100, 100);
    CGSize radii = CGSizeMake(20, 20);
    UIRectCorner corners = UIRectCornerTopRight | UIRectCornerBottomRight | UIRectCornerBottomLeft;
				//create path
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:radii];
    shapeLayer.path = path.CGPath;
    [view.layer addSublayer:shapeLayer];} 
  
## CATextLayer  
  
> Core Animation提供了一个CALayer的子类CATextLayer，它以图层的形式包含了UILabel几乎所有的绘制特性,尤其在显示较多的文字的时候，比UILable渲染的更快。  
  
### *1 使用CATextLayer制作一个纯文本标签*  

     -(void)drawTextWithCATextLayerInView:(UIView*)view{
    CATextLayer* textLayer =({
        // create a text textLayer
        CATextLayer* textLayer = [CATextLayer layer];
        textLayer.frame = view.bounds;
        // set text attribute
        textLayer.foregroundColor = [UIColor blackColor].CGColor;
        textLayer.alignmentMode = kCAAlignmentJustified;
        textLayer.wrapped = YES;
        // set layer font
        UIFont* font = [UIFont systemFontOfSize:15.0f];
        CFStringRef fontRef = (__bridge CFStringRef)(font.fontName);
        textLayer.font = fontRef;
        textLayer.fontSize = font.pointSize;
        textLayer.contentsScale = [UIScreen mainScreen].scale;
        //
        NSString* text = @"Lorem ipsum dolor sit amet, consectetur adipiscing \ elit. Quisque massa arcu, eleifend vel varius in, facilisis pulvinar \ leo. Nunc quis nunc at mauris pharetra condimentum ut ac neque. Nunc elementum, libero ut porttitor dictum, diam odio congue lacus, vel \ fringilla sapien diam at purus. Etiam suscipit pretium nunc sit amet \\ lobortis";
        textLayer.string = text;
        textLayer;
    });
    [view.layer addSublayer:textLayer];
} 
    
   
### *2 UILable的替代品*  
  
> 由于CALayer不支持自动缩放和自动布局，子视图并不是主动跟踪视图边界的大小，所以每次视图大小被更改，我们不得不手动更新子图层的边界,所以可以继承UILabel，来实现更多功能

     #import "LayerLabel.h"
			@implementation LayerLabel
			+(Class)layerClass{
			    //UIView会在初始化的时候调用+layerClass方法，然后用它的返回类型来创建宿主图层
			    return [CATextLayer class];
			}
			-(CATextLayer*)textLayer{
			    return (CATextLayer*)self.layer;
			}
			-(void)setUp{
			    self.text = self.text;
			    self.textColor = self.textColor;
			    self.font = self.font;
			    [self textLayer].alignmentMode = kCAAlignmentJustified;;
			    [self textLayer].wrapped = YES;
			    [self.layer display];
			}
			-(instancetype)initWithFrame:(CGRect)frame{
			    if (self=[super initWithFrame:frame]) {
			        [self setUp];
			    }
			    return  self;
			}
			-(void)awakeFromNib{
			    [self setUp];
			}
			-(void)setText:(NSString *)text{
			    super.text = text;
			    [self textLayer].string = text;
			}
			-(void)setTextColor:(UIColor *)textColor{
			    super.textColor = textColor;
			    [self textLayer].foregroundColor = textColor.CGColor;
			}
			-(void)setFont:(UIFont *)font{
			    super.font = font;
			    CFStringRef fontName = (__bridge CFStringRef)(font.fontName);
			    CGFontRef fontRef = CGFontCreateWithFontName(fontName);
			    [self textLayer].font = fontRef;
			    [self textLayer].fontSize = font.pointSize;
			}
			@end    
  
   
### * 用CATransformLayer装配一个3D图层体系*  
  
> CATransformLayer不同于普通的CALayer，因为它不能显示它自己的内容。只有当存在了一个能作用域子图层的变换它才真正存在。CATransformLayer并不平面化它的子图层，所以它能够用于构造一个层级的3D结构

    -(void)draw3DCubeWithContainerView:(UIView*)containerView{
    CATransform3D pt = CATransform3DIdentity;
    pt.m34 = -1.0 / 500.0;
    containerView.layer.sublayerTransform = pt;
    //set up the transform for cube 1 and add it
    CATransform3D c1t = CATransform3DIdentity;
    c1t = CATransform3DTranslate(c1t, -100, 0, 0);
    CALayer *cube1 = [self cubeWithTransform:c1t];
    [containerView.layer addSublayer:cube1];
    //set up the transform for cube 2 and add it
    CATransform3D c2t = CATransform3DIdentity;
    c2t = CATransform3DTranslate(c2t, 100, 0, 0);
    c2t = CATransform3DRotate(c2t, -M_PI_4, 1, 0, 0);
    c2t = CATransform3DRotate(c2t, -M_PI_4, 0, 1, 0);
    CALayer *cube2 = [self cubeWithTransform:c2t];
    [containerView.layer addSublayer:cube2];}  
    
     // 创建一个cube
     - (CALayer *)cubeWithTransform:(CATransform3D)transform
    {
    //create cube layer
    CATransformLayer *cube = [CATransformLayer layer];
    //add cube face 1
    CATransform3D ct = CATransform3DMakeTranslation(0, 0, 50);
    [cube addSublayer:[self faceWithTransform:ct]];
    //add cube face 2
    ct = CATransform3DMakeTranslation(50, 0, 0);
    ct = CATransform3DRotate(ct, M_PI_2, 0, 1, 0);
    [cube addSublayer:[self faceWithTransform:ct]];
    //add cube face 3
    ct = CATransform3DMakeTranslation(0, -50, 0);
    ct = CATransform3DRotate(ct, M_PI_2, 1, 0, 0);
    [cube addSublayer:[self faceWithTransform:ct]];
    //add cube face 4
    ct = CATransform3DMakeTranslation(0, 50, 0);
    ct = CATransform3DRotate(ct, -M_PI_2, 1, 0, 0);
    [cube addSublayer:[self faceWithTransform:ct]];
    //add cube face 5
    ct = CATransform3DMakeTranslation(-50, 0, 0);
    ct = CATransform3DRotate(ct, -M_PI_2, 0, 1, 0);
    [cube addSublayer:[self faceWithTransform:ct]];
    //add cube face 6
    ct = CATransform3DMakeTranslation(0, 0, -50);
    ct = CATransform3DRotate(ct, M_PI, 0, 1, 0);
    [cube addSublayer:[self faceWithTransform:ct]];
    //center the cube layer within the container
    CGSize containerSize = self.containerView.bounds.size;
    cube.position = CGPointMake(containerSize.width / 2.0, containerSize.height / 2.0);
    //apply the transform and return
    cube.transform = transform;
    return cube；}  
    // 创建一个cube的面
    - (CALayer *)faceWithTransform:(CATransform3D)transform
    {
    //create cube face layer
    CALayer *face = [CALayer layer];
    face.frame = CGRectMake(-40, -40, 100, 100);
    //apply a random color
    CGFloat red = (rand() / (double)INT_MAX);
    CGFloat green = (rand() / (double)INT_MAX);
    CGFloat blue = (rand() / (double)INT_MAX);
    face.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0].CGColor;
    face.transform = transform;
    return face;}  
  
## CAGradientLayer  
  
> CAGradientLayer是用来生成两种或更多颜色平滑渐变的。 
  
### *1 基础渐变* 
       // 由红变绿（左上角-》右下角）
     -(void)gradientColorWithView:(UIView*)view{
    CAGradientLayer *gradientLayer =({
        CAGradientLayer *gradientLayer = [CAGradientLayer layer];
        gradientLayer.frame = view.bounds;
        //set gradient colors
        gradientLayer.colors = @[(__bridge id)[UIColor redColor].CGColor, (__bridge id)[UIColor blueColor].CGColor];
        //set gradient start and end points
        gradientLayer.startPoint = CGPointMake(0, 0);
        gradientLayer.endPoint = CGPointMake(1, 1);
        gradientLayer;
    });
    [view.layer addSublayer:gradientLayer];} 
  
### *2 多重渐变*
  
> colors属性可以包含很多颜色，所以创建一个彩虹一样的多重渐变也是很简单的。默认情况下，这些颜色在空间上均匀地被渲染，但是我们可以用locations属性来调整空间。locations属性是一个浮点数值的数组（以NSNumber包装）。这些浮点数定义了colors属性中每个不同颜色的位置，同样的，也是以单位坐标系进行标定。0.0代表着渐变的开始，1.0代表着结束  

       -(void)gradientColorWithView:(UIView*)view{
    CAGradientLayer *gradientLayer =({
        CAGradientLayer *gradientLayer = [CAGradientLayer layer];
        gradientLayer.frame = view.bounds;
        //set gradient colors
        gradientLayer.colors = @[(__bridge id)[UIColor redColor].CGColor, (__bridge id)[UIColor blueColor].CGColor,(__bridge id)[UIColor yellowColor].CGColor];
        //set gradient start and end points
        gradientLayer.startPoint = CGPointMake(0, 0);
        gradientLayer.endPoint = CGPointMake(1, 1);
        gradientLayer.locations = @[@0.0,@0.25,@0.5];
        gradientLayer;
    });
    [view.layer addSublayer:gradientLayer];} 
  
## CAReplicatorLayer  
> CAReplicatorLayer的目的是为了高效生成许多相似的图层  
  
### *1 重复图层*
    -(void)repeatLayer:(UIView*)View{
    CAReplicatorLayer *replicator =({
        CAReplicatorLayer *replicator = [CAReplicatorLayer layer];
        replicator.frame = View.bounds;
        //重复次数
        replicator.instanceCount = 10;
        //transform for each instance
        CATransform3D transform = CATransform3DIdentity;
        transform = CATransform3DTranslate(transform, 0, 100, 0);
        transform = CATransform3DRotate(transform, M_PI / 5.0, 0, 0, 1);
        transform = CATransform3DTranslate(transform, 0, -100, 0);
        replicator.instanceTransform = transform;
        //apply a color shift for each instance
        replicator.instanceBlueOffset = -0.1;
        replicator.instanceGreenOffset = -0.1;
        //create a sublayer and place it inside the replicator
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(100.0f, 100.0f, 50.0f, 50.0f);
        layer.backgroundColor = [UIColor whiteColor].CGColor;
        [replicator addSublayer:layer];
        replicator;
    });
     [View.layer addSublayer:replicator];}  
  
> 注意到当图层在重复的时候，他们的颜色也在变化：这是用instanceBlueOffset和instanceGreenOffset属性实现的。通过逐步减少蓝色和绿色通道，我们逐渐将图层颜色转换成了红色。  
  
### *2 反射*  
  
> 使用CAReplicatorLayer并应用一个负比例变换于一个复制图层，你就可以创建指定视图（或整个视图层次）内容的镜像图片，这样就创建了一个实时的『反射』效果

    -(void)reflectionView:(UIView*)view{
    //给view形成倒影
    ReflectionView* reflectionview =({
        ReflectionView* reflectionview = [[ReflectionView alloc] initWithFrame:CGRectMake(20, 20,200, 100)];
        UIImageView* imageView = [[UIImageView alloc] initWithFrame:reflectionview.bounds];
        [imageView setImage:[UIImage imageNamed:@"2"]];
        [reflectionview addSubview:imageView];
        reflectionview;
    });
    [view addSubview:reflectionview];
    }
    
    #import "ReflectionView.h"
    @implementation ReflectionView
	+ (Class)layerClass
	{
	    return [CAReplicatorLayer class];
	}
	- (void)setUp
	{
	    //configure replicator
	    CAReplicatorLayer *layer = (CAReplicatorLayer *)self.layer;
	    layer.instanceCount = 2;
	    //move reflection instance below original and flip vertically
	    CATransform3D transform = CATransform3DIdentity;
	    CGFloat verticalOffset = self.bounds.size.height + 2;
	    transform = CATransform3DTranslate(transform, 0, verticalOffset, 0);
	    transform = CATransform3DScale(transform, 1, -1, 0);
	    layer.instanceTransform = transform;
	    //reduce alpha of reflection layer
	    layer.instanceAlphaOffset = -0.6;
	}
	- (id)initWithFrame:(CGRect)frame
	{
	    //this is called when view is created in code
	    if ((self = [super initWithFrame:frame])) {
	        [self setUp];
	    }
	    return self;
	}
	- (void)awakeFromNib
	{
	    //this is called when view is created from a nib
	    [self setUp];
	}
	@end  
   
  
> 开源代码ReflectionView完成了一个自适应的渐变淡出效果（用CAGradientLayer和图层蒙板实现），[代码](https://github.com/nicklockwood/ReflectionView)  
    
## CAScrollLayer  
  
> CAScrollLayer有一个-scrollToPoint:方法，它自动适应bounds的原点以便图层内容出现在滑动的地方。当涉及到实现图层滑动的时候就可以用上了 

     -(void)scrollView:(UIView*)view{
    // 可以拖动view的子视图
    ScrollView* scroView = ({
        ScrollView* scroView = [[ScrollView alloc] initWithFrame:CGRectMake(20, 20, 200, 300)];
        scroView.backgroundColor = [UIColor orangeColor];
        UIImageView* imageView = [[UIImageView alloc] initWithFrame:scroView.bounds];
        [imageView setImage:[UIImage imageNamed:@"STARTIMAGE.jpg"]];
        [scroView addSubview:imageView];
        scroView;
    });
    [self.view addSubview:scroView];
    }  
	  #import "ScrollView.h"
	@implementation ScrollView
	+ (Class)layerClass
	{
	    return [CAScrollLayer class];
	}
	- (void)setUp
	{
	    self.layer.masksToBounds = YES;
	    UIPanGestureRecognizer *recognizer = nil;
	    recognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
	    [self addGestureRecognizer:recognizer];
	}
	- (id)initWithFrame:(CGRect)frame
	{
	    //this is called when view is created in code
	    if ((self = [super initWithFrame:frame])) {
	        [self setUp];
	    }
	    return self;
	}
	- (void)awakeFromNib {
	    //this is called when view is created from a nib
	    [self setUp];
	}
	- (void)pan:(UIPanGestureRecognizer *)recognizer
	{
	    //get the offset by subtracting the pan gesture
	    //translation from the current bounds origin
	    CGPoint offset = self.bounds.origin;
	    offset.x -= [recognizer translationInView:self].x;
	    offset.y -= [recognizer translationInView:self].y;
	    //scroll the layer
	    [(CAScrollLayer *)self.layer scrollToPoint:offset];
	    //reset the pan gesture translation
	    [recognizer setTranslation:CGPointZero inView:self];
	}
	@end  
   
  
## CATiledLayer  
> 有些时候你可能需要绘制一个很大的图片，常见的例子就是一个高像素的照片或者是地球表面的详细地图。iOS应用通畅运行在内存受限的设备上，所以读取整个图片到内存中是不明智的。载入大图可能会相当地慢，那些对你看上去比较方便的做法（在主线程调用UIImage的-imageNamed:方法或者-imageWithContentsOfFile:方法）将会阻塞你的用户界面，至少会引起动画卡顿现象。

      - (void)viewDidLoad
	{
	    [super viewDidLoad];
	    //add the tiled layer
	    CATiledLayer *tileLayer = [CATiledLayer layer];￼
	    tileLayer.frame = CGRectMake(0, 0, 2048, 2048);
	    tileLayer.delegate = self; [self.scrollView.layer addSublayer:tileLayer];
	    tileLayer.contentsScale = [UIScreen mainScreen].scale;
	    //configure the scroll view
	    self.scrollView.contentSize = tileLayer.frame.size;
	    //draw layer
	    [tileLayer setNeedsDisplay];
	}
	- (void)drawLayer:(CATiledLayer *)layer inContext:(CGContextRef)ctx
	{
	    //determine tile coordinate
	    CGRect bounds = CGContextGetClipBoundingBox(ctx);
	    //使得切割的小图以Retina的分辨率显示的
	    CGFloat scale = [UIScreen mainScreen].scale;
	    NSInteger x = floor(bounds.origin.x / layer.tileSize.width * scale);
	     NSInteger y = floor(bounds.origin.y / layer.tileSize.height * scale);
	    //load tile image
	    NSString *imageName = [NSString stringWithFormat: @"Snowman_%02i_%02i", x, y];
	    NSString *imagePath = [[NSBundle mainBundle] pathForResource:imageName ofType:@"jpg"];
	    UIImage *tileImage = [UIImage imageWithContentsOfFile:imagePath];
	    //draw tile
	    UIGraphicsPushContext(ctx);
	    [tileImage drawInRect:bounds];
	    UIGraphicsPopContext();
	}
	@end  
  
  
## CAEmitterLayer  
  
> 在iOS 5中，苹果引入了一个新的CALayer子类叫做CAEmitterLayer。CAEmitterLayer是一个高性能的粒子引擎，被用来创建实时例子动画如：烟雾，火，雨等等这些效果。 

      -(void)emitterView:(UIView*)view{
    // 实现一个发射器效果
    CAEmitterLayer *emitter = ({
        CAEmitterLayer *emitter = [CAEmitterLayer layer];
        emitter.frame = view.bounds;
        //configure emitter
        emitter.renderMode = kCAEmitterLayerAdditive;
        emitter.emitterPosition = CGPointMake(emitter.frame.size.width / 2.0, emitter.frame.size.height / 2.0);
        //create a particle template
        CAEmitterCell *cell = [[CAEmitterCell alloc] init];
        cell.contents = (__bridge id)[UIImage imageNamed:@"2x.png"].CGImage;
        cell.birthRate = 150;
        cell.lifetime = 5.0;
        cell.color = [UIColor colorWithRed:1 green:0.5 blue:0.1 alpha:1.0].CGColor;
        cell.alphaSpeed = -0.4;
        cell.velocity = 50;
        cell.velocityRange = 50;
        cell.emissionRange = M_PI * 2.0;
        //add particle template to emitter
        emitter.emitterCells = @[cell];
        emitter;
    });
     [view.layer addSublayer:emitter];
    }   
     
### *CAEMitterCell的属性基本上可以分为三种：*
- 这种粒子的某一属性的初始值。比如，color属性指定了一个可以混合图片内容颜色的混合色。在示例中，我们将它设置为桔色。
- 例子某一属性的变化范围。比如emissionRange属性的值是2π，这意味着例子可以从360度任意位置反射出来。如果指定一个小一些的值，就可以创造出一个圆锥形
- 指定值在时间线上的变化。比如，在示例中，我们将alphaSpeed设置为-0.4，就是说例子的透明度每过一秒就是减少0.4，这样就有发射出去之后逐渐小时的效果。
> CAEmitterLayer的属性它自己控制着整个例子系统的位置和形状。一些属性比如birthRate，lifetime和celocity，这些属性在CAEmitterCell中也有。这些属性会以相乘的方式作用在一起，这样你就可以用一个值来加速或者扩大整个例子系统。其他值得提到的属性有以下这些： preservesDepth，是否将3D例子系统平面化到一个图层（默认值）或者可以在3D空间中混合其他的图层
renderMode，控制着在视觉上粒子图片是如何混合的。你可能已经注意到了示例中我们把它设置为kCAEmitterLayerAdditive，它实现了这样一个效果：合并例子重叠部分的亮度使得看上去更亮。如果我们把它设置为默认的kCAEmitterLayerUnordered，效果就没那么好看了  
  
## AVPlayerLayer  
  
> AVPlayerLayer是用来在iOS上播放视频的。他是高级接口例如MPMoivePlayer的底层实现，提供了显示视频的底层控制。AVPlayerLayer的使用相当简单：你可以用+playerLayerWithPlayer:方法创建一个已经绑定了视频播放器的图层，或者你可以先创建一个图层，然后用player属性绑定一个AVPlayer实例。   

      -(void)AVPlayerLayer{
    //get video URL
    NSURL *URL = [[NSBundle mainBundle] URLForResource:@"Ship" withExtension:@"mp4"];
    //create player and player layer
    AVPlayer *player = [AVPlayer playerWithURL:URL];
    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:player];
    //set player layer frame and attach it to our view
    playerLayer.frame = self.containerView.bounds;
    [self.containerView.layer addSublayer:playerLayer];
    //play the video
    [player play];} 
  
> 当然，因为AVPlayerLayer是CALayer的子类，它继承了父类的所有特性。并不会受限于要在一个矩形中播放视频,在3D，圆角，有色边框，蒙板，阴影等效果已然可以实现。
