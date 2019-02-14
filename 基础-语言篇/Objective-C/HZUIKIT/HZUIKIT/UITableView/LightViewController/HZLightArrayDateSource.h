//
//  HZLightArrayDateSource.h
//  HZUIKIT
//
//  Created by apple on 16/9/10.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

typedef void(^TableViewCellConfigureBlock)(id cell,id item);
@interface HZLightArrayDateSource : NSObject<UITableViewDataSource>
@property(nonatomic,strong)UITableViewCell* cell;

- (id)initWithItems:(NSArray *)anItems
cutomerCellClassName:(NSString*)cutomerCellClassName
 configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock;

- (id)itemAtIndexPath:(NSIndexPath *)indexPath;
@end
