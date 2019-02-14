//
//  UIScrollViewAutoLayoutViewController.m
//  HZUIKIT
//
//  Created by apple on 16/9/1.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import "UIScrollViewAutoLayoutViewController.h"

@interface UIScrollViewAutoLayoutViewController ()<UITextFieldDelegate>
@property(nonatomic,strong)UIScrollView* scrollView;
@property(nonatomic,strong)UITextField* textField;
@property(nonatomic,assign)CGFloat offsetY;
@end

@implementation UIScrollViewAutoLayoutViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    /*
       (1) 创建一个UIScrollview和控制器的View等高等宽，并设置约束（上下左右）均为0；
     （2）给scrollview新增一个subview作为contentView设置（上左右约束）为0，下的约束为1；
     （3）设置scrollview和contentView等高等宽约束
     （4）设置等高约束的优先级低于底部bottom的优先级
     */
    UIScrollView* scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    self.scrollView = scrollView;
    [self.view addSubview:scrollView];
    
    UITextField* textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    [textField setBackgroundColor:[UIColor grayColor]];
    [textField setPlaceholder:@"请输入密码"];
    [textField setDelegate:self];
    [textField setCenter:self.scrollView.center];
    [textField setReturnKeyType:UIReturnKeyDone];
    self.textField = textField;
    [ self.scrollView addSubview:textField];
    
    // 键盘弹起
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    //键盘回收
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillhide:) name:UIKeyboardWillHideNotification object:nil];
}

-(void)keyboardWillShow:(NSNotification*)notification{
    NSValue *aValue = [notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];
    // 获取键盘高度
    CGFloat height = keyboardRect.size.height;
    CGFloat maxTFY = CGRectGetMaxY(self.textField.frame);
    CGFloat keyBoadY= self.view.frame.size.height-height;
    if (keyBoadY<maxTFY) {
        [self.scrollView setContentOffset:CGPointMake(0, maxTFY-keyBoadY) animated:YES];
    }
}
-(void)keyboardWillhide:(NSNotification*)notification{
    [self.scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    NSLog(@"keyboardWillhide==>%@",notification);
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
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
