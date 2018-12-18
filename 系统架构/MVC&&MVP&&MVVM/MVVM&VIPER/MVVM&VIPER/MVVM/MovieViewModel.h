//
//  MovieViewModel.h
//  MVVM&VIPER
//
//  Created by KB on 2018/6/21.
//  Copyright © 2018年 BQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Movie.h"

typedef void(^MovieSelectedBlcok)(void);

@interface MovieViewModel : NSObject
@property(nonatomic,copy)NSString  *name;
@property(nonatomic,copy)NSString  *image;

@property(nonatomic,copy)MovieSelectedBlcok  movieSelectedBlcok;

+(instancetype)movieViewModelWithMovie:(Movie*)movie;
@end
