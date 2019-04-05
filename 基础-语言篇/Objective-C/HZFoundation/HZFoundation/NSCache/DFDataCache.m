//
//  DFDataCache.m
//  HZFoundation
//
//  Created by apple on 16/9/21.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import "DFDataCache.h"
@interface DFDataCache()
@property(nonatomic,strong)NSCache* dataCacheSet;
@end

@implementation DFDataCache
+(instancetype)dataCache{
    static DFDataCache* dataCache = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (dataCache == nil) {
            dataCache = [[self alloc] init];
            dataCache.dataCacheSet = [[NSCache alloc] init];
        }
    });
    return dataCache;
}

-(void)setDataToCacheWithKey:(NSString*)key value:(id)value{
    if (value==nil) {
        value = [NSNull null];
    }
    [self.dataCacheSet setObject:value forKey:key];
}

-(id)getCacheDataWithKey:(NSString*)key{
    return [self.dataCacheSet objectForKey:key];
}

-(void)removeCacheDataWithKey:(NSString*)key{
    [self.dataCacheSet removeObjectForKey:key];
}

-(id)getAndRemoveCacheDataWithKey:(NSString*)key{
    id value = [self getCacheDataWithKey:key];
    [self removeCacheDataWithKey:key];
    return value;
}

-(void)clearCacheData{
    [self.dataCacheSet removeAllObjects];
}

@end
