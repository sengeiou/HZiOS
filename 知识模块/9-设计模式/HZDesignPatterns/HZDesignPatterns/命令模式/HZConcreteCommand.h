//
//  HZConcreteCommand.h
//  HZDesignPatterns
//
//  Created by apple on 16/12/6.
//  Copyright © 2016年 DF. All rights reserved.
//

#import "HZCommand.h"
@class HZReceiver;
@interface HZConcreteCommand : HZCommand
-(instancetype)initwithReceiver:(HZReceiver*)receiver;
@end
