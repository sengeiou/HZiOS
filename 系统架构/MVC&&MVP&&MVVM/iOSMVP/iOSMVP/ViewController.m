//
//  ViewController.m
//  iOSMVP
//
//  Created by KB on 2017/11/30.
//  Copyright © 2017年 HZ. All rights reserved.
//

#import "ViewController.h"

#import "BookView.h"
#import "Presenter.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)layoutSubViews{
    BookView* bookView = [[BookView alloc] init];
    Presenter* presenter = [[Presenter alloc]initWithBookView:bookView];
    [presenter getBook];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
