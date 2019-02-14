//
//  HZHorizontalCollectionViewCell.m
//  HZUIKIT
//
//  Created by 华天杰 on 2017/3/29.
//  Copyright © 2017年 HZ. All rights reserved.
//

#import "HZHorizontalCollectionViewCell.h"

#define LABEL_RATE_OF_CELL_HEIGHT 0.3
@interface HZHorizontalCollectionViewCell()
@property(nonatomic,strong)UILabel* textLable;
@property(nonatomic,strong)UIImageView* imageView;
@end

@implementation HZHorizontalCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat cellWeight = frame.size.width;
        CGFloat cellHeight = frame.size.height;
        
        CGRect imageViewFrame = CGRectMake(0, 0, cellWeight, cellHeight*(1-LABEL_RATE_OF_CELL_HEIGHT));
        CGRect textLabelFrame = CGRectMake(0, cellHeight*(1-LABEL_RATE_OF_CELL_HEIGHT), cellWeight,cellHeight*LABEL_RATE_OF_CELL_HEIGHT);
        self.imageView.frame = imageViewFrame;
        self.textLable.frame = textLabelFrame;
        [self addSubview:self.imageView];
        [self addSubview:self.textLable];
    }
    return self;
}




-(UILabel*)textLable{
    if(_textLable==nil){
        _textLable = [[UILabel alloc] init];
    }
    return _textLable;
}

-(UIImageView*)imageView{
    if (_imageView==nil) {
        _imageView = [[UIImageView alloc] init];
    }
    return _imageView;
}
@end
