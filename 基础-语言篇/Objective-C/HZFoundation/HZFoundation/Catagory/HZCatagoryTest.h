//
//  HZCatagoryTest.h
//  HZFoundation
//
//  Created by apple on 16/12/7.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^CallBackBlock)();
@interface HZCatagoryTest : NSObject
@property(nonatomic,copy)CallBackBlock callBackBlock;

-(void)someLogicMethod;
@end
