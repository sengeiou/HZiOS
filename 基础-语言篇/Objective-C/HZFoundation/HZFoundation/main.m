//
//  main.m
//  HZFoundation
//
//  Created by dafy on 16/8/9.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HZAES.h"

#import "HZPredicate.h"

#import "Car.h"

#import "HZMethod.h"

#import "HZKVO.h"
#import "HZThread.h"

#import "HZTimer.h"

#import "HZCatagoryTest.h"
#import "HZCatagoryTest+HUA.h"


  
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        [[HZCatagoryTest new] catagoryP];
        
       // HZTimer
        
     // NSThread 类测试
        //[[HZThread new] test1];

        
//        HZKVO * kvo = [HZKVO new];
//        [kvo test];
//
//
//        NSArray* array1 = [NSArray arrayWithObject:@"1"];
//        NSArray* array2 = [array1 copy];
//        NSMutableArray* array3 = [array1 mutableCopy];
//        NSLog(@"%p-----%p----%p",array1,array2,array3);
//
//        NSMutableArray* array4 = [NSMutableArray arrayWithObject:@"1"];
//        NSMutableArray* array5 =[array4 mutableCopy];
//        [array5 addObject:@"2"];
//        NSArray* array6 = [array4 copy];
//        NSLog(@"%p-----%p----%p",array4,array5,array6);
//
//
//        __block int a = 0;
//        void (^testBlcok)() =^(){
//            a = 2;
//        };
//
//        testBlcok();
//
//        NSLog(@"%d",a);
//
//        HZMethod* method = [[HZMethod alloc] init];
//        [method test];
    
//        Class carClassName = [car class];
//        NSLog(@"==>:%@",NSStringFromClass([Car class]));
//
//
//
//        if ([[car class] isEqual:[Car class]]) {
//            NSLog(@"car对象属于Car类");
//        }
//        if ([[Car superclass] isKindOfClass:[NSObject class]]) {
//            NSLog(@"Car类的父类是NSObject");
//        }
        
        
//        NSString* test = [HZPredicate getRandomStringWithNum:10];
//
//        NSInteger length = 10;
//        NSInteger num = (arc4random() %  (int)pow(10, length));
//        NSString* tempStr = [NSString stringWithFormat:@"%.10d", num];
//
//        NSDate* date = [NSDate dateWithTimeIntervalSinceNow:0];
//        NSTimeInterval time=[date timeIntervalSince1970]*1000;
//        NSString *timeString = [NSString stringWithFormat:@"%.5f", time];
//        NSInteger random = arc4random()% 1000000000;
//
//        NSString* key = @"www.uuqianbao.com/fo/test.html";
//        NSString* text = @"1234qwer中国!!";
//        NSString* encryptedStr = [HZAES encryptedStrWithInputText:text Key:key];
//        NSLog(@"====>:%@",encryptedStr);// cLB7UngCsWRdmW/bqsbdEAiv339sZACQkFzwAy9iTmQ=
//        NSString* dencryptedStr = [HZAES dencryptedStrWithInputText:@"aD1o3fQO0ryfC5T2Kv1Mrpw5kEcVWusgyQrpJ/tJFYg=" Key:key];
//        NSLog(@"====>:%@",dencryptedStr); // 1234qwer中国!!
//
//        NSString* testKey = @"D8eJscE7qcquNlHY";
//        NSString* testMessage = [HZAES dencryptedStrWithInputText:@"ohvkFOXOVT1e/dWbcMxnOtELlIfXs32rgW5TsoZSoNI6MIXKmrF06fpjDsDoKRXwFwsswpRwIOWO+PFuYSpGnbGi4Z/kxGDxi9wmpxEbCVY=" Key:testKey];
//        NSLog(@"%@",testMessage);

    }
    return 0;
}
