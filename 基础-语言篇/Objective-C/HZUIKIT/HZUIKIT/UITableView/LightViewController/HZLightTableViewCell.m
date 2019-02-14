//
//  HZLightTableViewCell.m
//  HZUIKIT
//
//  Created by apple on 16/9/10.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import "HZLightTableViewCell.h"

@implementation HZLightTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _nameLable = [[UILabel alloc] initWithFrame:CGRectMake(10, 7, 100, 30)];
        [self.contentView addSubview:_nameLable];
        _addressLable = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_nameLable.frame), 7, self.frame.size.width-CGRectGetMaxX(_nameLable.frame), 30)];
        [self.contentView addSubview:_addressLable];
    }
    return self;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"HZLightTableViewCell";
    HZLightTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[HZLightTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

@end
