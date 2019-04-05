//
//  HZStatusCell.m
//  HZWeiBo
//
//  Created by 华天杰 on 2018/10/15.
//  Copyright © 2018年 BQ. All rights reserved.
//

#import "HZStatusCell.h"
#import "HZStatus.h"
#import "HZStatusFrame.h"
#import "HZUser.h"
#import <UIImageView+WebCache.h>
#import "HZStatusTopView.h"
#import "HZStatusToolBar.h"

@interface HZStatusCell()
/** 微博的topView */
@property (nonatomic, weak) HZStatusTopView *topView;
/** 微博工具条 */
@property (nonatomic, weak) HZStatusToolBar *statusToolBar;
@end

@implementation HZStatusCell
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"status";
    HZStatusCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[HZStatusCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}

#pragma mark - 重写setFrame:方法

- (void)setFrame:(CGRect)frame
{
    frame.origin.x = HZStatusPadding * 0.5;
    frame.size.width -= HZStatusPadding;
    frame.origin.y += HZStatusPadding * 0.5;
    frame.size.height -= HZStatusPadding * 0.5;
    
    [super setFrame:frame];
}

#pragma mark - 初始化

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.selectedBackgroundView = [[UIView alloc] init];
        
        // 初始化微博的topView
        [self setupTopView];
        
        // 初始化微博工具条
        [self setupToolBar];
    }
    return self;
}

/**
 *  初始化微博的topView
 */
- (void)setupTopView
{
    HZStatusTopView *topView = [[HZStatusTopView alloc] init];
    [self.contentView addSubview:topView];
    self.topView = topView;
}

/**
 *  初始化微博工具条
 */
- (void)setupToolBar
{
    HZStatusToolBar *statusToolBar = [[HZStatusToolBar alloc] init];
    [self.contentView addSubview:statusToolBar];
    self.statusToolBar = statusToolBar;
}

#pragma mark - 设置数据

- (void)setStatusFrame:(HZStatusFrame *)statusFrame
{
    _statusFrame = statusFrame;
    
    // 设置原创微博数据和frame
    [self setupTopViewData];
    
    // 设置微博工具条数据和frame
    [self setupToolBarData];
}

/**
 *  设置原创微博数据和frame
 */
- (void)setupTopViewData
{
    HZStatusFrame *statusFrame = self.statusFrame;
    
    // 传递数据和布局
    self.topView.statusFrame = statusFrame;
    self.topView.frame = statusFrame.originalViewF;
}

/**
 *  设置微博工具条数据和frame
 */
- (void)setupToolBarData
{
    self.statusToolBar.frame = self.statusFrame.statusToolBarF;
    self.statusToolBar.status = self.statusFrame.status;
}


@end
