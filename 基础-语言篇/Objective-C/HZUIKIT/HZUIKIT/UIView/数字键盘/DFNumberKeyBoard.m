//
//  DFNumberKeyBoard.m
//  DFNumberKeyBoard
//
//  Created by apple on 16/5/24.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import "DFNumberKeyBoard.h"

static const NSInteger keyBoardHeigth = 272;
static const CGFloat   animationIntervel = 0.25f;

typedef void (^SelectAction)(NSString* value);
@interface DFNumberKeyBoard()
@property(nonatomic,copy)SelectAction selectAction;
@property(nonatomic,copy)NSMutableArray* titleArray;
@end

@implementation DFNumberKeyBoard

+(instancetype)shareInstance{
    static DFNumberKeyBoard* keyBoard;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        keyBoard = [[self alloc] init];
    });
    return keyBoard;
}

-(void)showKeyBoardOnView:(UIView*)view type:(NSString*)type selectAction:(void(^)(NSString* selectItem))selectAction{
    
    // type 1 金额键盘；2 tel键盘
    
   //271高度的键盘
    
    self.titleArray =[ @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@".",@"0",@"delete"]mutableCopy];
    
    CGFloat viewWidth =  [[UIScreen mainScreen] bounds].size.width;
    CGFloat viewHeight = [[UIScreen mainScreen] bounds].size.height;
    CGFloat itemWidth = viewWidth/3;
    CGFloat itemHeight = keyBoardHeigth/4;

    
    CGFloat itemOriginX = 0;
    NSInteger index=0;
    for (int i=0; i<4; i++) {
        CGFloat tempItemY = i*itemHeight;
        for (int j=0; j<3; j++) {
            UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
            itemOriginX =j*itemWidth;
            [button setFrame:CGRectMake(itemOriginX, tempItemY, itemWidth, itemHeight)];
            [button setTag:index];
            if(index==9&&[type isEqualToString:@"2"]){
              self.titleArray[index]= @"";//
            }
            [button setTitle:self.titleArray[index] forState:UIControlStateNormal];
            button.layer.borderWidth = 1.0f;
            button.layer.borderColor = [UIColor whiteColor].CGColor;
            [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:button];
            index++;
        }
    }
    self.selectAction = selectAction;//点击事件
    [self setBackgroundColor:[UIColor grayColor]];
    [view addSubview:self];
    self.frame = CGRectMake(0, viewHeight, viewWidth, keyBoardHeigth);
    [UIView animateWithDuration:animationIntervel animations:^{
        self.frame = CGRectMake(0, viewHeight-keyBoardHeigth, viewWidth, keyBoardHeigth);
    }];
    
}

-(void)clickButton:(UIButton*)button{
   
    self.selectAction(self.titleArray[button.tag]);
}

-(void)hiddenKeyBoard{
    if(self){
        
        [UIView animateWithDuration:animationIntervel animations:^{
            CGRect tempFrame = self.frame;
            tempFrame.origin.y=[[UIScreen mainScreen] bounds].size.height ;
            self.frame = tempFrame;
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
        
    }
}

@end
