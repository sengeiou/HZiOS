//
//  HZPredicate.m
//  HZFoundation
//
//  Created by apple on 16/10/9.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import "HZPredicate.h"

@implementation HZPredicate

-(instancetype)initWithName:(NSString*)name sex:(NSString*)sex address:(NSString*)address{
    self = [super init];
    if (self) {
        _name = name;
        _sex = sex;
        _address = address;
    }
    return self;
}

-(void)testMethod{
    NSMutableArray* mutableArray = [NSMutableArray array];
    HZPredicate* p1 = [[HZPredicate alloc] initWithName:@"1" sex:@"man" address:@"一"];
    HZPredicate* p2 = [[HZPredicate alloc] initWithName:@"2" sex:@"woman" address:@"二"];
    HZPredicate* p3 = [[HZPredicate alloc] initWithName:@"3" sex:@"man" address:@"三"];
    HZPredicate* p4 = [[HZPredicate alloc] initWithName:@"4" sex:@"woman" address:@"四"];
    [mutableArray addObjectsFromArray:@[p1,p2,p3,p4]];
    
    NSPredicate* pre = [NSPredicate predicateWithFormat:@"name = %@ && sex = %@ && address = %@ ",@"1",@"man",@"一"];
    for(HZPredicate* p in mutableArray){
        if ([pre evaluateWithObject:p]) {
            NSLog(@"name:%@----sex:%@-----address%@",p.name,p.sex,p.address);
            break;
        }
    }

}

+(BOOL)regexMathPassWord:(NSString*)password{
   NSString* passWordRegex = @"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,12}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", passWordRegex];
    return   [predicate evaluateWithObject:password];
}

+(BOOL)validatePhoneNumber:(NSString*)phoneNumber{
    NSString* regex = @"^(1[3456789])\\d{9}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return   [predicate evaluateWithObject:phoneNumber];
}

+(NSString *)getRandomStringWithNum:(NSInteger)num{
    NSString *string = [[NSString alloc]init];
    for (int i = 0; i < num; i++) {
        int number = arc4random() % 36;
        if (number < 10) {
            int figure = arc4random() % 10;
            NSString *tempString = [NSString stringWithFormat:@"%d", figure];
            string = [string stringByAppendingString:tempString];
        }else {
            int figure = (arc4random() % 26) + 97;
            char character = figure;
            NSString *tempString = [NSString stringWithFormat:@"%c", character];
            string = [string stringByAppendingString:tempString];
        }
    }
    return string;
}
@end
