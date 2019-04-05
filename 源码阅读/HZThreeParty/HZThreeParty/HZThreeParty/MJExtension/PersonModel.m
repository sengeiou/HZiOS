//
//  PersonModel.m
//  HZThreeParty
//
//  Created by 华天杰 on 2018/10/15.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import "PersonModel.h"
#import <MJExtension.h>
@implementation PersonModel

//
+ (NSDictionary *)mj_objectClassInArray{
    return @{@"studentArray":@"StudentModel"}; // 前边，是属性数组的名字，后边就是类名
}

// 替换返回字段的key为自定义key
+(NSDictionary*)mj_replacedKeyFromPropertyName{
    return @{
             @"userID" : @"id"
             };
}

// 对指定返回key的值做二次加工操作
-(id)mj_newValueFromOldValue:(id)oldValue property:(MJProperty *)property{
    if ([property.name isEqualToString:@"birthday"]) {
        if (oldValue) {
            // 格式化时间
            NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
            [formatter setDateStyle:NSDateFormatterMediumStyle];
            [formatter setTimeStyle:NSDateFormatterShortStyle];
            [formatter setDateFormat:@"yyyy年MM月dd日 HH:mm"];
            NSDate* date = [NSDate dateWithTimeIntervalSince1970:[oldValue doubleValue]];
            NSString* dateString = [formatter stringFromDate:date];
            return dateString;
        }
    }else {
        return @"日期有误";
    }
    return oldValue;
}
@end
