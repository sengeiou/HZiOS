//
//  NSThreadProperty.h
//  Effective-ObjC
//
//  Created by apple on 16/2/16.
//  Copyright © 2016年 HTJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSThreadProperty : NSObject
@property(nonatomic,copy)NSString* someString;

@property(nonatomic,copy)NSString* otherString;
@end
