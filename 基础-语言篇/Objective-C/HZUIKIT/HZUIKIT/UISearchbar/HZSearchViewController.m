//
//  HZSearchViewController.m
//  HZUIKIT
//
//  Created by KB on 2018/7/26.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "HZSearchViewController.h"

@interface HZSearchViewController ()<UISearchControllerDelegate>
@property(nonatomic,strong)UISearchController *searchController;
@end

@implementation HZSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(UISearchController *)searchController{
    if (_searchController == nil) {
        _searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
        _searchController.delegate = self;
        _searchController.obscuresBackgroundDuringPresentation = NO;
        _searchController.searchBar.autocorrectionType = UITextAutocorrectionTypeNo;
        _searchController.searchBar.autocapitalizationType= UITextAutocapitalizationTypeNone;
        
        _searchController.searchBar.tintColor = [UIColor whiteColor];
        _searchController.searchBar.barTintColor = [UIColor whiteColor];
        
//        if (@available(iOS 11.0, *)) {
//            self.navigationItem.searchController = _searchController;
//        } else {
//            // Fallback on earlier versions
//        }
    }
    return _searchController;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
