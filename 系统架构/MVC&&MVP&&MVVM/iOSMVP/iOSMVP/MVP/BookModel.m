//
//  BookModel.m
//  iOSMVP
//
//  Created by KB on 2017/11/30.
//  Copyright © 2017年 HZ. All rights reserved.
//

#import "BookModel.h"
#import "Book.h"
@implementation BookModel

-(void)getBook{
    Book* book = [[Book alloc] init];
    if ([self.delegate respondsToSelector:@selector(onFinishWithBook:)]) {
         [self.delegate onFinishWithBook:book];
    }
}

-(void)setBook:(Book *)book{
    
}
@end
