//
//  HZCollectionViewHeaderViewController.m
//  HZUIKIT
//
//  Created by apple on 16/10/10.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import "HZCollectionViewHeaderViewController.h"
#import "HZFristCollectionViewCell.h"
#import "HZFirstCollectionReusableView.h"
static NSString* collectionViewCellIdentifer = @"HZFristCollectionViewCell";
static NSString* collectionViewSectionHeaderIdentifer = @"HZFirstCollectionReusableView";
@interface HZCollectionViewHeaderViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@end

@implementation HZCollectionViewHeaderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self setUpUI];
}

-(void)setUpUI{
    //1 创建布局
    UICollectionViewFlowLayout* layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.headerReferenceSize = CGSizeMake(200, 30);//设置section的header
    // 2 设置collectionView的同时 要指定布局
    UICollectionView* collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    [collectionView setBackgroundColor:[UIColor whiteColor]];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    // 注册 cell
    [collectionView registerClass:[HZFristCollectionViewCell class] forCellWithReuseIdentifier:collectionViewCellIdentifer];
    // 注册 header section view
    [collectionView registerClass:[HZFirstCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:collectionViewSectionHeaderIdentifer];
    [self.view addSubview:collectionView];
    
}

#pragma mark- 
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 4;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 20;
}
- ( UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionViewCellIdentifer forIndexPath:indexPath];
    [cell setBackgroundColor:[UIColor orangeColor]];
    return cell;
}


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return  CGSizeMake(40, 40);
}

-(UICollectionReusableView*)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if (kind==UICollectionElementKindSectionHeader) {
        HZFirstCollectionReusableView* view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:collectionViewSectionHeaderIdentifer forIndexPath:indexPath];
        view.frame = CGRectMake(0, 0, 200, 30);
        view.titleLabel.text = [NSString stringWithFormat:@"%d",indexPath.section];
        return view;
    }
    return nil;
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
