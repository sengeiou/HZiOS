//
//  ViewController.m
//  HZAnimation
//
//  Created by apple on 16/10/24.
//  Copyright © 2016年 ZY. All rights reserved.
/*
 
  文章： https://objccn.io/issue-12-1/
 
 */

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()
@property(nonatomic,strong)UIView *moveView;
@property(nonatomic,strong)UIView *orangeView;

@property(nonatomic,strong)UIView *shockView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.shockView];
    [self setUpUI];
}

-(void)setUpUI{

    // 动画
    UIButton* horizontalButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [horizontalButton setBackgroundColor:[UIColor orangeColor]];
    [horizontalButton setFrame:CGRectMake(10, 50, 80, 40)];
    [horizontalButton addTarget:self action:@selector(shockTheView) forControlEvents:UIControlEventTouchUpInside];
    [horizontalButton setTitle:@"动画" forState:UIControlStateNormal];
    [self.view addSubview:horizontalButton];
    
}

#pragma mark -- 控件的晃动提醒 [多步动画]
-(void)shockTheView{
    CAKeyframeAnimation* animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position.x";
    animation.values = @[@0,@10,@(-10),@10,@0];
    animation.keyTimes = @[ @0, @(1 / 6.0), @(3 / 6.0), @(5 / 6.0), @1 ];
    animation.duration = 0.4;
    // 设置 additive 属性为 YES 使 Core Animation 在更新 presentation layer 之前将动画的值添加到 model layer 中去
    animation.additive = YES;//
    [self.shockView.layer addAnimation:animation forKey:@"shake"];
}


#pragma mark-- 水平移动
-(void)horizontalMove{
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"position.x";//动画的键路径
    animation.fromValue = @(50);
    animation.toValue = @(self.view.frame.size.width);
    animation.duration = 3.0f;
    [self.moveView.layer addAnimation:animation forKey:@"basic"];
    
    
    /*
      3秒执行完毕后，moveView回到最初的状态；
      why？
      因为presentiton Layer超出执行时间后被移除，presentiton Layer
      就回到了model layer；
     
     ==》 一旦设置了layer的 position.x 那么该属性就被加锁，如果进行此属性的修改必须等到动画结束完成
     */
    // 使得动画执行完毕后 moveView仍旧停留在动画的结束位置
    self.moveView.layer.position = CGPointMake(self.view.frame.size.width, self.moveView.frame.origin.y+50);
    
    
    
//    NSLog(@"%@",@(self.moveView.frame));
//    NSLog(@"%@",@(self.moveView.layer.position));
//    
    // 如何实践直线加速
}

-(void)twoViewHorizontalMove{
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"position.x";
    animation.fromValue = @(50);
    animation.toValue = @(self.view.frame.size.width);
    animation.duration = 3;
    
    [self.moveView.layer addAnimation:animation forKey:@"basic"];
    self.moveView.layer.position = CGPointMake(self.view.frame.size.width, self.moveView.frame.origin.y+50);
    
    animation.beginTime = CACurrentMediaTime() + 1;
    
    [self.orangeView.layer addAnimation:animation forKey:@"basic"];
    // 未执行动画 orangeView 的position发生了变化
    self.orangeView.layer.position = CGPointMake(self.view.frame.size.width, self.orangeView.frame.origin.y+50);
}


-(UIView*)shockView{
    if (_shockView==nil) {
        _shockView = [[UIView alloc] initWithFrame:CGRectMake(40, 0, self.view.frame.size.width-40*2, 40)];
        _shockView.center = self.view.center;
        _shockView.backgroundColor = [UIColor blueColor];
    }
    return _shockView;
}


-(UIView*)moveView{
    if (_moveView==nil) {
        CGFloat moveViewHeight = 100;
        CGFloat moveViewY = self.view.frame.size.height - 2*moveViewHeight;
        _moveView = [[UIView alloc] initWithFrame:CGRectMake(0, moveViewY, moveViewHeight, moveViewHeight)];
        [_moveView setBackgroundColor:[UIColor redColor]];
    }
    return _moveView;
}

-(UIView*)orangeView{
    if (_orangeView==nil) {
        CGFloat moveViewHeight = 100;
        CGFloat moveViewY = self.view.frame.size.height - 4*moveViewHeight;
        _orangeView = [[UIView alloc] initWithFrame:CGRectMake(0, moveViewY, moveViewHeight, moveViewHeight)];
        [_orangeView setBackgroundColor:[UIColor orangeColor]];
    }
    return _orangeView;
}



-(void)boomView{
    CAEmitterLayer *emitter = [CAEmitterLayer layer];
    emitter.frame = self.view.bounds;
    [self.view.layer addSublayer:emitter];
    
    //configure emitter
    emitter.renderMode = kCAEmitterLayerAdditive;
    emitter.emitterPosition = CGPointMake(emitter.frame.size.width / 2.0, emitter.frame.size.height / 2.0);
    
    //create a particle template
    CAEmitterCell *cell = [[CAEmitterCell alloc] init];
    cell.contents = (__bridge id)[UIImage imageNamed:@"Spark.png"].CGImage;
    cell.birthRate = 100;
    cell.lifetime = 8.0;
    cell.color = [UIColor colorWithRed:1 green:0.5 blue:0.1 alpha:1.0].CGColor;
    cell.alphaSpeed = -0.4;
    cell.velocity = 50;
    cell.velocityRange = 50;
    cell.emissionRange = M_PI * 2.0;
    
    //add particle template to emitter
    emitter.emitterCells = @[cell];
}
/*
  性能调优
 (1)GPU
      1> GPU的相关操作: 将图层内容渲染到屏幕上
      2>影响GPU的操作
     太多的几何结构
     重绘：由重叠的半透明图层引起
     离屏绘制：不能直接在屏幕上绘制，必须绘制到离屏图片上下文中
     过大的图片
 (2)CPU
   1> 布局计算 :自动布局机制
   2> 视图的懒加载 ：iOS只会在视图控制器的视图显示在屏幕上时，才会加载他
   3> Core Graphics绘制：为了支持对图层内容的任意绘制，Core Animation必须创建一个内存中等大小的寄宿图片。然后一旦绘制结束之后，必须把图片数据通过IPC传到渲染服务器。在此基础上，Core Graphics绘制就会变得十分缓慢
   4>解压图片: PNG或者JPEG压缩之后的图片文件会比同质量的位图小得多。但是在图片绘制到屏幕上之前，必须把它扩展成完整的未解压的尺寸;iOS只有在真正绘制的时候才去解压
 
  （3）Instruments
    1> 时间分析器：测量方法打断CPU使用情况
    2> Core Animation:用来调试各种Core Animation性能问题
        *1 Color Blended Layers：基于渲染程度对于屏幕中的混合区域进行绿到红的高亮
        *2 ColorHitsGreenandMissesRed：耗时的图层绘制就会使用红色高亮
    3> OpenGL ES 驱动：用来调试GPU性能问题
       *1 Renderer Utilization - 如果这个值超过了~50%，就意味着你的动画可能对帧率有所限制，很可能因为离屏渲染或者是重绘导致的过度混合
      *2  Tiler Utilization - 如果这个值超过了~50%，就意味着你的动画可能限制于几何结构方面，也就是在屏幕上有太多的图层占用了
 */

/*
  高效绘制
 (1)避免使用CALayerDelegate协议中的-drawLayer:inContext:方法或者UIView中的-drawRect:
 原因：实现这两个方法中的其中之一就必须需要一个绘制上下文，这个上下文的大小基本和原有图层的内存占有量一致；所以重绘的代价太高
 （2）对于Core Graphics 可以使用CAShapLayer来替换绘制图形、直线和曲线，使用CATextLayer绘制文本，CAGradientLayer绘制渐变
 */
/*
  图像IO
 (1)使用列表加载远程图片资源
  1> 直接加载会导致界面卡顿；因为图片资源大，导致加载时间长；
   解决方案：在另外的线程中加载图片，在主线程中更新显示内容
 （2）延迟解压
 1> 图片资源被加载，就必须进行解码操作
 加载图片的时候iOS通常会延迟解压图片的时间；
 +imageNamed:可以避免延迟加载，但是此方法只是使用
 应用资源包中的图片
 2> 使用ImageIO框架强制将图片解压出来
 3> CATiledLayer：异步加载和显示大型图片
 4> 图片资源的缓存 （NSCache）
 
 */

/*
  关于离屏渲染问题
 (1)设置控件圆角：cornerRadius和masksToBounds一起使用时要考虑性能损耗
 可以采用CAShapeLayer结合UIBezierPath 绘制圆角的图层来实现
 (2)控件阴影的设置 采用 shadowPath来创建一个对应形状的阴影路径
 (3)混合和过度绘制（GPU会放弃绘制被遮挡住的图层像素）
  1> 给视图设置背景色，并且不透明
  2> 设置opaque 为yes
 (4)对象回收
   处理巨大数量的相似视图或是图层时还有一个技巧就是回收；类似于UITableView的重用机制
 */

#pragma mark- 使用CAShapLayer创造一个圆角View 
-(void)roundedViewWithCAShapeLayer{
    UIView* redView = [UIView new];
    redView.frame = CGRectMake(100, 100, 100, 100);
    [redView setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:redView];
    
    CAShapeLayer* shapLayer = [CAShapeLayer layer];
    shapLayer.frame = CGRectMake(0, 0, 100, 100);
    shapLayer.fillColor = [UIColor orangeColor].CGColor;
    shapLayer.path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 100, 100) cornerRadius:20].CGPath;
    [redView.layer addSublayer:shapLayer];
}

#pragma mark- 旋转一个View
-(void)rotateView{
    UIView* redView = [UIView new];
    redView.bounds = CGRectMake(0, 0, 100, 100);
    redView.center = self.view.center;
    [redView setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:redView];
    
    [UIView animateWithDuration:2.0f animations:^{
       //redView.transform = CGAffineTransformMakeRotation(M_PI_4);
        redView.layer.affineTransform = CGAffineTransformMakeRotation(M_PI_4);
    }];
}


#pragma mark -- 延迟3秒后做一个0.3秒的隐式动画

-(void)dismissWithDelay:(NSTimeInterval)delay{
    [UIView animateWithDuration:0.3
                          delay:delay
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         self.view.alpha = 0.0f;
    } completion:^(BOOL finished) {
        
    }];
}

-(void)test1{
    [self dismissWithDelay:3.0];
}


-(void)dismiss{
    [UIView animateWithDuration:0.3
                          delay:0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         self.view.alpha = 0.0f;
                     } completion:^(BOOL finished) {
                         
                     }];
}

-(void)test2{
    [self performSelector:@selector(dismiss) withObject:nil afterDelay:3.0f];
}

/*
 
 
 */



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
