//
//  HZStatusFrame.m
//  HZWeiBo
//
//  Created by 华天杰 on 2018/10/15.
//  Copyright © 2018年 BQ. All rights reserved.
//

#import "HZStatusFrame.h"
#import "HZStatus.h"
#import "HZUser.h"
#import "NSString+HZ.h"
#import "HZPhotosView.h"

@implementation HZStatusFrame

- (void)setStatus:(HZStatus *)status
{
    _status = status;
    
    HZUser *user = status.user;
    
    // cell宽度
    CGFloat cellW = [UIScreen mainScreen].bounds.size.width - HZStatusPadding;
    
    // 0. 原创微博父控件
    CGFloat originalW = cellW;
    CGFloat originalX = 0;
    CGFloat originalY = 0;
    
    // 1. 头像
    CGFloat iconXY =HZStatusPadding;
    CGFloat iconWH = 34;
    _iconViewF = CGRectMake(iconXY, iconXY, iconWH, iconWH);
    
    // 2. 昵称
    CGFloat nameX = CGRectGetMaxX(_iconViewF) + HZStatusPadding;
    CGFloat nameY = iconXY;
    CGSize nameSize = [user.name sizeWithFont:[UIFont systemFontOfSize:HZStatusNameFont]];
    _nameBtnF = (CGRect){nameX, nameY, nameSize};
    
    // 3. 会员
    if (user.mbtype > 0) {
        CGFloat vipX = CGRectGetMaxX(_nameBtnF) + HZStatusPadding;
        CGFloat vipY = nameY;
        CGFloat vipW = 14;
        CGFloat vipH = nameSize.height;
        _vipViewF = CGRectMake(vipX, vipY, vipW, vipH);
    }
    
    // 4. 时间
    CGFloat timeX = nameX;
    CGFloat timeY = CGRectGetMaxY(_nameBtnF) + HZStatusPadding * 0.5;
    CGSize timeSize = [status.created_at sizeWithFont:[UIFont systemFontOfSize:HZStatusTimeFont]];
    _timeLabelF = (CGRect){timeX, timeY, timeSize};
    
    // 5. 来源
    CGFloat sourceX = CGRectGetMaxX(_timeLabelF) + HZStatusPadding;
    CGFloat sourceY = timeY;
    CGSize sourceSize = [status.source sizeWithFont:[UIFont systemFontOfSize:HZStatusSourceFont]];
    _sourceLabelF = (CGRect){sourceX, sourceY, sourceSize};
    
    // 6. 正文
    CGFloat contentX = iconXY;
    CGFloat contentY = MAX(CGRectGetMaxY(_iconViewF), CGRectGetMaxY(_timeLabelF)) + HZStatusPadding;
    CGFloat contentMaxW = cellW - 2 * HZStatusPadding;
    // boundingRectWithSize
    CGSize contentSize = [status.text sizeWithFont:[UIFont systemFontOfSize:HZStatusContentFont] constrainedToSize:CGSizeMake(contentMaxW, MAXFLOAT)];
    _contentLabelF = (CGRect){contentX, contentY, contentSize};
    
    CGFloat originalH = CGRectGetMaxY(_contentLabelF) + HZStatusPadding;
    
    // 7. 配图
    if (status.pic_urls.count) {
        CGFloat photoX = iconXY;
        CGFloat photoY = CGRectGetMaxY(_contentLabelF) + HZStatusPadding;
        CGSize photoSize = [HZPhotosView sizeWithPhotosCount:status.pic_urls.count];
        _photoViewF = CGRectMake(photoX, photoY, photoSize.width, photoSize.height);
        
        originalH = CGRectGetMaxY(_photoViewF) + HZStatusPadding;
    }
    
    
    // 8. 转发微博
    if (status.retweeted_status) {
        // 0. 父控件
        CGFloat retweetX = iconXY;
        CGFloat retweetY = CGRectGetMaxY(_contentLabelF) + HZStatusPadding * 0.8;
        CGFloat retweetW = contentMaxW;
        
        // 1. 昵称
        CGFloat retNameX = HZStatusPadding;
        CGFloat retNameY = HZStatusPadding;
        NSString *name = [NSString stringWithFormat:@"@%@", status.retweeted_status.user.name];
        CGSize retNameSize = [name sizeWithFont:[UIFont systemFontOfSize:HZStatusNameFont]];
        _retweetNameBtnF = (CGRect){retNameX, retNameY, retNameSize};
        
        // 2. 正文
        CGFloat retContentX = retNameX;
        CGFloat retContentY = CGRectGetMaxY(_retweetNameBtnF) + HZStatusPadding * 0.5;
        CGFloat retContentMaxW = retweetW - 2 * HZStatusPadding;
        CGSize retContentSize = [status.retweeted_status.text sizeWithFont:[UIFont systemFontOfSize:HZStatusContentFont] constrainedToSize:CGSizeMake(retContentMaxW, MAXFLOAT)];
        _retweetContentLabelF = (CGRect){retContentX, retContentY, retContentSize};
        
        CGFloat retweetH = CGRectGetMaxY(_retweetContentLabelF) + HZStatusPadding;
        
        // 3. 配图
        if (status.retweeted_status.pic_urls.count) {
            CGFloat retPhotoX = retContentX;
            CGFloat retPhotoY = CGRectGetMaxY(_retweetContentLabelF) + HZStatusPadding;
            CGSize retPhotoSize = [HZPhotosView sizeWithPhotosCount:status.retweeted_status.pic_urls.count];
            _retweetPhotoViewF = (CGRect){retPhotoX, retPhotoY, retPhotoSize.width, retPhotoSize.height};
            
            retweetH = CGRectGetMaxY(_retweetPhotoViewF) + HZStatusPadding;
        }
        
        _retweetViewF = CGRectMake(retweetX, retweetY, retweetW, retweetH);
        
        originalH = CGRectGetMaxY(_retweetViewF) + HZStatusPadding;
    }
    
    _originalViewF = CGRectMake(originalX, originalY, originalW, originalH);
    
    // 9. 微博工具条 转发 评论  点赞
    CGFloat toolX = originalX;
    CGFloat toolY = originalH;
    CGFloat toolW = originalW;
    CGFloat toolH = 35;
    _statusToolBarF = CGRectMake(toolX, toolY, toolW, toolH);

    
    // cell的高度
    _cellHeight = CGRectGetMaxY(_statusToolBarF) + HZStatusPadding * 0.5;
}

@end
