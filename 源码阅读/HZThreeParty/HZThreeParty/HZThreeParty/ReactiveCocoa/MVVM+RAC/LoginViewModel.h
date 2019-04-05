//
//  LoginViewModel.h
//  HZThreeParty
//
//  Created by 华天杰 on 2018/11/13.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC.h>

@interface LoginViewModel : NSObject
@property(nonatomic,copy)NSString* userName;
@property(nonatomic,copy)NSString* pwd;

@property(nonatomic,strong)RACSubject* successSignal;
@property(nonatomic,strong)RACSubject* failureSignal;
@property(nonatomic,strong)RACSubject* errorSignal;


-(void)login;
@end

