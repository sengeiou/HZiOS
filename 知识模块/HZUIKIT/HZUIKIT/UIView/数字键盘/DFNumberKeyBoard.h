//
//  DFNumberKeyBoard.h
//  DFNumberKeyBoard
//
//  Created by apple on 16/5/24.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DFNumberKeyBoard : UIView

+(instancetype)shareInstance;
// 显示键盘
-(void)showKeyBoardOnView:(UIView*)view type:(NSString*)type selectAction:(void(^)(NSString* selectItem))selectAction;
// 收起键盘
-(void)hiddenKeyBoard;


@end
