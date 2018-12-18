//
//  HZConcreteCommand.m
//  HZDesignPatterns
//
//  Created by apple on 16/12/6.
//  Copyright © 2016年 DF. All rights reserved.
//

#import "HZConcreteCommand.h"
#import "HZReceiver.h"
@interface HZConcreteCommand()
@property(nonatomic,strong)HZReceiver* receiver;
@end
@implementation HZConcreteCommand

- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

-(instancetype)initwithReceiver:(HZReceiver*)receiver{
    _receiver = receiver;
    return [self init];
}

-(void)excute{
    [_receiver action];
}
@end
