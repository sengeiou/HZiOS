title: iOS核心动画阅读笔记（三）
date: 2015-01-06 09:30  
categories: iOS 
tags: [iOS基础]
---
### 隐式动画  
  
#### *事务*  
> 当你改变CALayer的一个可做动画的属性，它并不能立刻在屏幕上体现出来。相反，它是从先前的值平滑过渡到新的值。这一切都是默认的行为，你不需要做额外的操作,为什么会出现这种情况！？  
<!--more-->
> 当你改变一个属性，Core Animation是如何判断动画类型和持续时间的呢？实际上动画执行的时间取决于当前事务的设置，动画类型取决于图层行为.事务实际上是Core Animation用来包含一系列属性动画集合的机制，任何用指定事务去改变可以做动画的图层属性都不会立刻发生变化，而是当事务一旦提交的时候开始用一个动画过渡到新值。
   
> 事务是通过CATransaction类来做管理，这个类的设计有些奇怪，不像你从它的命名预期的那样去管理一个简单的事务，而是管理了一叠你不能访问的事务。CATransaction没有属性或者实例方法，并且也不能用+alloc和-init方法创建它。但是可以用+begin和+commit分别来入栈或者出栈。任何可以做动画的图层属性都会被添加到栈顶的事务，你可以通过+setAnimationDuration:方法设置当前事务的动画时间，或者通过+animationDuration方法来获取值（默认0.25秒）。
   
> Core Animation在每个run loop周期中自动开始一次新的事务（run loop是iOS负责收集用户输入，处理定时器或者网络事件并且重新绘制屏幕的东西），即使你不显式的用[CATransaction begin]开始一次事务，任何在一次run loop循环中属性的改变都会被集中起来，然后做一次0.25秒的动画。  

#### *完成块*  
  
**在平常的开发中经常会使用UIView封装好的几个动画API，通过在block中设置要改变的控件属性，设置好Duration，就能简单的完成一个过渡动画**  
  
> CATranscation接口提供的+setCompletionBlock:方法也有同样的功能。 

     -(void)changeViewColor{
    [CATransaction begin];
    [CATransaction setAnimationDuration:1.0];
    [CATransaction setCompletionBlock:^{
        CGAffineTransform transform = self.colorLayer.affineTransform;
        transform = CGAffineTransformRotate(transform, M_PI_2);
        self.colorLayer.affineTransform = transform;
    }];
    CGFloat red = arc4random() / (CGFloat)INT_MAX;
    CGFloat green = arc4random() / (CGFloat)INT_MAX;
    CGFloat blue = arc4random() / (CGFloat)INT_MAX;
    self.colorLayer.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0].CGColor;
    [CATransaction commit];
}   
  
> 注意旋转动画要比颜色渐变快得多，这是因为完成块是在颜色渐变的事务提交并出栈之后才被执行，于是，用默认的事务做变换，默认的时间也就变成了0.25秒。  
  
#### *图层行为*  
  
**如果直接用代码改变view的默认图层颜色，效果是颜色直接切换，而不是渐变，这里的解释就是UIView对默认图层属性的改变禁止了隐式动画**

>  我们把改变属性时CALayer自动应用的动画称作行为，当CALayer的属性被修改时候，它会调用-actionForKey:方法，传递属性的名称。剩下的操作都在CALayer的头文件中有详细的说明，实质上是如下几步：
-  图层首先检测它是否有委托，并且是否实现CALayerDelegate协议指定的-actionForLayer:forKey方法。如果有，直接调用并返回结果。
如果没有委托，或者委托没有实现-actionForLayer:forKey方法，图层接着检查包含属性名称对应行为映射的actions字典。
- 如果actions字典没有包含对应的属性，那么图层接着在它的style字典接着搜索属性名。
- 最后，如果在style里面也找不到对应的行为，那么图层将会直接调用定义了每个属性的标准行为的-defaultActionForKey:方法。

      -(void)actionForLayer{
    //test layer action when outside of animation block
    NSLog(@"Outside: %@", [self.containerView actionForLayer:self.containerView.layer forKey:@"backgroundColor"]);
    //begin animation block
    [UIView beginAnimations:nil context:nil];
    //test layer action when inside of animation block
    NSLog(@"Inside: %@", [self.containerView actionForLayer:self.containerView.layer forKey:@"backgroundColor"]);
    //end animation block
    [UIView commitAnimations];}  
  
#### *呈现与模型*  
  
> 当你改变一个图层的属性，属性值的确是立刻更新的（如果你读取它的数据，你会发现它的值在你设置它的那一刻就已经生效了），但是屏幕上并没有马上发生改变。这是因为你设置的属性并没有直接调整图层的外观，相反，他只是定义了图层动画结束之后将要变化的外观。
当设置CALayer的属性，实际上是在定义当前事务结束之后图层如何显示的模型。Core Animation扮演了一个控制器的角色，并且负责根据图层行为和事务设置去不断更新视图的这些属性在屏幕上的状态。  
  
### *显示动画*  
  
#### *属性动画*  
  
- CABasicAnimation
- CAKeyframeAnimation  
> CAKeyframeAnimation是另一种UIKit没有暴露出来但功能强大的类。和CABasicAnimation类似，CAKeyframeAnimation同样是CAPropertyAnimation的一个子类，它依然作用于单一的一个属性，但是和CABasicAnimation不一样的是，它不限制于设置一个起始和结束的值，而是可以根据一连串随意的值来做动画 

        - (IBAction)changeColor
		{
		    //create a keyframe animation
		    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
		    animation.keyPath = @"backgroundColor";
		    animation.duration = 2.0;
		    animation.values = @[
		                         (__bridge id)[UIColor blueColor].CGColor,
		                         (__bridge id)[UIColor redColor].CGColor,
		                         (__bridge id)[UIColor greenColor].CGColor,
		                         (__bridge id)[UIColor blueColor].CGColor ];
		    //apply animation to layer
		    [self.colorLayer addAnimation:animation forKey:nil];
		} 
  
  
---  
**使用关键帧动画、贝塞尔曲线和CAShapeLayer构造一个能按轨迹线路运行的动画**  
  

![屏幕快照](http://upload-images.jianshu.io/upload_images/117735-d33571190296cb7b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)   
  
- CAAnimationGroup   
  > CAAnimationGroup是另一个继承于CAAnimation的子类，它添加了一个animations数组的属性，用来组合别的动画 
  
#### *过渡*
> 过渡并不像属性动画那样平滑地在两个值之间做动画，而是影响到整个图层的变化。过渡动画首先展示之前的图层外观，然后通过一个交换过渡到新的外观 

     - (IBAction)switchImage
	{
	    //set up crossfade transition
	    CATransition *transition = [CATransition animation];
	    transition.type = kCATransitionFade;
	    //apply transition to imageview backing layer
	    [self.imageView.layer addAnimation:transition forKey:nil];
	    //cycle to next image
	    UIImage *currentImage = self.imageView.image;
	    NSUInteger index = [self.images indexOfObject:currentImage];
	    index = (index + 1) % [self.images count];
	    self.imageView.image = self.images[index];
	}   
   
#### *隐式过渡*  
  
> CATransision可以对图层任何变化平滑过渡的事实使得它成为那些不好做动画的属性图层行为的理想候选。苹果当然意识到了这点，并且当设置了CALayer的content属性的时候，CATransition的确是默认的行为。但是对于视图关联的图层，或者是其他隐式动画的行为，这个特性依然是被禁用的，但是对于你自己创建的图层，这意味着对图层contents图片做的改动都会自动附上淡入淡出的动画  
  
#### *对图层树的动画*  
  
> CATransition并不作用于指定的图层属性，这就是说你可以在即使不能准确得知改变了什么的情况下对图层做动画，例如，在不知道UITableView哪一行被添加或者删除的情况下，直接就可以平滑地刷新它，或者在不知道UIViewController内部的视图层级的情况下对两个不同的实例做过渡动画  
  
#### *自定义动画*  
  
> 我们证实了过渡是一种对那些不太好做平滑动画属性的强大工具，但是CATransition的提供的动画类型太少了。更奇怪的是苹果通过UIView +transitionFromView:toView:duration:options:completion:和+transitionWithView:duration:options:animations:方法提供了Core Animation的过渡特性。但是这里的可用的过渡选项和CATransition的type属性提供的常量完全不同   
  
#### *在动画过程中取消动画*  
`- (void)removeAnimationForKey:(NSString *)key;`  
`- (void)removeAllAnimations;`