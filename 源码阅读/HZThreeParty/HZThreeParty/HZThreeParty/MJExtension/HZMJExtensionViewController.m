//
//  HZMJExtensionViewController.m
//  HZThreeParty
//
//  Created by 华天杰 on 2018/10/15.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "HZMJExtensionViewController.h"

#import <MJExtension.h>
#import "PersonModel.h"

@interface HZMJExtensionViewController ()

@end

@implementation HZMJExtensionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createModelWithDic];
}

-(void)createModelWithDic{
    // 由字典直接转换为模型对象
    NSDictionary *dic = @{@"id":@"100",@"name":@"hz",@"age":@"28"};
    PersonModel *person = [PersonModel mj_objectWithKeyValues:dic];
    NSLog(@"person name:%@",person.name);
    
    // 模型中嵌套模型
    NSDictionary *dic1 = @{
                          @"student" : @{
                                  @"name" : @"revon",
                                  @"age" : @"10"
                                  }
                          };
    PersonModel *person1 = [PersonModel mj_objectWithKeyValues:dic1];
    NSLog(@"person student name:%@",person1.student.name);
    
    // 模型中存在数组，数组中包含新的模型
    NSDictionary *dic2 = @{
                          @"studentArray" :
                          @[
                              @{@"name" : @"revon1", @"age" : @"18"},
                              @{@"name" : @"revon2", @"age" : @"140"}
                          ]};
    PersonModel *p2 = [PersonModel mj_objectWithKeyValues:dic2];
    for (StudentModel *st in p2.studentArray) {
        NSLog(@"--- name is %@", st.name);
    }
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
