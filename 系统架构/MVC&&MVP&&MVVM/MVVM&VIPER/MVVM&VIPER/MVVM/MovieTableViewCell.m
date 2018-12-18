//
//  MovieTableViewCell.m
//  MVVM&VIPER
//
//  Created by KB on 2018/6/21.
//  Copyright © 2018年 BQ. All rights reserved.
//

#import "MovieTableViewCell.h"

@implementation MovieTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
   self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self!=nil) {
        UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button addTarget:self action:@selector(selectedMovieAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    }
    return self;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *cellId = @"MovieTableViewCell";
    MovieTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell==nil) {
        cell = [[MovieTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    return cell;
}

#pragma mark -- 设置UI显示

- (void)setMovieViewModel:(MovieViewModel *)movieViewModel{
    
}

#pragma mark -- 将view的触发事件抛出
-(void)selectedMovieAction{
    if (self.movieViewModel.movieSelectedBlcok) {
        self.movieViewModel.movieSelectedBlcok();
    }
}

@end
