//
//  HZMasonryTableViewCell.h
//  HZThreeParty
//
//  Created by apple on 16/12/15.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HZMasonryModel.h"
@interface HZMasonryTableViewCell : UITableViewCell
@property(nonatomic,strong)HZMasonryModel* masonryModel;

+(instancetype)cellWithTableView:(UITableView*)tableView;
@end
