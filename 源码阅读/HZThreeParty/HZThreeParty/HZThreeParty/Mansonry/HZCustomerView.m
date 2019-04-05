//
//  HZCustomerView.m
//  HZThreeParty
//
//  Created by KB on 2018/6/25.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "HZCustomerView.h"
#import <Masonry.h>
@interface HZCustomerView()
@property(nonatomic,strong)UIButton *button;
@end

@implementation HZCustomerView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return self;
}

/*
   apple建议设置/更新constraints的地方
 */

-(void)updateConstraints{
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(10);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(50);
    }];
    [super updateConstraints];
}

-(void)didTapButton:(UIButton*)button{
    
    // 标记约束需要更新
    [self setNeedsUpdateConstraints];
}


/*
 （1）  setNeedsLayout : 页面需要更新，但不会立即执行； 执行后会调用 layoutSubviews
 
 （2）  layoutIfNeeded：告知页面布局会立即更新，
 
 （3）  layoutSubViews：系统重写布局
 
 （4）  setNeedsUpdateConstraints：告知需要更新约束但不会立即执行
 
  (5)  updateConstraintsIfNeeded: 告知立即更新约束
 
 （6）  updateConstraints 系统更新约束
 */

@end
