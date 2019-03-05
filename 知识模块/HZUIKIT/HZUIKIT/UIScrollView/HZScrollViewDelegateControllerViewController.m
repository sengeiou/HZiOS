//
//  HZScrollViewDelegateControllerViewController.m
//  HZUIKIT
//
//  Created by apple on 16/9/1.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import "HZScrollViewDelegateControllerViewController.h"

@interface HZScrollViewDelegateControllerViewController ()<UIScrollViewDelegate>
@property(nonatomic,strong)UIScrollView* scrollView;
@end

@implementation HZScrollViewDelegateControllerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    /*
     contentOffset: 内容偏移量，这个在scrollview发生滚动的时候反映在CGPoint上的变化
     ContentSize：scrollview的实际内容显示区域，只有contentsize大于scrollview自身的bonds菜会发生滚动
     contentInset 属性可以改变 content offset 的最大和最小值，这样便可以滚动出可滚动区域。它的类型为 UIEdgeInsets，包含四个值：{top，left，bottom，right}。
     */
    
    [self setUpView];
}

-(void)setUpView{
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    [self.scrollView setDelegate:self];
    [self.scrollView setBackgroundColor:[UIColor orangeColor]];
    [self.scrollView setContentSize:CGSizeMake(self.view.frame.size.width, self.view.frame.size.height+200.0f)];
    [self.view addSubview:self.scrollView];
}

#pragma mark- UIScrollViewDelegate 
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"--->y=%f",scrollView.contentOffset.y);
    NSLog(@"scrollViewDidScroll");
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    NSLog(@"scrollViewWillBeginDragging!");
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    NSLog(@"scrollViewWillEndDragging");
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    NSLog(@"scrollViewDidEndDragging");
    if (decelerate) {
        NSLog(@"willDecelerate!!!!");
    }
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
  // 减速动画开始前被调用
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
  // 减速动画结束后被调用
}

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
