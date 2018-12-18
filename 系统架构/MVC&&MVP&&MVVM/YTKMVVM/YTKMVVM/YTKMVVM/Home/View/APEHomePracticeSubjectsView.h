//
//  APEHomePracticeSubjectsView.h
//  YTKMVVM
//
//  Created by 华天杰 on 2017/4/17.
//  Copyright © 2017年 HZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APEHomePracticeSubjectsViewModel.h"
@class APEHomePracticeSubjectsView;
@protocol APEHomePracticeSubjectsViewDelegate
- (void)homePracticeSubjectsView:(nonnull APEHomePracticeSubjectsView *)subjectView
                                                           didPressItemAtIndex:(NSInteger)index;

@end
@interface APEHomePracticeSubjectsView : UIView
@property (nonatomic, strong, nullable) APEHomePracticeSubjectsViewModel *viewModel;
@property (nonatomic, weak, nullable) id delegate;

- (void)bindDataWithViewModel:(nonnull APEHomePracticeSubjectsViewModel *)viewModel;
@end
