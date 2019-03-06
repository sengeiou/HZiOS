//
//  IndexedTableView.m
//  HZUIKIT
//
//  Created by 华天杰 on 2019/3/6.
//  Copyright © 2019年 HZ. All rights reserved.
//

#import "IndexedTableView.h"
#import "ViewReusePool.h"

@interface IndexedTableView ()
{
    UIView *containerView;
    ViewReusePool *reusePool;
}
@end

@implementation IndexedTableView

- (void)reloadData{
    [super reloadData];
    if (containerView==nil) {
        containerView = [[UIView alloc] initWithFrame:CGRectZero];
        containerView.backgroundColor = [UIColor whiteColor];
        //避免索引条随着tableView发生滚动
        [self.superview insertSubview:containerView aboveSubview:self];
    }
    if (reusePool == nil) {
        reusePool = [[ViewReusePool alloc]init];
    }
    // 标记所有视图为可重用状态
    [reusePool reset];
    // reload字母索引条
    [self reloadIndexedBar];
}

-(void)reloadIndexedBar{
    // 获取字母索引条的显示内容
    NSArray<NSString*>*arrayTitles = nil;
    if([self.indexedDataSource respondsToSelector:@selector(indexTitlesForIndexTableView:)]){
        arrayTitles = [self.indexedDataSource indexTitlesForIndexTableView:self];
    }
    if (!arrayTitles||arrayTitles.count <= 0) {
        [containerView setHidden:YES];
        return;
    }
    NSUInteger count = arrayTitles.count;
    CGFloat buttonWidth = 60;
    CGFloat buttonHeight = self.frame.size.height / count;
    
    for (int i = 0; i < [arrayTitles count]; i++) {
        NSString * title = [arrayTitles objectAtIndex:i];
        //从重用池中取出一个button
        UIButton *button = (UIButton*)[reusePool dequeueReusableView];
        if (button==nil) {
            button = [[UIButton alloc] initWithFrame:CGRectZero];
            button.backgroundColor = [UIColor whiteColor];
            // 将button放入重用池中
            [reusePool addUsingView:button];
            NSLog(@"创建了一个button");
        }else{
            NSLog(@"Button 重用了");
        }
        // 添加button到父视图控件中
        [containerView addSubview:button];
        [button setTitle:title forState:UIControlStateNormal];
        [button setBackgroundColor:UIColor.orangeColor];
        [button setFrame:CGRectMake(0, i * buttonHeight, buttonWidth, buttonHeight)];
        
    }
    [containerView setHidden:NO];
    containerView.frame = CGRectMake(self.frame.origin.x + self.frame.size.width - buttonWidth, self.frame.origin.y, buttonWidth, self.frame.size.height);
    
}

@end
