//
//  HZImageControl.m
//  HZUIKIT
//
//  Created by dafy on 16/8/10.
//  Copyright © 2016年 HZ. All rights reserved.
//

#import "HZImageControl.h"

@implementation HZImageControl

- (instancetype)initWithFrame:(CGRect)frame title:(NSString*)title image:(UIImage*)image{
    self = [super initWithFrame:frame];
    CGFloat width = frame.size.width;
    CGFloat height = frame.size.height;
    // title
    UILabel* label = [[UILabel alloc] init];
    [label setText:title];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setFrame:CGRectMake(0, 0, width, height*0.3)];
    [self addSubview:label];
    // image
    UIImageView* imageView = [[UIImageView alloc] init];
    [imageView setFrame:CGRectMake(0, CGRectGetMaxY(label.frame), width, height*0.7)];
    [imageView setContentMode:UIViewContentModeScaleAspectFit];
    [imageView setImage:image];
    [self addSubview:imageView];
    
    return self;
}

/*
   对于一个给定的事件，UIControl会调用sendAction:to:forEvent:来将行为消息转发到UIApplication对象，再由UIApplication对象调用其sendAction:to:fromSender:forEvent:方法来将消息分发到指定的target上，而如果我们没有指定target，则会将事件分发到响应链上第一个想处理消息的对象上。而如果子类想监控或修改这种行为的话，则可以重写这个方法
 */
-(void)sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event{
    [super sendAction:@selector(handleAction) to:self forEvent:event];
}

-(void)handleAction{
    NSLog(@"handleAction!!!!!!");
}

@end
