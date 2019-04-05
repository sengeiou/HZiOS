//
//  HZRACColorSelectedViewController.m
//  HZThreeParty
//
//  Created by 华天杰 on 2018/11/12.
//  Copyright © 2018年 HZ. All rights reserved.
/*
  xib/SB创建的对象为什么使用weak？使用strong可以吗？
  使用storyboard创建的viewController，会有一个 _topLevelObjectsToKeepAliveFromStoryboard的
  私有数组强引用所有top level的对象，同时top level对象强引用所有子对象，那么vc没必要再强引用top level对象的子对象。
 
  top level对象：顶级对象通常只包括添加到nib文件的窗口、菜单栏和自定义控制器对象
 */

#import "HZRACColorSelectedViewController.h"

#import <ReactiveObjC.h>

@interface HZRACColorSelectedViewController ()

@property (weak, nonatomic) IBOutlet UISlider *redSlider;
@property (weak, nonatomic) IBOutlet UISlider *greenSlider;
@property (weak, nonatomic) IBOutlet UISlider *blueSlider;

@property (weak, nonatomic) IBOutlet UITextField *redTF;
@property (weak, nonatomic) IBOutlet UITextField *greenTF;
@property (weak, nonatomic) IBOutlet UITextField *blueTF;

@property (weak, nonatomic) IBOutlet UIView *showColorView;

@end

@implementation HZRACColorSelectedViewController

/*
   1、编程逻辑的流畅性
   2、编程代码的清晰性
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _redTF.text = _greenTF.text = _blueTF.text = @"0.5";
    
   RACSignal *redSingal = [self bindSlider:_redSlider withTextfield:_redTF];
   RACSignal *greenSingal =  [self bindSlider:_greenSlider withTextfield:_greenTF];
   RACSignal *blueSingal =  [self bindSlider:_blueSlider withTextfield:_blueTF];
    
   RACSignal *showColorSingal = [[RACSignal combineLatest:@[redSingal,greenSingal,blueSingal]] map:^id _Nullable(RACTuple * _Nullable value) {
        return [UIColor colorWithRed:[value[0] floatValue] green:[value[1] floatValue] blue:[value[2] floatValue] alpha:1.0];
    }];
    
    RAC(_showColorView,backgroundColor) = showColorSingal;
}

-(RACSignal*)bindSlider:(UISlider*)slider withTextfield:(UITextField*)textfiled{
    //当textfiled的值发生一次改变的时候获取一次信号量[仅仅需要获取一次]
    RACSignal *textSignal = [[textfiled rac_textSignal] take:1];
    
    // RACChannelTerminal 信号终端
    RACChannelTerminal *sliderSingal = [slider rac_newValueChannelWithNilValue:nil];
    RACChannelTerminal *textFiledSingal = [textfiled rac_newTextChannel];
    
    // 相互订阅
    [[sliderSingal map:^id _Nullable(id  _Nullable value) {
        return [NSString stringWithFormat:@"%.02f",[value floatValue]];
    }] subscribe:textFiledSingal];
    [textFiledSingal subscribe:sliderSingal];
    
    // 合并信号量
    return [[textFiledSingal merge:sliderSingal] merge:textSignal];
}

@end
