//
//  HZFirstiOSAppViewController.m
//  HZUIKIT
//
//  Created by 华天杰 on 2017/8/6.
//  Copyright © 2017年 HZ. All rights reserved.
//

#import "HZFirstiOSAppViewController.h"

@interface HZFirstiOSAppViewController ()
@property (weak, nonatomic) IBOutlet UILabel *question_Label;
@property (weak, nonatomic) IBOutlet UILabel *answer_label;

@property(nonatomic,copy)NSArray* questionsArray;
@property(nonatomic,copy)NSArray* answersArray;
@property(nonatomic,assign)NSInteger selectedQuestionIndex;
@end

@implementation HZFirstiOSAppViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initFirstShowData];
}

-(void)initFirstShowData{
    self.selectedQuestionIndex = 0;
    self.question_Label.text= self.questionsArray[0];
}


/**
 * 展示问题

 @param sender
 */
- (IBAction)showQuestionAction:(UIButton *)sender {
    self.selectedQuestionIndex++;
    if (self.selectedQuestionIndex>=self.questionsArray.count) {
        self.selectedQuestionIndex=0;
    }
    self.question_Label.text= self.questionsArray[self.selectedQuestionIndex];
    self.answer_label.text = @"???";
}

- (IBAction)showAnswerAction:(UIButton *)sender {
    self.answer_label.text = self.answersArray[self.selectedQuestionIndex];
}


-(NSArray*)questionsArray{
    if (_questionsArray==nil) {
        _questionsArray = @[@"1+1=?",@"What weeks today?",@"你喜欢的篮球运动员是谁？"];
    }
    return _questionsArray;
}

-(NSArray*)answersArray{
    if (_answersArray==nil) {
        _answersArray = @[@"2",@"周日",@"科比"];
    }
    return _answersArray;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
