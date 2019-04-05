//
//  HZBall.h
//  HZFoundation
//
//  Created by KB on 2018/7/24.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HZBall : NSObject
-(HZBall *(^)())up;
-(HZBall *(^)())down;
-(HZBall *(^)())left;
-(HZBall *(^)())right;
-(HZBall *(^)(NSString *sth))doSomething;
@end
