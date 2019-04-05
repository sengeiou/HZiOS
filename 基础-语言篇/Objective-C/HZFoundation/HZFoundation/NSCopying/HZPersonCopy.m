//
//  HZPersonCopy.m
//  HZFoundation
//
//  Created by apple on 16/12/7.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import "HZPersonCopy.h"

@interface HZPersonCopy ()
@property(nonatomic,copy)NSArray* array;
@end

@implementation HZPersonCopy
@synthesize thing;

-(NSString*)name{
    return name;
}

-(void)setName:(NSString *)newName{
    name = newName;
}

-(void)test{
    self.array = @[@"1",@"2"];
    NSMutableArray* mutableArray =[@[@"1",@"2",@"3"] mutableCopy];
    self.array = mutableArray;
    NSLog(@"--->:%@",self.array[2]);
    [mutableArray removeLastObject];
    NSLog(@"--->:%@",self.array[2]);
}


-(id)copyWithZone:(NSZone *)zone{
      HZPersonCopy* newPerson =   [[HZPersonCopy alloc] copyWithZone:zone];
      newPerson.name = name;
      return newPerson;
}


@end
