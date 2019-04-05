//
//  HZRACFunctionViewController.m
//  HZThreeParty
//
//  Created by 华天杰 on 2018/11/12.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "HZRACFunctionViewController.h"
#import <ReactiveObjC.h>

@interface HZRACFunctionViewController ()
@property(nonatomic,strong)UITextField* textfiled;
@property(nonatomic,copy)NSString* textStr;
@end

@implementation HZRACFunctionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /*
       + push-driven : 推驱动
     
       + pull-driven : 拉驱动
     */
    
    RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        // Task1
        //需要执行的业务逻辑
        return [RACDisposable disposableWithBlock:^{
            
        }];
    }];
    // 如果信号量不订阅Task1是不会执行的；这种属于拉驱动
    [signal subscribeNext:^(id  _Nullable x) {
        
    }];
    
    // side effect : 副作用
    
    __block int a = 10;
    RACSignal *signal1 = [[RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        a+=5;
        [subscriber sendNext:@(a)];
        [subscriber sendCompleted];
        return [RACDisposable disposableWithBlock:^{
            
        }];
    }]replayLast] ;
    // 信号量两次订阅的时候会发生a的值被累加,解决方法：replayLast,让信号量中的block只执行一次
    [signal1 subscribeNext:^(id  _Nullable x) {
        NSLog(@"%ld",[x integerValue]);
    }];
    [signal1 subscribeNext:^(id  _Nullable x) {
        NSLog(@"%ld",[x integerValue]);
    }];
    
    // RACSequeue 继承自 RACStream
    
   // RACSequeue 与 signal的相互转换
    RACSequence *sequence = [signal1 sequence];
    [sequence signal];
    
    // RACSequence 与 NSArray的无缝转换
    NSArray *array = @[@(1),@(2)];
    RACSequence *seq = [array rac_sequence];
    [seq array];
    
    // 高阶函数 map（映射每一个值），filter(过滤)，faltternMap（整平），contact。。
    
   RACSequence *seq1 = [seq map:^id _Nullable(id  _Nullable value) {
        return @([value integerValue] * 3);
    }];
    NSLog(@"%@",[seq1 array]);
    
   RACSequence *seq2 =  [seq filter:^BOOL(id  _Nullable value) {
        return [value integerValue] %2 == 1;
    }];
    NSLog(@"%@",[seq2 array]);
    
    // faltternMap 整平 : [[1,2],[3,4]] ==> [1,2,3,4]
    
    // contact
    // 串行方法
    RACSignal *s1;
    RACSignal *s2;
    [[s1 concat:s2] subscribeNext:^(id  _Nullable x) {
        // x 此时返回的是 s1和s2的结果
    }];
}

- (void)uppercaseString{
    [[[@[@"i",@"like",@"you"] rac_sequence].signal map:^id _Nullable(id  _Nullable value) {
        return [value capitalizedString];
    }]subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@",x);
    }];
}

/*
 
   信号开关：（switch）
   +  信号比喻成水管 ，Switch可以理解为水龙头
   +  通过Switch可以控制哪个信号起作用，并且可以进行信号之间的切换
   +  或者可以理解Switch是另外一个水管，对接哪个水管，就流哪个水管的水
 
 */

-(void)signalSwitch{
    // 创建3个自定义信号
    RACSubject *google = [RACSubject subject];
    RACSubject *baidu = [RACSubject subject];
    RACSubject *signalOfSingal = [RACSubject subject];
    
    //获取开关信号
    RACSignal *switchSignal = [signalOfSingal switchToLatest];
    // 对通过开关的信号进行操作
    [[switchSignal map:^id _Nullable(id  _Nullable value) {
        return [NSString stringWithFormat:@"%@%@",@"https://www.",value];
    }]subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@",x);
    }];
    
    // 通过开关打开baidu
    [signalOfSingal sendNext:baidu];
    [baidu sendNext:@"baidu.com"];
    [google sendNext:@"google.com"];
}


/*
   信号的合并（combineLatest）
   + 两个水管的水合成一个水管的水，但限制条件是当两个水管的水都有值的时候才合并操作
   + 合并多个信号源最新的（最后一次）信号，它要求每个信号源至少发送一次信号
 */

- (void)combiningLatest{
    RACSubject *letters = [RACSubject subject];
    RACSubject *numbers = [RACSubject subject];
    
    [[RACSignal combineLatest:@[letters,numbers] reduce:^(NSString*letter,NSString*number){
        return [letter stringByAppendingString:number];
    }]subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@",x);
    }];
    
    // B1 C1 C2
    [letters sendNext:@"A"];
    [letters sendNext:@"B"];
    [numbers sendNext:@"1"];
    [letters sendNext:@"C"];
    [numbers sendNext:@"2"];
}

/*
    信号的合并（merge）
   + 将多个信号放入数组中，此时多个信号就为一个信号
 */

- (void)merge{
    RACSubject *letters = [RACSubject subject];
    RACSubject *numbers = [RACSubject subject];
    RACSubject *chinese = [RACSubject subject];
    
    [[RACSignal merge:@[letters,numbers,chinese]] subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@",x);
    }];
    
    [letters sendNext:@"123"];
    [numbers sendNext:@"456"];
    [chinese sendNext:@"789"];
}

/*
   信号的压缩（zip）操作
   + 多个信号可以被压缩成zip，压缩的各个信号源的数据被组装成一个元组tuple，
     而且压缩操作取的是每个信号源的第一次信号的发送
     其中某个信号源没发送或者发送多次都会失效
 */

-(void)zip{
    RACSubject *s1 = [RACSubject subject];
    RACSubject *s2 = [RACSubject subject];
    RACSubject *s3 = [RACSubject subject];
    
    [[RACSignal zip:@[s1,s2,s3]] subscribeNext:^(RACTuple * _Nullable x) {
        NSLog(@"%@",x);// (1,3,5)
    }];
    
    // 每个信号源至少要发送一次
    [s1 sendNext:@"1"];
    [s1 sendNext:@"2"];
    
    [s2 sendNext:@"3"];
    [s2 sendNext:@"4"];
    
    [s3 sendNext:@"5"];
    [s3 sendNext:@"6"];
}


/*
    信号的过滤功能
    distinctUntilChanged
 */
- (void)distinctUntilChanged{
    RACSubject *s1 = [RACSubject subject];
    [[s1 distinctUntilChanged] subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@",x);
    }];
    // sendNext执行两次，value一样，log只会输出一次
    [s1 sendNext:@"1"];
    [s1 sendNext:@"1"];
}

/*
   filter操作
   将原来的signal经过过滤转化变成只返回过滤纸的Signal
 */

-(void)filter{
    RACSubject *s1 = [RACSubject subject];
    [[s1 filter:^BOOL(id  _Nullable value) {
        return @([value length] > 2);
    }] subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@",x);
    }] ;
    
    [s1 sendNext:@"12"];
    [s1 sendNext:@"123"];// 满足value的长度大于3，订阅者才获取到值
}

/*
   ignore 忽略操作
 */
-(void)ignore{
    RACSubject *s1 = [RACSubject subject];
    [[s1 ignore:@"12"] subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@",x);
    }];
    
    [s1 sendNext:@"12"]; // 发送“12”被信号所忽略
    [s1 sendNext:@"123"];
}

/*
   take : take操作是从一开始取N次的值，
   skip : skip操作是从第N次开始取值
 
   takeUntilBlock操作
 */

-(void)takeAndSkip{
    // ----- take --------
    RACSubject *s1 = [RACSubject subject];
    [[s1 take:2] subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@",x);
    }];
    [s1 sendNext:@"1"];
    [s1 sendNext:@"2"];
    [s1 sendNext:@"3"];
    [s1 sendNext:@"4"];
    
    // ---- skip ---
    RACSubject *s2 = [RACSubject subject];
    [[s2 skip:2] subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@",x);
    }];
    [s2 sendNext:@"1"];
    [s2 sendNext:@"2"];
    [s2 sendNext:@"3"];
    [s2 sendNext:@"4"];
    
    [[s2 takeUntilBlock:^BOOL(id  _Nullable x) {
        return [x integerValue] == 2 ;
    }]subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@",x);
    }];
}


#pragma mark -- 双向绑定与RACChannel

/*
   单向绑定：发送者和信号的接收者之间单向进行
   双向绑定：
   leadingTerminal ----> followingTerminal
   leadingTerminal <---- followingTerminal 
 
 */

// 将 UISlider 与 UITextField 进行双向绑定
-(RACSignal*)bindSlider:(UISlider*)slider withTextfield:(UITextField*)textfiled{
    //当textfiled的值发生一次改变的时候获取一次信号量[仅仅需要获取一次]
    RACSignal *textSignal = [[textfiled rac_textSignal] take:1];
    
    // RACChannelTerminal 信号终端
    RACChannelTerminal *sliderSingal = [slider rac_newValueChannelWithNilValue:nil];
    RACChannelTerminal *textFiledSingal = [textfiled rac_newTextChannel];
    
    // 相互订阅
    [[sliderSingal map:^id _Nullable(id  _Nullable value) {
        return [NSString stringWithFormat:@"%.02f",[value floatValue]];
    }] subscribe:textFiledSingal];
    [textFiledSingal subscribe:sliderSingal];
    
    // 合并信号量
    return [[textFiledSingal merge:sliderSingal] merge:textSignal];
}

-(void)bindWithEachOther{
    
    /*
       RACChannel 的定义中有两个RACChannelTerminal分别是leadingTerminal和followingTerminal
       它就像一个水管，任何一端产生信号、另外一端都会收到相同的信号值
     
       + RACChannelTo_是一个基于RACKVOChannel的宏定义，
       + RACKVOChannel又是RACChannel的一个子类
       + RACChannel的一端与相关的keypath进行绑定(model端)，另一端followingTerminal暴露出来
     
     
         [UITextField rac_newTextChannel:]
         [UISwitch rac_newOnChannel:]
         [UISlider rac_newValueChannelWithNilValue:]
         [UISegmentedControl rac_newSelectedSegmentIndexChannelWithNilValue:]
         [UIDatePicker rac_newDateChannelWithNilValue:]
         [NSUserDefaults rac_channelTerminalForKey:]
     */
    
    RACChannelTo_(self.textfiled, text, @"123") = RACChannelTo_(self, textStr, @"456");
}

#pragma mark --- RACCommd

/*
   RACCommd: 处理事件或者action的执行（网络请求、点击等事件处理）
 */
- (void)raccommand_test{
    RACCommand * command = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        
        // input 是执行命令传进来的参数
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            // 在此进行网络请求，获取数据后，向订阅者发送
            NSString *result = [NSString stringWithFormat:@"服务端返回的数据：%@",input];
            [subscriber sendNext:result];
            [subscriber sendCompleted];
            return [RACDisposable disposableWithBlock:^{
                
            }];
        }];
    }];
    
    // 模拟网络传参
    RACSignal *signal = [command execute:@"text from server"];
    
    [signal.switchToLatest subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@",x); // 获取到网络请求的数据信息
    }];
}

@end
