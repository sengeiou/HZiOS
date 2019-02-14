//
//  HZLightTableViewCell+Configure.m
//  HZUIKIT
//
//  Created by apple on 16/9/10.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import "HZLightTableViewCell+Configure.h"
#import "HZLightPersonModel.h"

@implementation HZLightTableViewCell (Configure)
- (void)configureForPerson:(HZLightPersonModel *)person{
    self.nameLable.text = person.name;
    self.addressLable.text = person.address;
}
@end
