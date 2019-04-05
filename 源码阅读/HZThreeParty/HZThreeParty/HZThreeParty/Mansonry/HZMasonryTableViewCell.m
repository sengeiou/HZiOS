//
//  HZMasonryTableViewCell.m
//  HZThreeParty
//
//  Created by apple on 16/12/15.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import "HZMasonryTableViewCell.h"
#import <Masonry.h> 

static NSString* cellIdentifier = @"HZMasonryTableViewCell";
@interface HZMasonryTableViewCell ()
@property(nonatomic,strong)UIImageView* userImageView;
@property(nonatomic,strong)UILabel* nameLabel;
@property(nonatomic,strong)UILabel* detailInformationLabel;
@end
@implementation HZMasonryTableViewCell

#pragma mark- 注意 此处
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUpView];
    }
    return self;
}


-(void)setUpView{
    [self.contentView addSubview:self.userImageView];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.detailInformationLabel];
}

+(instancetype)cellWithTableView:(UITableView*)tableView{
    HZMasonryTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[HZMasonryTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    return cell;
}

- (void)setMasonryModel:(HZMasonryModel *)masonryModel{
    _masonryModel = masonryModel;
    CGFloat screenWidth = self.contentView.frame.size.width;
    CGFloat topY = 0 ;
    NSString* userImageUrl = masonryModel.userImageUrl;
    if (userImageUrl.length>0) {
        self.userImageView.image = [UIImage imageNamed:masonryModel.userImageUrl];
        self.userImageView.frame = CGRectMake((screenWidth-100)/2, 10, 100, 100);
    }else{
        self.userImageView.frame = CGRectZero;
        self.userImageView.image = nil;
    }
    topY = CGRectGetMaxY(self.userImageView.frame);
    NSString* name = masonryModel.name;
    if (name.length>0) {
        self.nameLabel.text = masonryModel.name;
        self.nameLabel.frame = CGRectMake(0, 10+ topY, screenWidth, 30);
    }else{
        self.nameLabel.text = @"";
        self.nameLabel.frame = CGRectZero;
    }
    topY = self.nameLabel.frame.size.height+topY;
    NSString* detailInformation = masonryModel.detailInformation;
    if (detailInformation.length>0) {
        self.detailInformationLabel.text = masonryModel.detailInformation;
        CGFloat height = [self textHeightWithText:masonryModel.detailInformation];
        self.detailInformationLabel.frame = CGRectMake(0, 10+ topY, screenWidth, height);
    }else{
        self.detailInformationLabel.text = @"";
        self.detailInformationLabel.frame = CGRectZero;
    }
    topY = self.detailInformationLabel.frame.size.height+topY+15;

    // 缓存cell的高度
    masonryModel.cellHeight = topY;
}



//-(void)setMasonryModel:(HZMasonryModel *)masonryModel{
//    _masonryModel = masonryModel;
//    NSString* userImageUrl = masonryModel.userImageUrl;
//    if (userImageUrl.length>0) {
//        self.userImageView.image = [UIImage imageNamed:masonryModel.userImageUrl];
//        [self.userImageView mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.centerX.equalTo(self.contentView);
//            make.size.mas_equalTo(CGSizeMake(100, 100));
//            make.top.equalTo(self.contentView).offset(10);
//        }];
//    }else{
//        self.userImageView.image = nil;
//        [self.userImageView mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(self.contentView).offset(0);
//            make.size.mas_equalTo(CGSizeMake(0, 0));
//        }];
//    }
//    NSString* name = masonryModel.name;
//    if (name.length>0) {
//        self.nameLabel.text = masonryModel.name;
//        [self.nameLabel mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(self.userImageView.mas_bottom).offset(10);
//            make.left.equalTo(self.contentView).offset(0);
//            make.right.equalTo(self.contentView).offset(0);
//            make.height.mas_equalTo(30);
//        }];
//    }else{
//        self.nameLabel.text = @"";
//        [self.nameLabel mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(self.userImageView.mas_bottom).offset(0);
//            make.size.mas_equalTo(CGSizeMake(0, 0));
//        }];
//    }
//    NSString* detailInformation = masonryModel.detailInformation;
//    if (detailInformation.length>0) {
//        self.detailInformationLabel.text = masonryModel.detailInformation;
//        [self.detailInformationLabel mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(self.nameLabel.mas_bottom).offset(20);
//            make.centerX.equalTo(self.contentView);
//            make.width.mas_equalTo(200);
//            make.bottom.equalTo(self.contentView).offset(-10);
//        }];
//    }else{
//        self.detailInformationLabel.text = @"";
//        [self.detailInformationLabel mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(self.nameLabel.mas_bottom).offset(0);
//            make.size.mas_equalTo(CGSizeMake(0, 0));
//            make.bottom.equalTo(self.contentView).offset(-10);
//        }];
//    }
//
//}


-(UIImageView*)userImageView{
    if (_userImageView==nil) {
        _userImageView = [UIImageView new];
        [_userImageView setContentMode:UIViewContentModeScaleAspectFit];
    }
    return _userImageView;
}
-(UILabel*)nameLabel{
    if (_nameLabel==nil) {
        _nameLabel = [UILabel new];
        _nameLabel.numberOfLines = 0;
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        _nameLabel.textColor = [UIColor redColor];
    }
    return _nameLabel;
}
-(UILabel*)detailInformationLabel{
    if (_detailInformationLabel==nil) {
        _detailInformationLabel = [UILabel new];
        _detailInformationLabel.numberOfLines = 0;
        _detailInformationLabel.textAlignment = NSTextAlignmentCenter;
        _detailInformationLabel.font = [UIFont systemFontOfSize:20];
    }
    return _detailInformationLabel;
}

-(CGFloat)textHeightWithText:(NSString*)text{
    // 计算高度
    CGFloat screenWidth = self.contentView.frame.size.width;
    CGSize size = [text boundingRectWithSize:CGSizeMake(screenWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20.0]} context:nil].size ;
    CGFloat heightText = size.height+5.0f;
    return heightText;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
