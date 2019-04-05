//
//  HZRequestPositionAPI.h
//  HZThreeParty
//
//  Created by KB on 2018/7/4.
//  Copyright © 2018年 HZ. All rights reserved.
//

#import <YTKNetwork/YTKNetwork.h>

@interface HZRequestPositionAPI : YTKRequest
@property(nonatomic,copy)NSString* ak;
@property(nonatomic,copy)NSString* coor;
@property(nonatomic,copy)NSString* mcode;

-(instancetype)initWithAK:(NSString*)ak coor:(NSString*)coor mcode:(NSString*)mcode;
@end
