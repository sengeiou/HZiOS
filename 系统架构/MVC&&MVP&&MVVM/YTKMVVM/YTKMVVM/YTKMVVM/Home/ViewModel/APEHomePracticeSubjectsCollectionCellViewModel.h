//
//  APEHomePracticeSubjectsCollectionCellViewModel.h
//  YTKMVVM
//
//  Created by 华天杰 on 2017/4/17.
//  Copyright © 2017年 HZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "APESubject.h"

@interface APEHomePracticeSubjectsCollectionCellViewModel : NSObject
@property (nonatomic, strong, nonnull) UIImage *image;
@property (nonatomic, strong, nonnull) UIImage *highlightedImage;
@property (nonatomic, strong, nonnull) NSString *title;
@property (nonatomic, strong, nonnull) UIColor *titleColor;
@property (nonatomic, strong, nonnull) UIColor *backgroundColor;

+ (nonnull APEHomePracticeSubjectsCollectionCellViewModel *)viewModelWithSubject:(nonnull
                                                                                  APESubject *)subject;
+ (nonnull APEHomePracticeSubjectsCollectionCellViewModel *)viewModelForMore;
@end
