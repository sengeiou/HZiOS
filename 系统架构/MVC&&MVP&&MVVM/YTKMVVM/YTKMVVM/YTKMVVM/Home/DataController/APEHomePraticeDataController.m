//
//  APEHomePraticeDataController.m
//  YTKMVVM
//
//  Created by 华天杰 on 2017/4/17.
//  Copyright © 2017年 HZ. All rights reserved.
//

#import "APEHomePraticeDataController.h"

#import "APESubjectDataController.h"

@interface APEHomePraticeDataController()
@property(nonatomic,strong)APESubjectDataController *subjectDataController;

@end
@implementation APEHomePraticeDataController

-(void)requestSubjectDataWithCallback:(APECompletionCallback)callback{
    APEDataCallback dataCallBack = ^(NSError* error,id data){
        callback(error);
    };
    [self.subjectDataController requestAllSubjectsWithCallback:dataCallBack];
    [self.subjectDataController requestUserSubjectsWithCallback:dataCallBack];
}

- (nonnull NSArray *)openSubjects {
    return @[];
    //return self.subjectDataController.openSubjectsWithCurrentPhase ?: @[];
}
@end
