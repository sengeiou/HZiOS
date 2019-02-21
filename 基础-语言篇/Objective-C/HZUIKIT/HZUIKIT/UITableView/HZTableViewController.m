//
//  HZTableViewController.m
//  HZUIKIT
//
//  Created by apple on 16/9/10.
//  Copyright © 2016年 HZ. All rights reserved.
/*
 
   CPU:{
      在子线程中做如下：
      对象的创建 销毁 调整
      预排版(布局计算，文本计算)
      预渲染(文本等异步绘制，图片编解码等)
   }
 
   GPU{
   
      纹理渲染（离屏渲染）
      视图混合（视图层级复杂，减轻视图层级复杂性）
    }
 
 
  + 使用UItableview的cell重用机制，避免cell的重新创建
  + 避免cell高度动态创建，遇到动态计算的需要考虑缓存cell的高度
  + 自定义cell要尽量固定子视图的宽高，避免调用layoutIfNeeded
  + 避免透明和半透明的使用
  + 根据滚动速度可以考虑显示占位视图，等待视图滚动减缓再渲染视图，这样能够避免卡顿和丢帧
  + 避免渐变、图片缩放和离屏渲染的存在；
 */

#import "HZTableViewController.h"

@interface HZTableViewController ()
@end

@implementation HZTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"UITableView";
    self.tableViewItems = @[@"HZWeiBoMainViewController",@"HZEstimateRowHeightViewController",@"HZLightViewController",@"HZListLinkViewController",@"HZEnumTableViewController",@"HZCornerRadiusViewController"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

/*
 （一） GPU的渲染分为两种
 （1）On-Screen Rendering (当前屏幕渲染)
   GPU的渲染是在当前用于显示的屏幕缓冲区进行的
  (2)Off-Screen Rendering（离屏渲染）
   GPU在当前屏幕缓冲区以外开辟一个缓存区进行渲染操作
 
  （二）离屏渲染的坏处
   (1)创建新缓冲区
       要进行离屏渲染，首先要创建一个新的缓冲区
   (2)上下文切换
     离屏渲染的整个过程，要多次切换上下文，On-Screen -> Off-Screen ,当离屏渲染结束后要将渲染结果显示，需要
    将上下文再次切换回来，而上下文的切换代价很大；
 
   (三)会触发离屏渲染的操作
    （1）为图层设置遮罩（layer.mask）
     (2) layer.masksToBounds/view.clipsToBounds 设置为true
    （3）layer.opacity小于1.0
    (4)layer.shadow
    (5)layer.cornerRadius
    (6)drawRect中进行绘制
  （四）如何优化
   （1）控件圆角的设置
     CAShaperLayer/Core Graphics 结合UIBezierPath 绘制圆角
    （2）阴影的绘制
    设置shadowPath
    （3）使用instrument的Core Animation
      + 图层的离屏渲染
      + 图层是否透明
 */


@end
