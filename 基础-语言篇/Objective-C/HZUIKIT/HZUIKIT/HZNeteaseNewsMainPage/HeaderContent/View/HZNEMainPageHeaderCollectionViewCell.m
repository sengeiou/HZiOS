//
//  HZNEMainPageHeaderCollectionViewCell.m
//  HZUIKIT
//
//  Created by 华天杰 on 2017/3/27.
//  Copyright © 2017年 HZ. All rights reserved.
//

#import "HZNEMainPageHeaderCollectionViewCell.h"

@implementation HZNEMainPageHeaderCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self =  [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.titleLabel];
    }
    return self;
}

-(UILabel*)titleLabel{
    if (_titleLabel==nil) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0,60, 35)];
        [_titleLabel setFont:[UIFont systemFontOfSize:12]];
        [_titleLabel setTextAlignment:NSTextAlignmentCenter];
    }
    return _titleLabel;
}

@end
