//
//  HZLightPersonModel.h
//  HZUIKIT
//
//  Created by apple on 16/9/10.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HZLightPersonModel : NSObject
@property(nonatomic,copy)NSString* name;
@property(nonatomic,copy)NSString* address;

+(NSArray*)requestPersonModelList;
@end
