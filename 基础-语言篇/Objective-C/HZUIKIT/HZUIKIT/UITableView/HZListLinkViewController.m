//
//  HZListLinkViewController.m
//  HZUIKIT
//
//  Created by 华天杰 on 2018/7/6.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "HZListLinkViewController.h"

/*
   https://github.com/Eenie-Meenie/ListLinkage
   列表的联级滑动实现
 
   (1)ViewController中创建两个tableView（leftTableView、rightTableView）
  （2）当点击leftTableView的cell时，①判断当前cell是否为已选择的cell，如果不是则，将当前选中的cell设为选中样式，并清除上一次选中的cell②根据当前选中的indexPath，将rightTableView的section滚动到指定位置；
   （3）rightTableView滚动时获取当前indexPathsForVisibleRows最顶部的indexPath，然后让leftTableView selectRowAtIndexPath：
   （4）出现的问题：
     <1>点击leftTableView的时候出现rightTableView重复滚动；【引发了scrollView的scrollViewDidScroll】
 */

@interface HZListLinkViewController ()

@end

@implementation HZListLinkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
