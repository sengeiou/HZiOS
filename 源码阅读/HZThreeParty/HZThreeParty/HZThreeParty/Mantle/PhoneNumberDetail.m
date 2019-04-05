//
//  PhoneNumberDetail.m
//  Mantle_Demo
//
//  Created by apple on 15/12/22.
//  Copyright © 2015年 HTJ. All rights reserved.
//

#import "PhoneNumberDetail.h"

@implementation PhoneNumberDetail
/*
 "retData": {
 "phone": "15210011578",
 "prefix": "1521001",
 "supplier": "移动 ",
 "province": "北京 ",
 "city": "北京 ",
 "suit": "152卡"
 }
 */

+(NSDictionary *)JSONKeyPathsByPropertyKey{
    return @{
             @"Phone":@"phone",
             @"Prefix":@"prefix",
             @"Supplier":@"supplier",
             @"Phone":@"phone",
             @"Province":@"province",
             @"City":@"city",
             @"Suit":@"suit",
             };
}

// 数据类型不匹配时做相应地转化（必须进行数据转化不然获取的对象为空值）
// 方法命名规则是：+属性名JSONTransformer

// 1 NSNumber转化为NSString
+(NSValueTransformer*)PhoneJSONTransformer{
    return [MTLValueTransformer transformerUsingForwardBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
        return @([value integerValue]); // Model转JSON
    } reverseBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
        return [value stringValue];    //  JSON转Model
    }];
}
+(NSValueTransformer*)PrefixJSONTransformer{
    return [MTLValueTransformer transformerUsingForwardBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
        return @([value integerValue]);
    } reverseBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
        return [value stringValue];
    }];
}

// 2  url类型的转换
+ (NSValueTransformer *)urlJSONTransformer{
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

// 3  bool类型的转换
+ (NSValueTransformer *)isVipJSONTransformer{
    return [NSValueTransformer valueTransformerForName:MTLBooleanValueTransformerName];
}

//4 这里模拟的是服务端返回空的某字段对应的值，运行的结果当然是crash，
//   Mantle也为这种情况提供了解决办法，实现Mantle内部会把值转换为nil，
//   然后需要我们去实现
-(void)setNilValueForKey:(NSString *)key{
    
}
@end
