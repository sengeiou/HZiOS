//
//  HZEqualWidthViewController.m
//  HZThreeParty
//
//  Created by apple on 16/12/15.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import "HZEqualWidthViewController.h"
#import <Masonry.h>
#import "UIView+EqualMargin.h"
@interface HZEqualWidthViewController ()

@end

@implementation HZEqualWidthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //[self setupView];
    [self setUpFixedWidthView];
}

-(void)setupView{
    /*
       在红色view中布局三个黄色view，
      1 黄色view是正方形；
      2 黄色view的上间距，左间距，右间距均为10.0f；
     */
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    CGFloat margin = 10.0f;
    UIColor *yellowColor = [UIColor yellowColor];
    UIView* containerView = [[UIView alloc] init];
    containerView.frame = CGRectMake(margin, 80,  screenBounds.size.width-margin*2,100);
    [containerView setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:containerView];
    
    UIView* yellowViewFrist = [[UIView alloc] init];
    [yellowViewFrist setBackgroundColor:yellowColor];
    [containerView addSubview:yellowViewFrist];
    
    UIView* yellowViewSecond = [[UIView alloc] init];
    [yellowViewSecond setBackgroundColor:yellowColor];
    [containerView addSubview:yellowViewSecond];
    
    UIView* yellowViewThird= [[UIView alloc] init];
    [yellowViewThird setBackgroundColor:yellowColor];
    [containerView addSubview:yellowViewThird];
    
    NSArray* yellowViewsArray = @[yellowViewFrist,yellowViewSecond,yellowViewThird];
    [yellowViewsArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:margin leadSpacing:margin tailSpacing:margin];
    [yellowViewsArray mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(containerView).offset(margin);
        make.height.mas_equalTo(yellowViewThird.mas_width);
    }];
    
}

-(void)setUpFixedWidthView{
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    CGFloat margin = 10.0f;
    UIColor *yellowColor = [UIColor yellowColor];
    UIView* containerView = [[UIView alloc] init];
    containerView.frame = CGRectMake(margin, 80,  screenBounds.size.width-margin*2,100);
    [containerView setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:containerView];
    
    NSInteger numberOfView = 4;
    CGFloat subViewWidth = 40.0f;
    CGFloat subMargin = (containerView.bounds.size.width - subViewWidth*numberOfView)/(numberOfView+1);
    NSMutableArray* mutableArray = [NSMutableArray array];
    for (NSInteger i = 0; i< numberOfView; i++) {
        UIView* yellowView = [UIView new];
        [yellowView setBackgroundColor:yellowColor];
        [containerView addSubview:yellowView];
        [mutableArray addObject:yellowView];
    }
    [mutableArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedItemLength:subViewWidth leadSpacing:subMargin tailSpacing:subMargin];
    [mutableArray mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(containerView).offset(margin);
        UIView* tempView = (UIView*)[mutableArray firstObject];
        make.height.mas_equalTo(tempView.mas_width);;
    }];
    
    
    //在红色View里面放三个大小不一样的绿色正方形, 间隙等大, masonry并没提供相关方法
    NSMutableArray *greenViews = [NSMutableArray array];
    for (NSInteger i = 0; i < 3; i++) {
        UIView *greenView = [[UIView alloc] init];
        greenView.backgroundColor = [UIColor greenColor];
        [containerView addSubview:greenView];
        [greenViews addObject:greenView];
        [greenView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(containerView).offset(-10);
            make.width.mas_equalTo(i*20 + 20);
            make.height.mas_equalTo(greenView.mas_width);
        }];
    }
    [containerView distributeSpacingHorizontallyWith:greenViews];
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
