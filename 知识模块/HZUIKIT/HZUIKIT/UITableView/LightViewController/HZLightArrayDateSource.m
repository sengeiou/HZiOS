//
//  HZLightArrayDateSource.m
//  HZUIKIT
//
//  Created by apple on 16/9/10.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import "HZLightArrayDateSource.h"
#import "HZLightTableViewCell.h"
@interface HZLightArrayDateSource ()
@property (nonatomic, strong) NSArray *items;
@property (nonatomic, copy) NSString *cellIdentifier;
@property(nonatomic,copy)NSString* cutomerCellClassName;
@property (nonatomic, copy) TableViewCellConfigureBlock configureCellBlock;

@end

@implementation HZLightArrayDateSource

- (id)initWithItems:(NSArray *)anItems
cutomerCellClassName:(NSString*)cutomerCellClassName
 configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock
{
    self = [super init];
    if (self) {
        self.items = anItems;
        self.configureCellBlock = [aConfigureCellBlock copy];
    }
    return self;
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath
{
    return self.items[(NSUInteger) indexPath.row];
}


#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell =[HZLightTableViewCell cellWithTableView:tableView];
    id item = [self itemAtIndexPath:indexPath];
    self.configureCellBlock(cell, item);
    return cell;
}


@end
