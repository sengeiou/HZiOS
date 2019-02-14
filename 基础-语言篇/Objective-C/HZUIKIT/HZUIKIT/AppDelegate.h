//
//  AppDelegate.h
//  HZUIKIT
//
//  Created by dafy on 16/8/7.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^BackgroundSessionCompletionHandler)(void);
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property(nonatomic,copy)BackgroundSessionCompletionHandler completionHandler;

@end

