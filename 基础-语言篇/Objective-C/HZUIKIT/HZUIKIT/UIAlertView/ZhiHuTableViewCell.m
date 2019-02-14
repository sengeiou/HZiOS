//
//  ZhiHuTableViewCell.m
//  HZUIKIT
//
//  Created by KB on 2018/7/25.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "ZhiHuTableViewCell.h"

@interface ZhiHuTableViewCell()

@end

@implementation ZhiHuTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *cellId = @"cellId";
    ZhiHuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[ZhiHuTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    return cell;
}

@end
