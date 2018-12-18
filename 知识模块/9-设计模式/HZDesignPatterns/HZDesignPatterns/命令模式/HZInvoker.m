//
//  HZInvoker.m
//  HZDesignPatterns
//
//  Created by apple on 16/12/6.
//  Copyright © 2016年 DF. All rights reserved.
//

#import "HZInvoker.h"
#import "HZCommand.h"
@interface HZInvoker()
@property(nonatomic,strong)HZCommand* command;
@end

@implementation HZInvoker
- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(instancetype)initWithCommand:(HZCommand*)command{
    _command = command;
    return [self init];
}
-(void)call{
    [_command excute];
}
@end
