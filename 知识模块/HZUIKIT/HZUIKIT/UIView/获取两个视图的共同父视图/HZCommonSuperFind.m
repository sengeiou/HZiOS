//
//  HZCommonSuperFind.m
//  HZUIKIT
//
//  Created by KB on 2018/8/15.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "HZCommonSuperFind.h"
/*
   获取两个视图共同子视图的集合
 */
@implementation HZCommonSuperFind
- (NSArray <UIView *> *)findCommonSuperView:(UIView *)viewOne other:(UIView *)otherView{
    NSArray *viewOneSuperViews = [self findSuperViews:viewOne];
    NSArray *viewOtherSuperViews = [self findSuperViews:otherView];
    
    int i = 0;
    NSMutableArray *superViews = [NSMutableArray array];
    while (i < MIN(viewOneSuperViews.count, viewOtherSuperViews.count)) {
        UIView *viewOneSuperView = viewOneSuperViews[viewOneSuperViews.count -i -1];
        UIView *viewOtherSuperView = viewOtherSuperViews[viewOtherSuperViews.count -i -1];
        if (viewOneSuperView == viewOtherSuperView) {
            [superViews addObject:viewOneSuperView];
            i++;
        }else{
            break;
        }
    }
    return [superViews copy];
}


/**
 获取指定view的所有父视图集合

 @param view
 @return
 */
-(NSArray <UIView*> *)findSuperViews:(UIView *)view{
    UIView *tempView = view.superview;
    NSMutableArray *superViews = [NSMutableArray array];
    while (tempView != nil) {
        [superViews addObject:tempView];
        tempView = tempView.superview;
    }
    return [superViews copy];
}
@end
