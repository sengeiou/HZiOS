//
//  HZFirstCollectionReusableView.m
//  HZUIKIT
//
//  Created by apple on 16/10/10.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import "HZFirstCollectionReusableView.h"

@implementation HZFirstCollectionReusableView
-(instancetype)initWithFrame:(CGRect)frame{
    self =  [super initWithFrame:frame];
    if (self) {
        _titleLabel = [[UILabel alloc] initWithFrame:frame];
        [self addSubview:_titleLabel];
    }
    return self;
}

@end
