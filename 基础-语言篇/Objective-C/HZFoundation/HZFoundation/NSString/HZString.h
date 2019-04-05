//
//  HZString.h
//  HZFoundation
//
//  Created by dafy on 16/8/15.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HZString : NSObject
@property(nonatomic,copy)NSString* name;
@property(nonatomic,strong)NSString* anotherName;
@property(nonatomic,strong)NSDictionary* localBackUpURLS;



-(void)reuqestServalWithURL:(NSString*)url;


-(void)testCopyStr;
-(void)testCopyMutableStr;

-(void)testStrongStr;
-(void)testStrongMutableStr;
@end
