//
//  HZNewsCell.h
//  HZThreeParty
//
//  Created by 华天杰 on 2018/10/16.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HZNewsFrame;
@interface HZNewsCell : UITableViewCell

@property(nonatomic,strong)HZNewsFrame *newsFrame;

+(instancetype)cellWithTableView:(UITableView*)tableView;
@end
