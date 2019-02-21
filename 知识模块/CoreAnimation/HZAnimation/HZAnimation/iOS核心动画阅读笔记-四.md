title: iOS核心动画阅读笔记(四)
date: 2015-01-07 09:30  
categories: iOS 
tags: [iOS基础]
---
## 图层时间
### CAMediaTiming协议  
#### CAMediaTiming的属性

<!--more--> 


 /* The begin time of the object, in relation to its parent object, if
 * applicable. Defaults to 0. 
指定了动画开始之前的的延迟时间。这里的延迟从动画添加到可见图层的那一刻开始测量，默认是0（就是说动画会立刻执行）*/
@property CFTimeInterval beginTime;

/* The basic duration of the object. Defaults to 0.
duration是一个CFTimeInterval的类型（类似于NSTimeInterval的一种双精度浮点类型），对将要进行的动画的一次迭代指定了时间。 */
@property CFTimeInterval duration;

/* The rate of the layer. Used to scale parent time to local time, e.g.
 * if rate is 2, local time progresses twice as fast as parent time.
 * Defaults to 1.
speed是一个时间的倍数，默认1.0，减少它会减慢图层/动画的时间，增加它会加快速度。如果2.0的速度，那么对于一个duration为1的动画，实际上在0.5秒的时候就已经完成了 */
@property float speed;

/* Additional offset in active local time. i.e. to convert from parent
 * time tp to active local time t: t = (tp - begin) * speed + offset.
 * One use of this is to "pause" a layer by setting `speed' to zero and
 * `offset' to a suitable value. Defaults to 0.
timeOffset和beginTime类似，但是和增加beginTime导致的延迟动画不同，增加timeOffset只是让动画快进到某一点，例如，对于一个持续1秒的动画来说，设置timeOffset为0.5意味着动画将从一半的地方开始。
和beginTime不同的是，timeOffset并不受speed的影响。所以如果你把speed设为2.0，把timeOffset设置为0.5，那么你的动画将从动画最后结束的地方开始，因为1秒的动画实际上被缩短到了0.5秒。然而即使使用了timeOffset让动画从结束的地方开始，它仍然播放了一个完整的时长，这个动画仅仅是循环了一圈，然后从头开始播放 */
@property CFTimeInterval timeOffset;

/* The repeat count of the object. May be fractional. Defaults to 0.repeatCount，代表动画重复的迭代次数。 */
@property float repeatCount;

/* The repeat duration of the object. Defaults to 0. repeatDuration属性，它让动画重复一个指定的时间，而不是指定次数*/
@property CFTimeInterval repeatDuration;

/* When true, the object plays backwards after playing forwards. Defaults
 * to NO.autoreverses的属性（BOOL类型）在每次间隔交替循环过程中自动回放 *
@property BOOL autoreverses;

/* Defines how the timed object behaves outside its active duration.
 * Local time may be clamped to either end of the active duration, or
 * the element may be removed from the presentation. The legal values
 * are `backwards', `forwards', `both' and `removed'. Defaults to
 * `removed'. 当动画开始之前和动画结束之后，被设置动画的属性将会是什么值呢？通过使用 fillMode来设定
kCAFillModeForwards 
kCAFillModeBackwards 
kCAFillModeBoth 
kCAFillModeRemoved*/
@property(copy) NSString *fillMode; 
  
  
### 手动动画  
> timeOffset一个很有用的功能在于你可以它可以让你手动控制动画进程，通过设置speed为0，可以禁用动画的自动播放，然后来使用timeOffset来来回显示动画序列。这可以使得运用手势来手动控制动画变得很简单。

> 举个简单的例子：关门的动画，用手势控制动画。我们给视图添加一个UIPanGestureRecognizer，然后用timeOffset左右摇晃  
  
# 动画速度    
  
## 缓冲  
  
> Core Animation使用缓冲来使动画移动更平滑更自然，而不是看起来的那种机械和人工   
  
**如何模拟显示中物体的运动加速或是减速?**  
### CAMediaTimingFunction  
   
> 首先需要设置CAAnimation的timingFunction属性，是CAMediaTimingFunction类的一个对象。如果想改变隐式动画的计时函数，同样也可以使用CATransaction的+setAnimationTimingFunction:方法  
  
```
/*
  选项创建了一个线性的计时函数，同样也是CAAnimation的timingFunction属性为空时候的默认函数。
线性步调对于那些立即加速并且保持匀速到达终点的场景会有意义（例如射出枪膛的子弹），
但是默认来说它看起来很奇怪，因为对大多数的动画来说确实很少用到。
*/
kCAMediaTimingFunctionLinear 
/*
  创建了一个慢慢加速然后突然停止的方法。
对于之前提到的自由落体的例子来说很适合，或者比如对准一个目标的导弹的发射
*/
kCAMediaTimingFunctionEaseIn 
/*
   它以一个全速开始，然后慢慢减速停止。
它有一个削弱的效果，应用的场景比如一扇门慢慢地关上，而不是砰地一声
*/
kCAMediaTimingFunctionEaseOut 
/*
  创建了一个慢慢加速然后再慢慢减速的过程。这是现实世界大多数物体移动的方式，也是大多数动画来说最好的选择。
如果只可以用一种缓冲函数的话，那就必须是它了。
那么你会疑惑为什么这不是默认的选择，实际上当使用UIView的动画方法时，他的确是默认的，但当创建CAAnimation的时候，就需要手动设置它了
*/
kCAMediaTimingFunctionEaseInEaseOut
kCAMediaTimingFunctionDefault  
```  
### UIView的动画缓冲  
  
> 为了改变UIView动画的缓冲选项，给options参数添加如下常量之一 

    UIViewAnimationOptionCurveEaseInOut 
	UIViewAnimationOptionCurveEaseIn 
	UIViewAnimationOptionCurveEaseOut 
	UIViewAnimationOptionCurveLinear   
	 [UIView animateWithDuration:1.0 delay:0.0
	                        options:UIViewAnimationOptionCurveEaseOut
	                     animations:^{
	                            //set the position
	                            self.colorView.center = [[touches anyObject] locationInView:self.view];
	                        }
	                     completion:NULL];   
  
### 缓冲和关键帧动画  
  
> CAKeyframeAnimation有一个NSArray类型的timingFunctions属性，我们可以用它来对每次动画的步骤指定不同的计时函数。但是指定函数的个数一定要等于keyframes数组的元素个数减一，因为它是描述每一帧之间动画速度的函数。  
  
## 自定义的缓冲动画  
  
### 三次贝塞尔曲线   
  
> 一个三次贝塞尔曲线通过四个点来定义，第一个和最后一个点代表了曲线的起点和终点，剩下中间两个点叫做控制点，因为它们控制了曲线的形状，贝塞尔曲线的控制点其实是位于曲线之外的点，也就是说曲线并不一定要穿过它们。你可以把它们想象成吸引经过它们曲线的磁铁    
  

![三次贝塞尔缓冲函数](http://upload-images.jianshu.io/upload_images/117735-70edcfb2efcab3de.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
  
### 更加复杂的动画曲线    
  

![反弹动画曲线](http://upload-images.jianshu.io/upload_images/117735-f24720fa1318fcb4.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)   
  
> 用CAKeyframeAnimation创建一个动画，然后分割成几个步骤，每个小步骤使用自己的计时函数,可以实现类似的效果  
  
### 基于关键帧的缓冲  
  
> 为了使用关键帧实现反弹动画，我们需要在缓冲曲线中对每一个显著的点创建一个关键帧（在这个情况下，关键点也就是每次反弹的峰值），然后应用缓冲函数把每段曲线连接起来。同时，我们也需要通过keyTimes来指定每个关键帧的时间偏移，由于每次反弹的时间都会减少，于是关键帧并不会均匀分布  
  
> 这种方式还算不错，但是实现起来略显笨重（因为要不停地尝试计算各种关键帧和时间偏移）并且和动画强绑定了（因为如果要改变动画的一个属性，那就意味着要重新计算所有的关键帧）。那该如何写一个方法，用缓冲函数来把任何简单的属性动画转换成关键帧动画呢  
  
### 流程自动化  
  
> 我们把动画分割成相当大的几块，然后用Core Animation的缓冲进入和缓冲退出函数来大约形成我们想要的曲线。但如果我们把动画分割成更小的几部分，那么我们就可以用直线来拼接这些曲线（也就是线性缓冲）。为了实现自动化，我们需要知道如何做如下两件事情：
- 自动把任意属性动画分割成多个关键帧 
- 用一个数学函数表示弹性动画，使得可以对帧做便宜  
  
# 基于定时器的动画  
  
## 定时帧  
  
### CADisplayLink  
  
> CADisplayLink是CoreAnimation提供的另一个类似于NSTimer的类，它总是在屏幕完成一次更新之前启动，它的接口设计的和NSTimer很类似，所以它实际上就是一个内置实现的替代，但是和timeInterval以秒为单位不同，CADisplayLink有一个整型的frameInterval属性，指定了间隔多少帧之后才执行。默认值是1，意味着每次屏幕更新之前都会执行一次。但是如果动画的代码执行起来超过了六十分之一秒，你可以指定frameInterval为2，就是说动画每隔一帧执行一次（一秒钟30帧）或者3，也就是一秒钟20次，等等。

> 用CADisplayLink而不是NSTimer，会保证帧率足够连续，使得动画看起来更加平滑，但即使CADisplayLink也不能保证每一帧都按计划执行，一些失去控制的离散的任务或者事件（例如资源紧张的后台程序）可能会导致动画偶尔地丢帧。当使用NSTimer的时候，一旦有机会计时器就会开启，但是CADisplayLink却不一样：如果它丢失了帧，就会直接忽略它们，然后在下一次更新的时候接着运行。
   
### 计算帧的时间  
  
> 无论是使用NSTimer还是CADisplayLink，我们仍然需要处理一帧的时间超出了预期的六十分之一秒。由于我们不能够计算出一帧真实的持续时间，所以需要手动测量。我们可以在每帧开始刷新的时候用CACurrentMediaTime()记录当前时间，然后和上一帧记录的时间去比较  
  
### Run Loop 模式   
  
>  注意到当创建CADisplayLink的时候，我们需要指定一个run loop和run loop mode，对于run loop来说，我们就使用了主线程的run loop，因为任何用户界面的更新都需要在主线程执行，但是模式的选择就并不那么清楚了，每个添加到run loop的任务都有一个指定了优先级的模式，为了保证用户界面保持平滑，iOS会提供和用户界面相关任务的优先级，而且当UI很活跃的时候的确会暂停一些别的任务  
  
> 一个典型的例子就是当是用UIScrollview滑动的时候，重绘滚动视图的内容会比别的任务优先级更高，所以标准的NSTimer和网络请求就不会启动，一些常见的run loop模式如下：
- NSDefaultRunLoopMode - 标准优先级
- NSRunLoopCommonModes - 高优先级
- UITrackingRunLoopMode - 用于UIScrollView和别的控件的动画