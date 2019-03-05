//
//  HZLightPersonModel.m
//  HZUIKIT
//
//  Created by apple on 16/9/10.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import "HZLightPersonModel.h"

@implementation HZLightPersonModel
-(instancetype)initWithName:(NSString*)name  address:(NSString*)address{
    self=[super init];
    if (self) {
        self.name = name;
        self.address = address;
    }
    return self;
}

+(NSArray*)requestPersonModelList{
    NSMutableArray* personList = [NSMutableArray array];
    for (NSInteger index = 0; index<10; index++) {
        HZLightPersonModel* person = [[HZLightPersonModel alloc] initWithName:[NSString stringWithFormat:@"%ld",(long)index] address:[NSString stringWithFormat:@"%ld--北京",(long)index]];
        [personList addObject:person];
    }
    return [personList copy];
}
@end
