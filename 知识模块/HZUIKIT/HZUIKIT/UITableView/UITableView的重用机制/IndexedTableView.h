//
//  IndexedTableView.h
//  HZUIKIT
//
//  Created by 华天杰 on 2019/3/6.
//  Copyright © 2019年 HZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol IndexedTableViewDataSource <NSObject>

- (NSArray<NSString*>*)indexTitlesForIndexTableView:(UITableView*)tableView;

@end

@interface IndexedTableView : UITableView
@property(nonatomic,weak)id<IndexedTableViewDataSource>indexedDataSource;

@end
