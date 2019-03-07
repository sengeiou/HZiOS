//
//  HZNewsFrame.m
//  HZThreeParty
//
//  Created by 华天杰 on 2018/10/16.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "HZNewsFrame.h"
#import "HZNews.h"

#define newsCellMargin 10.0f

@implementation HZNewsFrame
- (void)setNews:(HZNews *)news{
    _news = news;
    
    // cell的高度
    CGFloat cellHeight = 0.0;
    
    // 头像
    CGFloat avatarX = newsCellMargin;
    CGFloat avatarY = newsCellMargin;
    CGFloat avatarWidth = 30.0f;
    self.avatarImageViewFrame = CGRectMake(avatarX, avatarY, avatarWidth, avatarWidth);
    // 标题
    CGFloat titleX = CGRectGetMaxX(self.avatarImageViewFrame) + newsCellMargin;
    CGFloat titleY = newsCellMargin;
    CGFloat titleWidth = 100.0f;
    CGFloat titleHeight = 30.0f;
    self.titleLabelFrame = CGRectMake(titleX, titleY, titleWidth, titleHeight);
    //圆角按钮
    CGFloat tapButtonX = [UIScreen mainScreen].bounds.size.width - 40 - 15;
    self.tapButtonFrame = CGRectMake(tapButtonX, newsCellMargin, 40, 30);
    
    // 内容
    CGFloat contentX = newsCellMargin;
    CGFloat contentY = CGRectGetMaxY(self.avatarImageViewFrame) + newsCellMargin ;
    CGFloat contentWidth = UIScreen.mainScreen.bounds.size.width - newsCellMargin * 2;
    CGFloat contentHeight = [self textHeightWithText:news.content textWidth:contentWidth];
    self.contentLabelFrame = CGRectMake(contentX, contentY, contentWidth, contentHeight);
    cellHeight = CGRectGetMaxY(self.contentLabelFrame);
    // 详细图片
    if (news.detail_image_url.length > 0) {
        CGFloat detailImageViewX = newsCellMargin;
        CGFloat detailImageViewY = CGRectGetMaxY(self.contentLabelFrame);
        CGFloat detailImageViewWidth = 60.0f;
        CGFloat detailImageViewheight = 60.0f;
        self.detailImageViewFrame = CGRectMake(detailImageViewX, detailImageViewY, detailImageViewWidth, detailImageViewheight);
        cellHeight = CGRectGetMaxY(self.detailImageViewFrame);
    }
    self.cellHeight = cellHeight + newsCellMargin ;
}

-(CGFloat)textHeightWithText:(NSString*)text textWidth:(CGFloat)textWidth{
    // 计算高度
    CGSize size = [text boundingRectWithSize:CGSizeMake(textWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20.0]} context:nil].size ;
    CGFloat heightText = size.height+5.0f;
    return heightText;
}
@end
