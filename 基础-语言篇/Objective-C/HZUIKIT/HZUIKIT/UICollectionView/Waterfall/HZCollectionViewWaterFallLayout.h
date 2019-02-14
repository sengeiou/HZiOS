//
//  HZCollectionViewWaterFallLayout.h
//  HZUIKIT
//
//  Created by apple on 16/12/12.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HZCollectionViewWaterFallLayout : UICollectionViewFlowLayout
@property(nonatomic,weak)id<UICollectionViewDelegateFlowLayout>delegate;
@property(nonatomic,assign)NSInteger cellCount;// cell的个数
@property(nonatomic,strong)NSMutableArray* colArr;// 存放列的高度
@property(nonatomic,strong)NSMutableDictionary* attributeDict;//cell的位置信息 

@end
