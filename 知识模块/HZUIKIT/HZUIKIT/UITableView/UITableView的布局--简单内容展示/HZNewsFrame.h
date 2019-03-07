//
//  HZNewsFrame.h
//  HZThreeParty
//
//  Created by 华天杰 on 2018/10/16.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class HZNews;
@interface HZNewsFrame : NSObject

@property(nonatomic,assign)CGRect avatarImageViewFrame;
@property(nonatomic,assign)CGRect titleLabelFrame;
@property(nonatomic,assign)CGRect tapButtonFrame;
@property(nonatomic,assign)CGRect contentLabelFrame;
@property(nonatomic,assign)CGRect detailImageViewFrame;
@property(nonatomic,assign)CGFloat  cellHeight;
@property(nonatomic,strong)HZNews * news;
@end
