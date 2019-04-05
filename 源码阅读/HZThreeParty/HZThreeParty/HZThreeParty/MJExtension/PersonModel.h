//
//  PersonModel.h
//  HZThreeParty
//
//  Created by 华天杰 on 2018/10/15.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StudentModel.h"

@interface PersonModel : NSObject
@property(nonatomic,copy)NSString* userID;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,assign)NSInteger age;
@property(nonatomic,copy)NSString* birthday;
@property(nonatomic,strong)StudentModel *student;
@property(nonatomic,copy)NSArray *studentArray;
@end
