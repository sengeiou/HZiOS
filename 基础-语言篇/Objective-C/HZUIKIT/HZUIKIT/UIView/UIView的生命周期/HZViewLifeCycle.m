//
//  HZViewLifeCycle.m
//  HZUIKIT
//
//  Created by KB on 2018/8/17.
//  Copyright © 2018年 HZ. All rights reserved.
//


/*
 initWithFrame:前面已经见到程序创建UI控件时常常会调用该方法执行初始化因此如果你需要对UI控件执行一些额外的初始化即可通过重写该方法来实现。
 
 initWithCoder:程序通过在nib文件中加载完该控件后会自动调用该方法。因此如果程序需要在nib文件中加载该控件后执行自定义初始化则可通过重写该方法来实现。
 
 drawRect:如果程序需要自行绘制该控件的内容则可通过重写该方法来实现。
 
 layoutSubviews如果程序需要对该控件所包含的子控件布局进行更精确的控制可通过重写该方法来实现。
 
 didAddSubview:当该控件添加子控件完成时将会激发该方法。
 
 willRemoveSubview:当该控件将要删除子控件时将会激发该方法。
 
 willMoveToSuperview:当该控件将要添加到其父控件中时将会激发该方法。
 
 didMoveToSuperview当把该控件添加到父控件完成时将会激发该方法。
 
 willMoveToWindow: 当该控件将要添加到窗口中时将会激发该方法。
 
 didMoveToWindow 当把该控件添加到窗口完成时将会激发该方法。
 
 touchesBegan:withEvent:当用户手指开始触碰该控件时将会激发该方法。
 
 touchesMoved:withEvent:当用户手指在该控件上移动时将会激发该方法。
 
 touchesEnded:withEvent:当用户手指结束触碰该控件时将会激发该方法。
 
 touchesCancelled:withEvent:用户取消触碰该控件时将会激发该方法。
 */


#import "HZViewLifeCycle.h"

@implementation HZViewLifeCycle



- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        
    }
    return self;
}

-(void)willMoveToSuperview:(UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    NSLog(@"willMoveToSuperview--");
}

- (void)didMoveToSuperview{
    [super didMoveToSuperview];
    NSLog(@"didMoveToSuperview--");
}

-(void)willRemoveSubview:(UIView *)subview{
    [super willRemoveSubview:subview];
    NSLog(@"willRemoveSubview--");
}




/*
 使视图重新刷新布局，只是作一个标记，当当前的runloop将要结束才会
 重新对使用setNeedsLayout标记的view进行重新绘制
 会触发-layoutSubviews
 */
- (void)setNeedsLayout{
    NSLog(@"setNeedsLayout");
}

/*
   会立即触发layoutSubviews
 */
-(void)layoutIfNeeded{
    NSLog(@"layoutIfNeeded");
}


/*
 重新定义子元素的位置和大小
 会触发layoutSubviews的一些事件如下：
 （1）设置frame,frame发生改变
 （2）addsubview
 （3）滚动UIScrollview
 */
-(void)layoutSubviews{
    NSLog(@"layoutSubviews");
}


/*
 setNeedsDisplay方法调用时，会触发drawRect方法
 */
-(void)setNeedsDisplay{
    [super setNeedsDisplay];
    NSLog(@"setNeedsDisplay");
}

- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    NSLog(@"----drawRect");
}

/*
    （1）初始化创建view -initwithFrame
    （2）设置一系列属性，使用setNeedsDisplay打个标记
     (3) 调用addSubView会触发 willMoveToSuperview --  didMoveToSuperview
    （4）最后会layoutSubviews
     (5)如果重写了 drawRect 还会触发该方法
 */

@end
