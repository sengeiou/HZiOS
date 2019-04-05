//
//  Property.m
//  Effective-ObjC
//
//  Created by apple on 16/2/13.
//  Copyright © 2016年 HTJ. All rights reserved.
//

#import "Property.h"

@implementation Property

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(instancetype)initWithFristName:(NSString *)firstName lastName:(NSString *)lastName{
    self = [super init];
    if (self) {
        _fristName = [firstName copy];
        _lastName = [lastName copy]; //
    }
    return self;
}
@end
