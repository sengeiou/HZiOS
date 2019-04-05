//
//  DFDataCache.h
//  HZFoundation
//
//  Created by apple on 16/9/21.
/*
    DFDataCache
    主要提供数据的持久化存储和内存存储相关的API；
 */

#import <Foundation/Foundation.h>

@interface DFDataCache : NSObject

+(instancetype)dataCache;

#pragma mark- 内存存储 
-(void)setDataToCacheWithKey:(NSString*)key value:(id)value;
-(id)getCacheDataWithKey:(NSString*)key;
-(void)removeCacheDataWithKey:(NSString*)key;
-(id)getAndRemoveCacheDataWithKey:(NSString*)key;
-(void)clearCacheData;
@end
