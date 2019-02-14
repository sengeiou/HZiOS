//
//  HZCardOverLayViewController.m
//  HZUIKIT
//
//  Created by apple on 16/12/12.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import "HZCardOverLayViewController.h"
#import "HZCardOverLayFlowLayout.h"
#import "HZCardOverLayCollectionViewCell.h"

static NSString* identifier = @"HZCardOverLayViewController";
@interface HZCardOverLayViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong)UICollectionView* collectionView;
@property(nonatomic,copy)NSArray* dataSource;
@end

@implementation HZCardOverLayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupUI];
}

-(void)setupUI{
    HZCardOverLayFlowLayout* cardOverLayFlowLayout = [[HZCardOverLayFlowLayout alloc] init];
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:cardOverLayFlowLayout];
    [self.collectionView setBackgroundColor:[UIColor whiteColor]];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self.collectionView registerClass:[HZCardOverLayCollectionViewCell class] forCellWithReuseIdentifier:identifier];
    [self.view addSubview:self.collectionView];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataSource.count;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HZCardOverLayCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    [cell setBackgroundColor:[self randomColor]];
    return cell;
}

-(UIColor *) randomColor{
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  // 0.5 to 1.0,away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //0.5 to 1.0,away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

#pragma mark- 返回每一个Item的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(self.view.frame.size.width, 80);
}

-(NSArray*)dataSource{
    if (_dataSource == nil) {
        _dataSource = @[@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",];
    }
    return  _dataSource;
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
