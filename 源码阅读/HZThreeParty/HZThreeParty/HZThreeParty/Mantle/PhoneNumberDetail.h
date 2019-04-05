//
//  PhoneNumberDetail.h
//  Mantle_Demo
//
//  Created by apple on 15/12/22.
//  Copyright © 2015年 HTJ. All rights reserved.
//

#import <Mantle.h>
@interface PhoneNumberDetail : MTLModel<MTLJSONSerializing>
@property(nonatomic,strong)NSNumber* Phone;
@property(nonatomic,strong)NSNumber* Prefix;
@property(nonatomic,copy)NSString* Supplier;
@property(nonatomic,copy)NSString* Province;
@property(nonatomic,copy)NSString* City;
@property(nonatomic,copy)NSString* Suit;
@end
