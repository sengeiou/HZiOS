//
//  HZMasonryModel.h
//  HZThreeParty
//
//  Created by apple on 16/12/15.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HZMasonryModel : NSObject
@property(nonatomic,copy)NSString* userImageUrl;
@property(nonatomic,copy)NSString* name;
@property(nonatomic,copy)NSString* detailInformation;
@property(nonatomic,assign)float cellHeight;

+(void)loadUserInfoWithCompleteHandler:(void(^)(NSArray* dataArray,NSString* message))completeHander;
@end
