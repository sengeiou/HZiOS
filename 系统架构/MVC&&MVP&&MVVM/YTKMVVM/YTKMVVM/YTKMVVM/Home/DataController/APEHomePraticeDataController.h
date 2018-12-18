//
//  APEHomePraticeDataController.h
//  YTKMVVM
//
//  Created by 华天杰 on 2017/4/17.
//  Copyright © 2017年 HZ. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "APEBaseDataController.h"
@interface APEHomePraticeDataController : APEBaseDataController
@property(nonatomic,copy)NSArray *openSubjects;

- (void)requestSubjectDataWithCallback:(nonnull APECompletionCallback)callback;
@end
