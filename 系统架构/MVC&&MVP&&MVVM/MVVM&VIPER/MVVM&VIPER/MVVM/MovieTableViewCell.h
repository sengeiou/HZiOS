//
//  MovieTableViewCell.h
//  MVVM&VIPER
//
//  Created by KB on 2018/6/21.
//  Copyright © 2018年 BQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieViewModel.h"
@interface MovieTableViewCell : UITableViewCell

@property(nonatomic,strong)MovieViewModel *movieViewModel;

+(instancetype)cellWithTableView:(UITableView*)tableView;
@end
