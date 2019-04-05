//
//  HZObjProtocol.h
//  HZFoundation
//
//  Created by apple on 16/12/7.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ExampleProtocol <NSObject>

@required
// 协议中无法新增
@property(nonatomic,copy)NSString* exampleName;

@end

@interface HZObjProtocol : NSObject

@end
