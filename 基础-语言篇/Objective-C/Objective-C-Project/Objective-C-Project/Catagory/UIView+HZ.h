//
//  UIView+HZ.h
//  Objective-C-Project
//
//  Created by 华天杰 on 2019/1/13.
//  Copyright © 2019年 HZ. All rights reserved.
//

#import <UIKit/UIKit.h>
// --- add protocol ---
@protocol UIViewCustomeDelegagte <NSObject>
-(void)view:(UIView*)view selectedItem:(id)item;
@end
@interface UIView (HZ)
@property(nonatomic,weak)id<UIViewCustomeDelegagte> customeDelegate;
// -- add property
@property(nonatomic,copy)NSString *customeFlag;

/*
 不使用关联对象，直接重写set和get方法会怎样？
 分类中@property声明属性，不会自动生成_property这个变量
 */
@property(nonatomic,copy)NSString *property;
// --- add method ---
-(CGFloat)x;
-(CGFloat)y;
-(void)testAddProtocol;
@end


