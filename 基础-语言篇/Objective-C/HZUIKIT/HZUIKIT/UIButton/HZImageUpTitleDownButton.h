//
//  HZImageUpTitleDownButton.h
//
//  Created by apple on 15/1/15.
//  Copyright (c) 2015年 DAFY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HZImageUpTitleDownButton : UIButton
/**
 *  创建stateNormal状态下的button
 *
 *  @param title        title
 *  @param tintColor    tintColor
 *  @param image        imageName
 */
-(void)initWithTitle:(NSString*)title tintColor:(UIColor*)tintColor image:(NSString*)image fontSize:(CGFloat)fontSize;
@end
