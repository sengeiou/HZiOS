//
//  HZLightTableViewCell.h
//  HZUIKIT
//
//  Created by apple on 16/9/10.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HZLightTableViewCell : UITableViewCell
@property(nonatomic,strong)UILabel* nameLable;
@property(nonatomic,strong)UILabel* addressLable;

+(instancetype)cellWithTableView:(UITableView *)tableView;
@end
