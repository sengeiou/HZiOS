//
//  HZSearchBar.h
//  HZCodeSnippet
//
//  Created by 华天杰 on 2018/11/3.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HZSearchBar : UISearchBar
@property (nonatomic, copy) void (^searchBarShouldBeginEditingBlock)(); // 点击回调
@property (nonatomic, copy) void (^searchBarTextDidChangedBlock)();     // 编辑回调
@property (nonatomic, copy) void (^searchBarDidSearchBlock)();          // 编辑回调

+ (HZSearchBar *)searchBarWithPlaceholder:(NSString *)placeholder;
@end
