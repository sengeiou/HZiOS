//
//  HZInvoker.h
//  HZDesignPatterns
//
//  Created by apple on 16/12/6.
//  Copyright © 2016年 DF. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HZCommand;
@interface HZInvoker : NSObject
-(instancetype)initWithCommand:(HZCommand*)command;
-(void)call;
@end
