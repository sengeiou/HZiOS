//
//  HZTestHTTPRequest.h
//  HZThreeParty
//
//  Created by apple on 17/3/23.
//  Copyright © 2017年 HZ. All rights reserved.
//

#import "HZBaseHTTPRequest.h"

@interface HZTestHTTPRequest : HZBaseHTTPRequest
@property(nonatomic,copy)NSString* ak;
@property(nonatomic,copy)NSString* coor;
@property(nonatomic,copy)NSString* mcode;

-(instancetype)initWithAK:(NSString*)ak coor:(NSString*)coor mcode:(NSString*)mcode;
@end
