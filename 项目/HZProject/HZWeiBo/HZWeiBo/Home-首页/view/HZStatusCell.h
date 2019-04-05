//
//  HZStatusCell.h
//  HZWeiBo
//
//  Created by 华天杰 on 2018/10/15.
//  Copyright © 2018年 BQ. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HZStatusFrame;
@interface HZStatusCell : UITableViewCell
@property (nonatomic, strong) HZStatusFrame *statusFrame;

+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
