//
//  HZMasonryModel.m
//  HZThreeParty
//
//  Created by apple on 16/12/15.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import "HZMasonryModel.h"

@implementation HZMasonryModel

+(void)loadUserInfoWithCompleteHandler:(void(^)(NSArray* dataArray,NSString* message))completeHander{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [NSThread sleepForTimeInterval:2.0f];
        dispatch_async(dispatch_get_main_queue(), ^{
            HZMasonryModel* model = [HZMasonryModel new];
            model.userImageUrl = @"df_icon_live_shjf";
            model.name = @"0000000";
            model.detailInformation = @"还在看发货快速的发挥关键是对国际法开始的高考生的韩国进口商的飞机刚回家开始奋斗和国际水电费进口国和水电费即可获国家开始奋斗  独守空房就开打时  发快递技术开发就";
            
            HZMasonryModel* model1 = [HZMasonryModel new];
            model1.name = @"dfjkasdjfkl";
            model1.detailInformation = @"还在看发货";
            
            HZMasonryModel* model2 = [HZMasonryModel new];
            model2.detailInformation = @"还在看发货";
            
            HZMasonryModel* model3 = [HZMasonryModel new];
            model3.userImageUrl = @"df_icon_live_shjf";
            model3.name = @"dfjkasdjfkl";
            
            HZMasonryModel* model4 = [HZMasonryModel new];
            model4.userImageUrl = @"df_icon_live_shjf";
            model4.detailInformation = @"还在看发货很近啊达飞很近爱上打法就是";
            
            HZMasonryModel* mode5 = [HZMasonryModel new];
            mode5.userImageUrl = @"df_icon_live_shjf";
            mode5.name = @"555555";
            mode5.detailInformation = @"还在看发货快速的发挥关键是对国际法开始的高考生的韩国进口商的飞机刚回家开始奋斗和国际水电费进口国和水电费即可获国家开始奋斗  独守空房就开打时  发快递技术开发就";

            HZMasonryModel* model6 = [HZMasonryModel new];
            model6.detailInformation = @"还在看发货66666666";
            
         completeHander(@[model,model1,model2,model3,model4,mode5,model6,model,model1,model2,model3,model4,mode5,model6,model,model1,model2,model3,model4,mode5,model6],@"");
        });
    });
}
@end
