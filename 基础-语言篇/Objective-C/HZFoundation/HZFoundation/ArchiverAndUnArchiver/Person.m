//
//  Person.m
//  ArchiverAndUnArchiver
//
//  Created by apple on 16/5/23.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import "Person.h"

@implementation Person

-(void)encodeWithCoder:(NSCoder*)aCoder{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeInteger:self.age forKey:@"age"];
    [aCoder encodeObject:self.gender forKey:@"gender"];
}

-(instancetype)initWithCoder:(NSCoder*)aDecoder{
    self = [super init];
    if (self) {
        self.name  = [aDecoder decodeObjectForKey:@"name"];
        self.age   = [aDecoder decodeIntegerForKey:@"age"];
        self.gender= [aDecoder decodeObjectForKey:@"gender"];
    }
    return  self;
}
@end
