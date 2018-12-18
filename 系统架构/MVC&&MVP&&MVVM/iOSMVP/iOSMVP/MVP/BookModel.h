//
//  BookModel.h
//  iOSMVP
//
//  Created by KB on 2017/11/30.
//  Copyright © 2017年 HZ. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Book;

@protocol BookModelDelegate<NSObject>
 @required
-(void)onFinishWithBook:(Book*)booK;
@end

@interface BookModel : NSObject

@property(nonatomic,weak)id<BookModelDelegate> delegate;

-(void)setBook:(Book*)book;
-(void)getBook;
@end
