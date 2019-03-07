//
//  HZNewsCell.h
//  HZThreeParty
//
//  Created by 华天杰 on 2018/10/16.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import <UIKit/UIKit.h>


@class HZNewsFrame;
typedef void(^IngoreUnInterestingItemBlock)();
@interface HZNewsCell : UITableViewCell

@property(nonatomic,strong)HZNewsFrame *newsFrame;

@property(nonatomic,copy)IngoreUnInterestingItemBlock ingoreUnInterestingItemBlock;

+(instancetype)cellWithTableView:(UITableView*)tableView;
@end
