//
//  Presenter.m
//  iOSMVP
//
//  Created by KB on 2017/11/30.
//  Copyright © 2017年 HZ. All rights reserved.
//

#import "Presenter.h"
#import "BookModel.h"
#import "BookView.h"
@interface Presenter()<BookModelDelegate>
@property(nonatomic,strong)BookModel* bookModel;
@property(nonatomic,strong)BookView* bookView;
@end

@implementation Presenter

-(instancetype)initWithBookView:(BookView*)bookView{
    self = [super init];
    if (self) {
        _bookView = bookView;
        _bookModel = [[BookModel alloc] init];
    }
    return self;
}

-(void)setBook:(Book*)book{
    
}
-(void)getBook{
   [_bookModel getBook];
}

-(void)onFinishWithBook:(Book *)booK{
    [_bookView showBook:booK];
}
@end
