//
//  HZButton.m
//  HZUIKIT
//
//  Created by dafy on 16/8/18.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import "HZButton.h"

#import <objc/runtime.h>

@implementation HZButton

+(void)load{
    NSLog(@"HZButton 类文件加载！！！");
}

+(void)initialize{
    NSLog(@"initialize!!!");
}

-(void)sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event{
    if (!self.isDelayClick) {
        [super sendAction:action to:target forEvent:event];
        self.isDelayClick = !self.isDelayClick;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.isDelayClick = !self.isDelayClick;
        });
    }else{
        return;
    }
}

@end

@implementation HZButton(add)
- (void)testButton{
  
}
@end
