//
//  APEHomePracticeSubjectsViewModel.h
//  YTKMVVM
//
//  Created by 华天杰 on 2017/4/17.
//  Copyright © 2017年 HZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface APEHomePracticeSubjectsViewModel : NSObject
@property (nonatomic, strong, nonnull) NSArray*cellViewModels;
@property (nonatomic, strong, nonnull) UIColor *backgroundColor;
+ (nonnull APEHomePracticeSubjectsViewModel *)viewModelWithSubjects:(nonnull NSArray *)subjects;
@end
