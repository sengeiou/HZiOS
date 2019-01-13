//
//  HZSearchBar.m
//  HZCodeSnippet
//
//  Created by 华天杰 on 2018/11/3.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "HZSearchBar.h"
@interface HZSearchBar () <UISearchBarDelegate>

@end

@implementation HZSearchBar
+ (HZSearchBar *)searchBarWithPlaceholder:(NSString *)placeholder {
    HZSearchBar *searchBar = [[HZSearchBar alloc] init];
    searchBar.delegate = searchBar;
    searchBar.placeholder = placeholder;
    searchBar.tintColor = [UIColor colorWithRed:192 green:192 blue:192 alpha:1.0];
    [searchBar setImage:[UIImage imageNamed:@"searchIcon"] forSearchBarIcon:UISearchBarIconSearch state:UIControlStateNormal];
    
    UIView *searchBarSub = searchBar.subviews[0];
    for (UIView *subView in searchBarSub.subviews) {
        
        if ([subView isKindOfClass:NSClassFromString(@"UISearchBarTextField")]) {
            [subView setBackgroundColor:[UIColor colorWithRed:247 green:247 blue:242 alpha:1.0f]];
        }
        
        if ([subView isKindOfClass:NSClassFromString(@"UISearchBarBackground")]) {
            [subView removeFromSuperview];
        }
    }
    return searchBar;
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
    !self.searchBarShouldBeginEditingBlock ? : self.searchBarShouldBeginEditingBlock();
    return YES;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    !self.searchBarTextDidChangedBlock ? : self.searchBarTextDidChangedBlock();
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    !self.searchBarDidSearchBlock ? : self.searchBarDidSearchBlock();
}
@end
