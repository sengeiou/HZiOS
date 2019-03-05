//
//  HZWaterfallViewController.m
//  HZUIKIT
//
//  Created by apple on 16/12/12.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import "HZWaterfallViewController.h"
#import "HZCollectionViewWaterFallLayout.h"
#import "HZWaterCollectionViewCell.h"

#define WIDTH ([UIScreen mainScreen].bounds.size.width-20)/3
CGFloat const kImageCount = 30;
static NSString *identifier = @"collectionView";

@interface HZWaterfallViewController ()
@property(nonatomic,strong)UICollectionView* collectionView;
@property (nonatomic, strong) NSArray  *imageArr;
@end

@implementation HZWaterfallViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    HZCollectionViewWaterFallLayout *flowLayout = [[HZCollectionViewWaterFallLayout alloc] init];
    self.collectionView = [[UICollectionView alloc] initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:flowLayout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerClass:[HZWaterCollectionViewCell class] forCellWithReuseIdentifier:identifier];
    [self.view addSubview:self.collectionView];
}

#pragma mark - UICollectionView dataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.imageArr count];
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HZWaterCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.image = self.imageArr[indexPath.item];  
    return cell;
}

#pragma mark - cell大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    UIImage *imge = [self.imageArr objectAtIndex:indexPath.row];
    CGFloat randomheight =  [self getRandomNumber:50 to:100];
    float height = [self imageHeight:randomheight width:imge.size.width];
    return CGSizeMake(WIDTH, height);
}

#pragma mark- 获取指定的随机数
-(int)getRandomNumber:(int)from to:(int)to
{
    return (int)(from + (arc4random() % ((to - from) + 1)));
}

#pragma mark - 计算图片高度
-(float)imageHeight:(float)height width:(float)width{
    /*
     高度/宽度 = 压缩后高度/压缩后宽度
     */
    float newHeight = height/width*(WIDTH);
    return newHeight;
}

#pragma mark - 边距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    UIEdgeInsets edgeInsets = {5,5,5,5};
    return edgeInsets;
}

-(NSArray*)imageArr{
    if (!_imageArr) {
        NSMutableArray *muArr = [NSMutableArray array];
        for (int i=1; i<=kImageCount; i++) {
            UIImage *image = [UIImage imageNamed:[[NSString alloc] initWithFormat:@"dropdown_anim__000%d",i]];
            [muArr addObject:image];
        }
        _imageArr = muArr;
    }
    return _imageArr;
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
