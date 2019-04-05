//
//  ECOPerson.h
//  Effective-ObjC
//
//  Created by apple on 16/2/15.
//  Copyright © 2016年 HTJ. All rights reserved.
/*
    自定义的类支持拷贝
 */

#import <Foundation/Foundation.h>

@interface ECOPerson : NSObject<NSCopying>

@property(nonatomic,copy,readonly)NSString* firstName;
@property(nonatomic,copy,readonly)NSString* lastName;

-(instancetype)initWithFristName:(NSString*)fristName
                     andLastName:(NSString*)lastName;

@end

// 分类
@interface ECOPerson (FriendsShip)
-(void)addFriends:(ECOPerson*)person;
-(void)removeFriends:(ECOPerson*)person;
@end

@interface ECOPerson (Play)
- (void)goToTheCinema;
- (void)goToSportsGame;
@end
