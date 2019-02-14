//
//  HZTabViewController.m
//  HZUIKIT
//
//  Created by apple on 16/9/18.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import "HZTabViewController.h"

@interface HZTabViewController ()
@property(nonatomic,strong)UIViewController* currentViewController;
@property(nonatomic,assign)NSInteger currentSelectedIndex;
@property(nonatomic,strong)UIScrollView* contentScrollView;
@property(nonatomic,strong)UIScrollView* headScrollView;
@end

@implementation HZTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpView];
}

-(void)setUpView{
    CGFloat screen_width = self.view.frame.size.width;
    CGFloat screen_height = self.view.frame.size.height;
    //显示数据源
    NSArray* headTabTitles = @[@"主页",@"体育",@"新闻",@"娱乐",@"育儿",@"旅游",@"军事",@"纪录片",@"综艺",@"NBA"];
    NSArray* contentViewControllers = @[@"HZMainPageViewController",@"HZSportPageViewController",@"HZNewsPageViewController",@"HZEntertainmentPageViewController",@"HZChildrenPageViewController",@"HZMainPageViewController",@"HZSportPageViewController",@"HZNewsPageViewController",@"HZEntertainmentPageViewController",@"HZChildrenPageViewController"];
    self.currentSelectedIndex = 0 ;
    // 选项视图
    UIScrollView* headScrollView = [[UIScrollView alloc] init];
    [headScrollView setBackgroundColor:[UIColor lightGrayColor]];
    [headScrollView setFrame:CGRectMake(0, 0, 320, 44.0f)];
    [headScrollView setContentSize:CGSizeMake((headTabTitles.count)*60.0f, 44.0f)];
    self.headScrollView = headScrollView;
    [self.view addSubview:headScrollView];
    //选项视图内容
    CGFloat tabTitle_width =  headScrollView.contentSize.width/(headTabTitles.count);
    for (NSInteger index=0; index<headTabTitles.count; index++) {
        UIButton* title_btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [title_btn setFrame:CGRectMake(tabTitle_width*index, 7.0f, tabTitle_width, 30.0f)];
        [title_btn setTitle:headTabTitles[index] forState:UIControlStateNormal];
        [title_btn.layer setBorderWidth:1.0f];
        [title_btn setTag:index];
        [title_btn.layer setBackgroundColor:[UIColor grayColor].CGColor];
        [title_btn addTarget:self action:@selector(selectCurrentTabPage:) forControlEvents:UIControlEventTouchUpInside];
        [headScrollView addSubview:title_btn];
    }
    // 创建显示内容的视图
    UIScrollView* contentScrollView = [[UIScrollView alloc] init];
    [contentScrollView setFrame:CGRectMake(0, 44, screen_width, screen_height)];
    [contentScrollView setContentSize:CGSizeMake(screen_width*contentViewControllers.count, 0)];
    [contentScrollView setPagingEnabled:YES];
    self.contentScrollView  = contentScrollView;
    [self.view addSubview:contentScrollView];
    
    for (NSInteger index=0; index<contentViewControllers.count; index++) {
        Class contentClass = NSClassFromString(contentViewControllers[index]);
        UIViewController* viewController = [[contentClass alloc] init];
        [viewController.view setFrame:CGRectMake(index*screen_width, 0, screen_width, screen_height)];
        [contentScrollView addSubview:viewController.view];
        [self addChildViewController:viewController];
    }
}

// 展示当前选择的视图
-(void)selectCurrentTabPage:(UIButton*)button{
    NSInteger selectedIndex = button.tag;
    if (self.currentSelectedIndex == selectedIndex) {
        return;
    }else{
        CGFloat screen_width = self.view.frame.size.width;
        [self.contentScrollView setContentOffset:CGPointMake(selectedIndex*screen_width, 0) animated:NO];
        if (selectedIndex>3) {
            //向左偏移
          CGFloat offset_X = (selectedIndex+1)/2*60.0f;
          [self.headScrollView setContentOffset:CGPointMake(offset_X, 0) animated:YES];
        }else{
           //
        }
    }
    self.currentSelectedIndex = selectedIndex;
}


#pragma mark- 使用addchildViewController

//-(void)setUpView{
//    CGFloat screen_width = self.view.frame.size.width;
//    CGFloat screen_height = self.view.frame.size.height;
//    //显示数据源
//    NSArray* headTabTitles = @[@"主页",@"体育",@"新闻",@"娱乐",@"育儿"];
//    NSArray* contentViewControllers = @[@"HZMainPageViewController",@"HZSportPageViewController",@"HZNewsPageViewController",@"HZEntertainmentPageViewController",@"HZChildrenPageViewController"];
//    // 选项视图
//    UIScrollView* headScrollView = [[UIScrollView alloc] init];
//    [headScrollView setBackgroundColor:[UIColor lightGrayColor]];
//    [headScrollView setFrame:CGRectMake(0, 0, 320, 44.0f)];
//    [headScrollView setContentSize:CGSizeMake(screen_width+200.0f, 44.0f)];
//    [self.view addSubview:headScrollView];
//    //选项视图内容
//    CGFloat tabTitle_width =  headScrollView.contentSize.width/(headTabTitles.count);
//    for (NSInteger index=0; index<headTabTitles.count; index++) {
//        UIButton* title_btn = [UIButton buttonWithType:UIButtonTypeCustom];
//        [title_btn setFrame:CGRectMake(tabTitle_width*index, 7.0f, tabTitle_width, 30.0f)];
//        [title_btn setTitle:headTabTitles[index] forState:UIControlStateNormal];
//        [title_btn.layer setBorderWidth:1.0f];
//        [title_btn setTag:index];
//        [title_btn.layer setBackgroundColor:[UIColor grayColor].CGColor];
//        [title_btn addTarget:self action:@selector(selectCurrentTabPage:) forControlEvents:UIControlEventTouchUpInside];
//        [headScrollView addSubview:title_btn];
//    }
//    //
//    for (NSInteger index=0; index<contentViewControllers.count; index++) {
//        Class contentClass = NSClassFromString(contentViewControllers[index]);
//        UIViewController* viewController = [[contentClass alloc] init];
//        [viewController.view setFrame:CGRectMake(0, 44, screen_width, screen_height)];
//        if (index==0) {
//            //添加第一个视图
//            self.currentViewController = viewController;
//            [self.view addSubview:viewController.view];
//        }
//        [self addChildViewController:viewController];
//    }
//    
//}
//
//// 展示当前选择的视图
//-(void)selectCurrentTabPage:(UIButton*)button{
//    NSInteger selectIndex = button.tag;
//    NSArray *childViewControllers = self.childViewControllers;
//    UIViewController* selectViewController = childViewControllers[selectIndex];
//    if (self.currentViewController==selectViewController) {
//        return;
//    }
//    [self transitionFromViewController:self.currentViewController toViewController:selectViewController duration:0.1f options:UIViewAnimationOptionTransitionNone animations:^{
//        
//    } completion:^(BOOL finished) {
//        if (finished) {
//            [selectViewController didMoveToParentViewController:self];
//            self.currentViewController = selectViewController;
//        }
//    }];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
