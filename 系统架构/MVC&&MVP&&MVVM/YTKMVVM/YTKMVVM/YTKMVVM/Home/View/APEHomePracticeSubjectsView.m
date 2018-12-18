//
//  APEHomePracticeSubjectsView.m
//  YTKMVVM
//
//  Created by 华天杰 on 2017/4/17.
//  Copyright © 2017年 HZ. All rights reserved.
//

#import "APEHomePracticeSubjectsView.h"

@interface APEHomePracticeSubjectsView()
@property(nonatomic,strong)UICollectionView *collectionView;
@end

@implementation APEHomePracticeSubjectsView

- (void)bindDataWithViewModel:(nonnull APEHomePracticeSubjectsViewModel *)viewModel {
    self.viewModel = viewModel;
    self.backgroundColor = viewModel.backgroundColor;
    [self.collectionView reloadData];
    [self setNeedsUpdateConstraints];
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:
(NSIndexPath *)indexPath {
//  APEHomePracticeSubjectsCollectionViewCell *cell = [collectionView
//                                                       dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
//    if (0 <= indexPath.row && indexPath.row < self.viewModel.cellViewModels.count) {
//        APEHomePracticeSubjectsCollectionCellViewModel *vm =
//        self.viewModel.cellViewModels[indexPath.row];
//        [cell bindDataWithViewModel:vm];
//    }
//    return cell;
    return nil;
}

@end
