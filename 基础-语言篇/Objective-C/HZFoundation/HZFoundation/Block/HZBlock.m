//
//  HZBlock.m
//  HZFoundation
//
//  Created by dafy on 16/8/16.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import "HZBlock.h"
// 声明类型
typedef void (^TestBlock)(NSString* message);

@interface HZBlock()
@property(nonatomic,copy)TestBlock testBlock;
@property(nonatomic,copy)NSString* name;
@end
@implementation HZBlock

-(void)testBlcok{
//    
//    {
//        /*
//         以下代码会造成循环引用
//         解决方案： __weak NSString *tempName = _name;
//         在block中使用tempName变量
//         */
//        
//        _testBlock = ^(NSString*message){
//            NSString *lastStr = [NSString stringWithFormat:@"%@%@",_name,message];
//            NSLog(@"%@",lastStr);
//        };
//    
//    }
//    
//    
//    
//    {
//        
//        
//    }
//    
//    
//    
//    
//    
//    // weakSelf :避免self的强循环引用
//    __weak typeof(self) weakSelf = self;
//    self.testBlock = ^(NSString* message){
////        strongSelf:避免weakSelf为nil的情况?????
//        __strong typeof(weakSelf)strongSelf = weakSelf;
//        NSString* nameNew = strongSelf.name;
//        NSLog(@"%@",nameNew);
//      //  Capturing 'self' strongly in this block is likely to lead to a retain cycle
//    };
    
    //1 blocks:带有自动变量的匿名函数
    //2 blocks：提供了OC或是C++生成对象或实例来保存变量值的方法
    //3 Block语法
    /*
     和C语言函数不同之处
     1> 没有函数名
     2>带有 ^
     ^ 返回值 参数列表 表达式
     */
    //        void(^myBlock)(int a)=^(int a){
    //            NSLog(@"%d",a);
    //        };
    //        myBlock(1);
    //
    //        //4 blcok 类型变量
    //        typedef int(^blk_t)(int);
    //        blk_t blk = ^(int count){return count+1;};
    //
    //        //5 截获自动变量值
    //        int testVar = 10;
    //        blk_t blk1 = ^(int var){return var +testVar;};
    //        testVar = 20;
    //        blk1(10);// 返回的结果是20而不是30
    //
    //        /*
    //         6 __block 说明符；自动变量被截获之后不能被再次的修改
    //         附有__block 说明符的变量可以在Block做赋值操作
    //         */
    //        __block int val = 2;
    //        void (^myBlock1)(void)= ^{
    //            val=1;
    //        };
    
    /*
     7 blcok 导致的循环引用问题
     1> 当在block中使用self对象，同时block作为self对象的一个强引用实例，此时就形成一个
     闭环强引用
     2> 打破这种循环引用的方法是 在block中使用 __weak XXClass*WeakSelf = self;在block中使用
     weakSelf ；但为了保证self不被过早释放一般在block中 会使用__strongXXClass*strongSelf = weakself;
     保证程序正常
     */
    
    // 8 全局块、栈块及堆块
    // 1> 下列写法 block分配在栈上，超过作用域会被释放载调用stackBlock会引发异常
    //        BOOL isConditionOk = NO;
    //        void (^stackBlock)();
    //        if (isConditionOk) {
    //            stackBlock = ^{
    //                NSLog(@"if");
    //            };
    //        }else{
    //            stackBlock = ^{
    //                NSLog(@"else");
    //            };
    //        }
    //        stackBlock();
    
    // 解决上述问题需要 将栈上的block copy到堆上
    /*
     if (isConditionOk) {
     stackBlock = [^{
     NSLog(@"if");
     }copy];
     }else{
     stackBlock = [^{
     NSLog(@"else");
     } copy];
     }
     
     */
    /*
     4 使用handler块降低代码分散程度
     1> 使用代理委托的方式在处理多个异步请求时回调需要区分请求对象，使得代码比较繁琐
     2> 使用block方式处理异步请求会将请求和回调的业务处理整合在一起；
     3> 使用blcok处理异步请求时可以将成功和失败情况放在一个handler中，这样便于业务处理；
     在发生错误时可以将获取的数据一并处理
     */
}

/*
   (1) id 类型
  typedef struct objc_object{
    Class isa;
  } *id; 
 
   (2) Class 类型  
   struct objc_class{
    Class isa;
 };
 */

@end
