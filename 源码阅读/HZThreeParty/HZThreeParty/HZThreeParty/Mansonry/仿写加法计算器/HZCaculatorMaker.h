//
//  HZCaculatorMaker.h
//  HZThreeParty
//
//  Created by KB on 2018/8/16.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HZCaculatorMaker : NSObject

@property(nonatomic, assign)int result;

-(HZCaculatorMaker *(^)(int))add;
-(HZCaculatorMaker *(^)(int))sub;
-(HZCaculatorMaker *(^)(int))multiply;
-(HZCaculatorMaker *(^)(int))divide;

@end
