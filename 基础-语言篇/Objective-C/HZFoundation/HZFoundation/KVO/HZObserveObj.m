//
//  HZObserveObj.m
//  HZFoundation
//
//  Created by 华天杰 on 2018/7/8.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "HZObserveObj.h"
#import "HZMObject.h"

@implementation HZObserveObj
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
    if ([object isKindOfClass:[HZMObject class]] && [keyPath isEqualToString:@"value"]) {
        NSNumber * num = [change objectForKey:NSKeyValueChangeNewKey];
        NSLog(@"value = %@",num);
    }
}
@end
