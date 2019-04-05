//
//  HZPersonModel.m
//  HZFoundation
//
//  Created by apple on 17/3/14.
//  Copyright © 2017年 HZ. All rights reserved.
//

#import "HZPersonModel.h"
#import <objc/objc-runtime.h>
static NSMutableDictionary* personPropertyMap;
@implementation HZPersonModel
+(void)load{
    personPropertyMap = [NSMutableDictionary dictionary];
    personPropertyMap[@"name1"]   = @"name";
    personPropertyMap[@"name2"]   = @"name";
    
    personPropertyMap[@"status1"]   = @"status";
    personPropertyMap[@"status2"]   = @"status";
}

-(instancetype)initPersonWithDictionary:(NSDictionary*)dictionary{
    if([super init]){
        [dictionary enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            NSString* propertyKey = [personPropertyMap objectForKey:key];
            if (propertyKey) {
                objc_property_t property = class_getProperty([self class], [propertyKey UTF8String]);
                // TODO: 针对特殊数据类型做处理
               // NSString *attributeString = [NSString stringWithCString:property_getAttributes(property) encoding:NSUTF8StringEncoding];
                
                [self setValue:obj forKey:propertyKey];
            }
        }];
    }
    return self;
}
@end
