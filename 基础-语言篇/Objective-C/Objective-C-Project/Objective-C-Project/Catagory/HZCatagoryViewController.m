//
//  HZCatagoryViewController.m
//  Objective-C-Project
//
//  Created by 华天杰 on 2019/1/13.
//  Copyright © 2019年 HZ. All rights reserved.
/*
   + 什么是分类
     分类是一种编译时的手段，为现有类添加新方法的技术
   + 分类特点
     运行时决议【运行时，通过runtime将方法添加到宿主类中】
     为系统类新增方法
   + 分类中都可以添加哪些内容
     实例/类方法
     协议
     属性（关联对象）
   + 分类的作用
     分解体积庞大的类文件
     声明私有方法
   + 分类与继承的对比（如何选择使用哪种技术）
     为系统类增加方法
     按照功能拆分大型文件
   + 分类的数据结构
     struct category_t{
         const char *name; // 分类名称
         classref_t cls; // 宿主类
         struct method_list_t *instanceMethods;
         struct method_list_t *classMethods;
         struct protocol_list_t *protocols;
         struct property_list_t *instanceProperties;
         method_list_t *methodsForMeta(bool isMeta){
             if(isMeta) return classMethods;
             else return instanceMethods;
         }
         property_list_t *propertiesForMeta(bool isMeta){
         if(isMeta) return nil;
         else return instanceProperties;
         }
     }
   + 分类的实现原理
 */

#import "HZCatagoryViewController.h"
#import "UIView+HZ.h"



@interface HZCatagoryViewController ()<UIViewCustomeDelegagte>
@property(nonatomic,strong)UIView* viewOne;
@end

@implementation HZCatagoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIView *viewOne = [UIView new];
    viewOne.frame = CGRectMake(100, 100, 50, 50);
    viewOne.backgroundColor = UIColor.orangeColor;
    NSLog(@"(1)customeFlag:%@",viewOne.customeFlag);
    viewOne.customeFlag = @"flag for some thing!!";
    viewOne.customeDelegate = self;
    [self.view addSubview:viewOne];
    
    self.viewOne = viewOne;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.viewOne testAddProtocol];
    });
    
    NSLog(@"x:%lf---y:%lf",viewOne.x,viewOne.y);
    NSLog(@"(2)customeFlag:%@",viewOne.customeFlag);
}


- (void)view:(UIView *)view selectedItem:(id)item{
    NSLog(@"selectedItem---->:%@",item);
}
@end
