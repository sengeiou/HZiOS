//
//  APESubject.h
//  YTKMVVM
//
//  Created by 华天杰 on 2017/4/17.
//  Copyright © 2017年 HZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APESubject : NSObject
@property(nonatomic,strong)NSNumber *idSubject;
@property(nonatomic,copy)NSString *name;
@end


typedef NS_ENUM(NSInteger,APEUserSubjectStatus){
    on,
    off
};

@interface APEUserSubject : NSObject
@property(nonatomic,strong)NSNumber *idSubject;
@property(nonatomic,strong)NSNumber *updateTime;

///  On or Off
@property (nonatomic) APEUserSubjectStatus status;
@end
