//
//  HZRetweetStatusView.m
//  HZWeiBo
//
//  Created by 华天杰 on 2018/10/15.
//  Copyright © 2018年 BQ. All rights reserved.
//

#import "HZRetweetStatusView.h"
#import "HZStatus.h"
#import "HZStatusFrame.h"
#import "HZUser.h"
#import <UIImageView+WebCache.h>
#import "HZPhoto.h"
#import "HZPhotosView.h"
#import "HZPhotoView.h"
#import "UIImage+HZ.h"


@interface HZRetweetStatusView()
/** 转发微博昵称 */
@property (nonatomic, weak) UIButton *retweetNameBtn;
/** 转发微博正文 */
@property (nonatomic, weak) UILabel *retweetContentLabel;
/** 转发微博配图 */
@property (nonatomic, weak) HZPhotosView *retweetPhotoView;
@end

@implementation HZRetweetStatusView

#pragma mark - 初始化

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        self.image = [UIImage resizedImageWithName:@"timeline_retweet_background" width:0.9 height:0.5];
        
        // 1. 昵称
        UIButton *retweetNameBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        retweetNameBtn.titleLabel.font = [UIFont systemFontOfSize:HZStatusNameFont];
        [retweetNameBtn setTitleColor:RGBColor(67, 107, 163) forState:UIControlStateNormal];
        [self addSubview:retweetNameBtn];
        self.retweetNameBtn = retweetNameBtn;
        
        // 2. 正文
        UILabel *retweetContentLabel = [[UILabel alloc] init];
        retweetContentLabel.font = [UIFont systemFontOfSize:HZStatusContentFont];
        retweetContentLabel.textColor = RGBColor(90, 90, 90);
        retweetContentLabel.numberOfLines = 0;
        [self addSubview:retweetContentLabel];
        self.retweetContentLabel = retweetContentLabel;
        
        // 3. 配图
        HZPhotosView *retweetPhotoView = [[HZPhotosView alloc] init];
        [self addSubview:retweetPhotoView];
        self.retweetPhotoView = retweetPhotoView;
    }
    return self;
}

#pragma mark - 设置数据

- (void)setStatusFrame:(HZStatusFrame *)statusFrame
{
    _statusFrame = statusFrame;
    
    HZStatus *retweetStatus = statusFrame.status.retweeted_status;
    
    // 昵称
    NSString *name = [NSString stringWithFormat:@"@%@", retweetStatus.user.name];
    [self.retweetNameBtn setTitle:name forState:UIControlStateNormal];
    self.retweetNameBtn.frame = statusFrame.retweetNameBtnF;
    
    // 正文
    [self.retweetContentLabel setText:retweetStatus.text];
    self.retweetContentLabel.frame = statusFrame.retweetContentLabelF;
    
    // 配图
    if (retweetStatus.pic_urls.count) {
        self.retweetPhotoView.hidden = NO;
        
        self.retweetPhotoView.photos = retweetStatus.pic_urls;
        
        self.retweetPhotoView.frame = statusFrame.retweetPhotoViewF;
    } else {
        self.retweetPhotoView.hidden = YES;
    }
}

@end
