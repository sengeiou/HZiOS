//
//  Presenter.h
//  iOSMVP
//
//  Created by KB on 2017/11/30.
//  Copyright © 2017年 HZ. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BookView;
@class Book;
@interface Presenter : NSObject
-(instancetype)initWithBookView:(BookView*)bookView;

-(void)setBook:(Book*)book;
-(void)getBook;
@end
