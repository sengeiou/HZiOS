//
//  HZQueryPhoneNumberBelongToApi.h
//  HZThreeParty
//
//  Created by apple on 16/12/9.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import <YTKNetwork/YTKNetwork.h>

@interface HZQueryPhoneNumberBelongToApi : YTKRequest
-(instancetype)initWithTel:(NSString*)tel;
@end
