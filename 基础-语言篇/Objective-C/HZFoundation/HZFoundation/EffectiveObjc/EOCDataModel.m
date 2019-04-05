//
//  EOCDataModel.m
//  Effective-ObjC
//
//  Created by apple on 16/2/15.
//  Copyright © 2016年 HTJ. All rights reserved.
//

#import "EOCDataModel.h"
#import "EOCNetworkFetcher.h"
@interface EOCDataModel()<EOCNetworkFetcherDelegate>
@end
@implementation EOCDataModel
-(void)networkFetcher:(EOCNetworkFetcher *)networkFetcher didReceiveData:(NSData *)data{

}

-(void)networkFetcher:(EOCNetworkFetcher *)networkFetcher didFailWithError:(NSError *)error{

}
@end
