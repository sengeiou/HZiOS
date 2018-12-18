//
//  main.m
//  HZDesignPatterns
//
//  Created by apple on 16/12/6.
//  Copyright © 2016年 DF. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "HZReceiver.h"
#import "HZInvoker.h"
#import "HZConcreteCommand.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        HZReceiver* receiver = [HZReceiver new];
        HZConcreteCommand* command = [[HZConcreteCommand alloc] initwithReceiver:receiver];
        HZInvoker* invoker = [[HZInvoker alloc] initWithCommand:command];
        [invoker call];
    }
    return 0;
}
