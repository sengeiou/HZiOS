//
//  HZBall.m
//  HZFoundation
//
//  Created by KB on 2018/7/24.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "HZBall.h"

@implementation HZBall
-(HZBall *(^)())up{
    return ^{
        NSLog(@"up!");
        return self;
    };
}

-(HZBall *(^)())down{
    return ^{
        NSLog(@"down!");
        return self;
    };
}

-(HZBall *(^)())left{
    return ^{
        NSLog(@"left!");
        return self;
    };
}

-(HZBall *(^)())right{
    return ^{
        NSLog(@"right!");
        return self;
    };
}

-(HZBall *(^)(NSString *sth))doSomething{
    return ^(NSString *sth){
        NSLog(@"doSomething!--%@",sth);
        return self;
    };
}
@end
