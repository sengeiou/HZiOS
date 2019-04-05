//
//  HZMasonryBaseUseViewController.m
//  HZThreeParty
//
//  Created by apple on 16/12/15.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import "HZMasonryBaseUseViewController.h"
#import <Masonry.h>

#define WS(weakSelf) __weak __typeof(&*self)weakSelf = self

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

// UI适配 5或者 6+ 边距不统一的情况如何解决
#define KRATE (SCREEN_WIDTH/320.0)
#define KKRATE(rate) (KRATE > 1 ? KRATE*rate : KRATE)

@interface HZMasonryBaseUseViewController ()
@property(nonatomic,strong)UIView* firstView;
@property(nonatomic,assign)BOOL fristViewIsExpend;
@end

@implementation HZMasonryBaseUseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    // Do any additional setup after loading the view.
    
    [self operationFristView];
}

-(void)setupView{
    
//    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    
   
    
    WS(weakSelf);
    UIView* redView = [UIView new];
    [redView setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:redView];
    
//    // 给redView设置一个距离self.view顶部10的约束
//    NSLayoutConstraint* constraint = [NSLayoutConstraint
//                                      constraintWithItem:redView
//                                      attribute:NSLayoutAttributeTop
//                                      relatedBy:NSLayoutRelationEqual
//                                      toItem:self.view
//                                      attribute:NSLayoutAttributeTop
//                                      multiplier:1.0
//                                      constant:10];
//    [redView addConstraint:constraint];
    
    
   /*
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
       // 设置约束
    }];
    
    [redView mas_updateConstraints:^(MASConstraintMaker *make) {
       // 更新约束
    }];
    
    [redView mas_remakeConstraints:^(MASConstraintMaker *make) {
       // 重新构建约束
    }];
    */
    
    
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        /*
           top : 上 +
           left：左 +
           bottom：低 -
           right：右 +
           qualTo：是对应对象
           mas_equalTo：对应具体的数值
        前边NSLayoutAttributeLeading和后边NSLayoutAttributeTrailing，这里前边和后边并不是总是为左边和右边的，有些国家的前边是右边后边是左边所以这样设定是为了国际化考虑
         */
        make.top.equalTo(weakSelf.view).offset(80.0f);
        make.left.equalTo(weakSelf.view).offset(20.0f);
        make.right.equalTo(weakSelf.view).offset(-20.0f);
        // 直接设置宽高
        make.height.mas_equalTo(redView.mas_width);
        // 设置宽高的比例
       // make.width.mas_equalTo(weakSelf.view).multipliedBy(1/3);
        // 约束优先级问题
        
    }];
    
    /*
        绿色view大小100*100；
        距离redView顶部 10.0f；
        处于redView 水平居中位置
     */
    UIView* greenView = [UIView new];
    [greenView setBackgroundColor:[UIColor greenColor]];
    [redView addSubview:greenView];
    [greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(redView).offset(10);
        make.size.mas_equalTo(CGSizeMake(100, 100));
        make.centerX.mas_equalTo(redView.mas_centerX);
    }];
    
    UILabel *label = [UILabel new];
    [label setBackgroundColor:[UIColor yellowColor]];
    [label setNumberOfLines:0];
    [label setText:@"和骄傲的凤凰健康的罚款及罚款多少级发掘的顺丰卡死的话费卡是打发收款单发生了咖啡机爱的色放"];
    [redView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(greenView.mas_bottom).offset(20);
        make.width.mas_equalTo(greenView.mas_width);
        make.centerX.equalTo(greenView);
    }];
    
    [redView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(label).offset(20);
    }];
}


-(void)setupAnotherView{
    WS(weakSelf);
    // 屏幕中间放一个200*200的红色视图
    UIView* redView = [UIView new];
    [redView setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:redView];
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(200, 200));
        make.center.equalTo(weakSelf.view);
    }];
    
    // 在红色view里放一个内边距上下左右10，20，20，40的蓝色view
    UIView *blueView = [UIView new];
    [blueView setBackgroundColor:[UIColor blueColor]];
    [redView addSubview:blueView];
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(redView).insets(UIEdgeInsetsMake(10, 20, 20, 40));
    }];
    
    //
    UIView *yellowView = [[UIView alloc] init];
    yellowView.backgroundColor = [UIColor yellowColor];
    [blueView addSubview:yellowView];
    [yellowView mas_makeConstraints:^(MASConstraintMaker *make) {
        //直接mas_equalTo(20)相当于针对yellowView的父视图布局
        make.top.equalTo(blueView).offset(10);
        make.left.equalTo(blueView).offset(10);
        make.right.equalTo(blueView).offset(-10);
        //这个multipliedBy 比例仅针对 同一个View的比例, 下面代码是指 height = width * 0.5;
        make.height.mas_equalTo(yellowView.mas_width).multipliedBy(0.5);
    }];
}

#pragma mark- 更新约束 
-(void)operationFristView{
    WS(weakSelf);
    UIView *firstView = [UIView new];
    firstView.center = self.view.center;
    [firstView setBackgroundColor:[UIColor redColor]];
    firstView.layer.borderColor = [UIColor blueColor].CGColor;
    firstView.layer.borderWidth = 2;
    self.firstView = firstView;
    [self.view addSubview:firstView];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(firstViewTapAction)];
    [firstView addGestureRecognizer:tap];
    [firstView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.view);
        make.centerY.equalTo(weakSelf.view).offset(-SCREEN_HEIGHT/4);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
}

-(void)firstViewTapAction{
    _fristViewIsExpend= !_fristViewIsExpend;
    
    [self.view setNeedsUpdateConstraints]; //标记为需要更新约束
    [self.view updateConstraintsIfNeeded]; //立即调用updateViewConstraints更新约束, 此方法只是更新了约束, 并没有刷新布局
    [UIView animateWithDuration:1.0 animations:^{
        [self.view layoutIfNeeded];  //动画 刷新布局
    }];
}

//不是一定需要把更新约束写在这个方法里, 可以自动一个方法, 苹果推荐使用这个方法更新约束
- (void)updateViewConstraints {
    [self.firstView mas_updateConstraints:^(MASConstraintMaker *make) {
        if (self.fristViewIsExpend) {
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT/2));
        } else {
            make.size.mas_equalTo(CGSizeMake(100, 100));
        }
    }];
    [super updateViewConstraints];
    NSLog(@"updateViewConstraints");
}

#pragma mark- 
-(void)operationSecondView{
    UIView *v1 = [UIView new];
    [v1 setBackgroundColor:[UIColor yellowColor]];
    [self.view addSubview:v1];
    UIView *v2 = [UIView new];
    [v2 setBackgroundColor:[UIColor yellowColor]];
    CGFloat padding = 15.0f;
     [self.view addSubview:v2];
    
    [v1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(padding);
        make.right.equalTo(v2.mas_left).offset(-padding);
        make.centerY.mas_equalTo(self.view.mas_centerY);
        make.height.mas_equalTo(100);
        make.width.equalTo(v2);
    }];
    
    [v2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(v1.mas_left).offset(padding);
        make.right.equalTo(self.view).offset(-padding);
        make.centerY.mas_equalTo(self.view.mas_centerY);
        make.height.mas_equalTo(100);
        make.width.equalTo(v1);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
