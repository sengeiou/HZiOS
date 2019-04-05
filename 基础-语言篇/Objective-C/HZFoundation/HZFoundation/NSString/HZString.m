//
//  HZString.m
//  HZFoundation
//
//  Created by dafy on 16/8/15.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import "HZString.h"

// 使用宏定义枚举类型
typedef NS_ENUM(NSInteger,HTTPMethod){
    GET,
    POST,
    DELETE
};

// 定义一个全局常量；如果使用static修饰则不能在文件外访问
 const NSString* hzString = @"hzString";

// 定义一个不想被修改的常量
NSString * const kNotificationName = @"keyBoardNotification";

/*
  （1）为什么 NSString 类型成员变量的修饰属性用 copy 而不是 strong？
   NSString 使用copy定义属性B的特性原因是为了避免被子类NSMutableString类型的变量A赋值后，A的值发生了变化后导致B的值也被修改；这样可能会导致程序的异常；
  （2）NSMutableString的属性特性使用strong还是copy？
   使用strong
 */

static NSMutableArray*  backupURLS;

@implementation HZString

- (void)testMethod {
    #pragma mark - NSString
    NSString* k_name = [NSString stringWithFormat:@"%@",@"HZiOS"];
    NSLog(@"(1)%@---%p",k_name,k_name);
    NSString* another_name = [k_name copy];
    NSLog(@"(2)%@---%p",another_name,another_name);
    #pragma mark - NSMutableString
    NSMutableString* kmutable_name = [NSMutableString stringWithFormat:@"%@",@"HZiOSmutable"];
    NSLog(@"(3)%@---%p",kmutable_name,kmutable_name);
    NSString* other_name = [kmutable_name copy];
    NSLog(@"(4)%@---%p",other_name,other_name);
    /*
     // 不可变对象接收到copy，正常是要创建新的对象，但是创建一个新的不可变对象是对内存的浪费，基于优化内存的
     // 考虑就不需要创建新的对象了
     (1)HZiOS---0x534f695a4855
     (2)HZiOS---0x534f695a4855
     // 可变对象接收到copy消息，得到的是不可变对象与原有对象有本质区别，所以得到的是新对象
     (3)HZiOSmutable---0x100207120
     (4)HZiOSmutable---0x100700110
     */
    NSString* testName = @"testName";
}

-(void)testCopyStr{
    #pragma mark - copy属性
    NSString* k_name = [NSString stringWithFormat:@"%@",@"HZiOS"];
    NSLog(@"%@---%p",k_name,k_name);
    self.name = k_name;
    NSLog(@"%@---%p",self.name,self.name);
    k_name = [NSString stringWithFormat:@"%@",@"anotherStr"];
    NSLog(@"%@---%p",k_name,k_name);
    NSLog(@"%@---%p",self.name,self.name);
    
    #pragma mark - test copy and mutableCopy
    self.name = [k_name copy];
    NSLog(@"%@---%p",self.name,self.name);
    self.name = [k_name mutableCopy];
    NSLog(@"%@---%p",self.name,self.name);
    NSLog(@"----------------------------------");

    /*
     2016-08-15 10:29:32.199 HZFoundation[22481:1297106] HZiOS---0x534f695a4855
     2016-08-15 10:29:32.199 HZFoundation[22481:1297106] HZiOS---0x534f695a4855
     2016-08-15 10:29:32.199 HZFoundation[22481:1297106] anotherStr---0x10b192a02d085a5
     2016-08-15 10:29:32.199 HZFoundation[22481:1297106] HZiOS---0x534f695a4855
     2016-08-15 10:29:32.200 HZFoundation[22481:1297106] anotherStr---0x10b192a02d085a5
     2016-08-15 10:29:32.200 HZFoundation[22481:1297106] anotherStr---0x10b192a02d085a5
     */
}

-(void)testCopyMutableStr{
#pragma mark - copy属性
    NSMutableString* k_name = [NSMutableString stringWithFormat:@"%@",@"HZiOS"];
    NSLog(@"%@---%p",k_name,k_name);
    self.name = k_name;
    NSLog(@"%@---%p",self.name,self.name);
    [k_name appendString:@"addStr"];
    NSLog(@"%@---%p",k_name,k_name);
    NSLog(@"%@---%p",self.name,self.name);
    
#pragma mark - test copy and mutableCopy
    self.name = [k_name copy];
    NSLog(@"%@---%p",self.name,self.name);
    self.name = [k_name mutableCopy];
    NSLog(@"%@---%p",self.name,self.name);
    NSLog(@"----------------------------------");
    
    /*
     2016-08-15 10:48:12.607 HZFoundation[22651:1372886] HZiOS---0x100600350
     2016-08-15 10:48:12.608 HZFoundation[22651:1372886] HZiOS---0x534f695a4855
     2016-08-15 10:48:12.608 HZFoundation[22651:1372886] HZiOSaddStr---0x100600350
     2016-08-15 10:48:12.608 HZFoundation[22651:1372886] HZiOS---0x534f695a4855
     2016-08-15 10:48:12.608 HZFoundation[22651:1372886] HZiOSaddStr---0x1006008d0
     2016-08-15 10:48:12.608 HZFoundation[22651:1372886] HZiOSaddStr---0x100600ab0
     */
}

-(void)testStrongStr{
#pragma mark - strong属性
    NSString* k_name = [NSString stringWithFormat:@"%@",@"HZiOS1"];
    NSLog(@"%@---%p",k_name,k_name);
    self.anotherName = k_name;
    NSLog(@"%@---%p",self.anotherName,self.anotherName);
    k_name = [NSString stringWithFormat:@"%@",@"anotherStr1"];
    NSLog(@"%@---%p",k_name,k_name);
    NSLog(@"%@---%p",self.anotherName,self.anotherName);
    
#pragma mark - test copy and mutableCopy
    self.anotherName = [k_name copy];
    NSLog(@"%@---%p",self.anotherName,self.anotherName);
    self.anotherName = [k_name mutableCopy];
    NSLog(@"%@---%p",self.anotherName,self.anotherName);
    
    /*
     2016-08-15 10:47:43.330 HZFoundation[22634:1368607] HZiOS1---0x1002036a0
     2016-08-15 10:47:43.331 HZFoundation[22634:1368607] HZiOS1---0x1002036a0
     2016-08-15 10:47:43.331 HZFoundation[22634:1368607] HZiOS1addStr---0x1002036a0
     2016-08-15 10:47:43.331 HZFoundation[22634:1368607] HZiOS1addStr---0x1002036a0
     2016-08-15 10:47:43.331 HZFoundation[22634:1368607] HZiOS1addStr---0x1001029b0
     2016-08-15 10:47:43.331 HZFoundation[22634:1368607] HZiOS1addStr---0x100700150
     */
}


-(void)testStrongMutableStr{
    #pragma mark - strong属性
    NSMutableString* k_name = [NSMutableString stringWithFormat:@"%@",@"HZiOS1"];
    NSLog(@"%@---%p",k_name,k_name);
    self.anotherName = k_name;
    NSLog(@"%@---%p",self.anotherName,self.anotherName);
    [k_name appendString:@"addStr"];
    NSLog(@"%@---%p",k_name,k_name);
    NSLog(@"%@---%p",self.anotherName,self.anotherName);
    
    #pragma mark - test copy and mutableCopy
    self.anotherName = [k_name copy];
    NSLog(@"%@---%p",self.anotherName,self.anotherName);
    self.anotherName = [k_name mutableCopy];
    NSLog(@"%@---%p",self.anotherName,self.anotherName);
    
    /*
     2016-08-15 10:46:07.527 HZFoundation[22596:1359740] HZiOS1---0x100102710
     2016-08-15 10:46:07.528 HZFoundation[22596:1359740] HZiOS1---0x100102710
     2016-08-15 10:46:07.528 HZFoundation[22596:1359740] anotherStr1---0x1005014c0
     2016-08-15 10:46:07.528 HZFoundation[22596:1359740] HZiOS1---0x100102710
     2016-08-15 10:46:07.528 HZFoundation[22596:1359740] anotherStr1---0x216325405a10beb5
     2016-08-15 10:46:07.528 HZFoundation[22596:1359740] anotherStr1---0x1001033e0
     */
}

-(void)reuqestServalWithURL:(NSString*)url{
    backupURLS = [[self.localBackUpURLS objectForKey:url] mutableCopy];
    if (backupURLS.count>0) {
        NSString* newURL = [backupURLS firstObject];
       dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
           NSLog(@"%@---尝试请求",newURL);
           [backupURLS removeObject:newURL];
           [self  refreshWithURL:url];
       });
    }else{
        NSLog(@"%@----------failed",url);
    }
}

-(void)refreshWithURL:(NSString*)url{
    [NSThread sleepForTimeInterval:1.0f];
    [self reuqestServalWithURL:url];
}

-(void)testFunc{
    NSString *string1 = @"hello";
    NSString *string2 = [NSString alloc];
    NSString *string3 = [string2 initWithString:string1];
    if (string2 != string3) {
        NSLog(@"string2 are  not the same to string3"); // string2已经开辟了内存区域
    }
    if (string1 == string3) {
        NSLog(@"string1 are the same to string3");//编译器检测string3为不可变对象，同时使用的是字面量复制，没有必要再开辟内存空间
    }
    // 常量字符串保存的位置不在堆和栈中
}

@end
