//
//  AsyncLabel.m
//  HZUIKIT
//
//  Created by 华天杰 on 2019/3/8.
//  Copyright © 2019年 HZ. All rights reserved.
//

#import "AsyncLabel.h"

#import <YYKit/YYAsyncLayer.h>
#import <YYTransaction.h>
#import <CoreText/CoreText.h>

@interface AsyncLabel ()

@end

@implementation AsyncLabel

-(void)setText:(NSString *)text{
    _text = text.copy;
    [[YYTransaction transactionWithTarget:self selector:@selector(contentsNeedsUpdate)] commit];
}

-(void)setFont:(UIFont *)font{
    _font = font;
    [[YYTransaction transactionWithTarget:self selector:@selector(contentsNeedsUpdate)] commit];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [[YYTransaction transactionWithTarget:self selector:@selector(contentsNeedsUpdate)] commit];
}

-(void)contentsNeedsUpdate{
    [self.layer setNeedsDisplay];
}

+(Class)layerClass{
    return [YYAsyncLayer class];
}

-(YYAsyncLayerDisplayTask*)newAsyncDisplayTask{
    YYAsyncLayerDisplayTask *task = [YYAsyncLayerDisplayTask new];
    task.willDisplay = ^(CALayer * _Nonnull layer) {
        
    };
    task.display = ^(CGContextRef  _Nonnull context, CGSize size, BOOL (^ _Nonnull isCancelled)(void)) {
        if (isCancelled()) {
            return ;
        }
        if (!self.text.length) {
            return;
        }
        [self draw:context size:size];
    };
    task.didDisplay = ^(CALayer * _Nonnull layer, BOOL finished) {
        if (finished) {
            //finished
        }else{
            
        }
    };
    return task;
}

-(void)draw:(CGContextRef)context size:(CGSize)size{
    //将坐标系上下翻转。因为底层坐标系和UIKit的坐标系原点位置不同。
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    CGContextTranslateCTM(context, 0, size.height);
    CGContextScaleCTM(context, 1.0,-1.0);
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, CGRectMake(0, 0, size.width, size.height));
    
    //设置内容
    NSMutableAttributedString * attString = [[NSMutableAttributedString alloc] initWithString:self.text];
    //设置字体
    [attString addAttribute:NSFontAttributeName value:self.font range:NSMakeRange(0, self.text.length)];
    
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attString);
    CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, attString.length), path, NULL);
    
    //把frame绘制到context里
    CTFrameDraw(frame, context);
}
@end
