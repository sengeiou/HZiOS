//
//  APEHomePraticeViewController.m
//  YTKMVVM
//
//  Created by 华天杰 on 2017/4/17.
//  Copyright © 2017年 HZ. All rights reserved.
//

#import "APEHomePraticeViewController.h"
#import "APEHomePraticeDataController.h"

#import "APEHomePracticeBannerView.h"
#import "APEHomePracticeActivityView.h"
#import "APEHomePracticeSubjectsView.h"

@interface APEHomePraticeViewController ()<APEHomePracticeSubjectsViewDelegate>
@property(nonatomic,strong)UIScrollView *contentView;

@property(nonatomic,strong)APEHomePracticeBannerView *bannerView;
@property(nonatomic,strong)APEHomePracticeActivityView *activityView;
@property(nonatomic,strong)APEHomePracticeSubjectsView *subjectsView;

@property(nonatomic,strong)APEHomePraticeDataController *dataController;
@end

@implementation APEHomePraticeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpContentView];
    [self fetchSubjectData];
}

-(void)setUpContentView{
    self.contentView = [[UIScrollView alloc] init];
    [self.view addSubview:self.contentView];
    
    self.bannerView = [[APEHomePracticeBannerView alloc] init];
    self.activityView = [[APEHomePracticeActivityView alloc] init];
    self.subjectsView = [[APEHomePracticeSubjectsView alloc] init];
    self.subjectsView.delegate = self;
    
    [self.contentView addSubview:self.bannerView];
    [self.contentView addSubview:self.activityView];
    [self.contentView addSubview:self.subjectsView];
}

- (void)fetchSubjectData {
    [self.dataController requestSubjectDataWithCallback:^(NSError *error) {
        if (error == nil) {
            [self renderSubjectView];
        }
    }];
}
- (void)renderSubjectView {
    APEHomePracticeSubjectsViewModel *viewModel =
    [APEHomePracticeSubjectsViewModel viewModelWithSubjects:self.dataController.openSubjects];
    [self.subjectsView bindDataWithViewModel:viewModel];
}

#pragma mark-- APEHomePracticeSubjectsViewDelegate

- (void)homePracticeSubjectsView:(nonnull APEHomePracticeSubjectsView *)subjectView
             didPressItemAtIndex:(NSInteger)index{
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
