//
//  HZNewsCell.m
//  HZThreeParty
//
//  Created by 华天杰 on 2018/10/16.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "HZNewsCell.h"
#import <UIImageView+WebCache.h>
#import "HZNews.h"
#import "HZNewsFrame.h"

@interface HZNewsCell()

@property(nonatomic,strong)UIImageView * avatarImageView;
@property(nonatomic,strong)UILabel * titleLabel;
@property(nonatomic,strong)UIButton* tapButton;
@property(nonatomic,strong)UILabel *contentLabel;
@property(nonatomic,strong)UIImageView * detailImageView;

@end

@implementation HZNewsCell

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *identifier = @"reuseCell";
    HZNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[HZNewsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.backgroundColor = UIColor.clearColor;
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.avatarImageView = [[UIImageView alloc] init];
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.textColor = [UIColor lightGrayColor];
        self.titleLabel.font = [UIFont systemFontOfSize:12.0f];
        
        self.tapButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.tapButton.backgroundColor = [UIColor orangeColor];
        self.tapButton.layer.cornerRadius = 5.0f;
        self.tapButton.layer.masksToBounds = YES;
        
        self.contentLabel = [[UILabel alloc] init];
        self.contentLabel.numberOfLines = 0;
        self.detailImageView = [[UIImageView alloc] init];
        
        [self.contentView addSubview:self.avatarImageView];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.tapButton];
        [self.contentView addSubview:self.contentLabel];
        [self.contentView addSubview:self.detailImageView];

    }
    return self;
}

- (void)setNewsFrame:(HZNewsFrame *)newsFrame{
    _newsFrame = newsFrame;
    HZNews *news = newsFrame.news;
    // 头像
    [self.avatarImageView sd_setImageWithURL:[NSURL URLWithString:news.avatar_image_url] placeholderImage:[UIImage imageNamed:@""]];
    self.avatarImageView.frame = newsFrame.avatarImageViewFrame;
    
    self.avatarImageView.layer.cornerRadius = self.avatarImageView.frame.size.height / 2;
    self.avatarImageView.layer.masksToBounds = YES;
    // 设置头像为圆形
//    CAShapeLayer *mask1 = [[CAShapeLayer alloc] init];
//    mask1.opacity = 1.0;
//    mask1.path = [UIBezierPath bezierPathWithOvalInRect:self.avatarImageView.bounds].CGPath;
//    self.avatarImageView.layer.mask = mask1;
    
    // 标题
    self.titleLabel.text = news.title;
    self.titleLabel.frame = newsFrame.titleLabelFrame;
    // 圆角button
    self.tapButton.frame = newsFrame.tapButtonFrame;
    // 内容
    self.contentLabel.text = news.content;
    self.contentLabel.frame = newsFrame.contentLabelFrame;
    // 详情图片
    [self.detailImageView sd_setImageWithURL:[NSURL URLWithString:news.detail_image_url] placeholderImage:[UIImage imageNamed:@""]];
    self.detailImageView.frame = newsFrame.detailImageViewFrame;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


/*
 *  将图片切成圆角
 */
- (UIImage *)drawCircleImage:(UIImage*)image{
    CGFloat size = MIN(image.size.width, image.size.height);
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(size, size), false, [UIScreen mainScreen].scale);
    CGContextAddPath(UIGraphicsGetCurrentContext(), [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, size, size)].CGPath);
    CGContextClip(UIGraphicsGetCurrentContext());
    
    CGFloat marginX = -(image.size.width - size) * 0.5;
    CGFloat marginY = -(image.size.height - size) * 0.5;
    [image drawInRect:CGRectMake(marginX, marginY, image.size.width, image.size.height)];
    
    CGContextDrawPath(UIGraphicsGetCurrentContext(), kCGPathFillStroke);
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end
