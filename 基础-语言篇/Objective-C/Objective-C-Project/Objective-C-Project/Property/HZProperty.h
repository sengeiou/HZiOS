//
//  HZProperty.h
//  Objective-C-Project
//
//  Created by 华天杰 on 2018/12/24.
//  Copyright © 2018年 HZ. All rights reserved.


#import <Foundation/Foundation.h>

@interface HZProperty : NSObject
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString * address;

@property(nonatomic,copy)NSString * skill;

@property(nonatomic,strong)NSArray* houseArray;

-(void)test;
@end

