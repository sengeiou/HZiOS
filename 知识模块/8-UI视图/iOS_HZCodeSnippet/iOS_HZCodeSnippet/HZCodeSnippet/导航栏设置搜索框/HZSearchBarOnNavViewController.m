//
//  HZSearchBarOnNavViewController.m
//  HZCodeSnippet
//
//  Created by 华天杰 on 2018/11/3.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "HZSearchBarOnNavViewController.h"
#import "HZSearchBar.h"

@interface HZSearchBarOnNavViewController ()

@end

@implementation HZSearchBarOnNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpSearchBarOnNav];
}

-(void)setUpSearchBarOnNav{
    HZSearchBar *searchBar  = [HZSearchBar searchBarWithPlaceholder:@"search"];
    searchBar.searchBarShouldBeginEditingBlock = ^{
        NSLog(@"搜索框被触发！");
    };
    self.navigationItem.titleView = searchBar;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
