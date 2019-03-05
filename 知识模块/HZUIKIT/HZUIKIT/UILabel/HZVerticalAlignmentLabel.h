//
//  HZVerticalAlignmentLabel.h
//
//  Created by apple on 16/3/11.
//  Copyright © 2016年 HZ. All rights reserved.


#import <UIKit/UIKit.h>


typedef enum VerticalAlignment {
    VerticalAlignmentTop,
    VerticalAlignmentMiddle,
    VerticalAlignmentBottom,
} VerticalAlignment;
@interface HZVerticalAlignmentLabel : UILabel{
    
@private
    VerticalAlignment verticalAlignment_;
}

@property (nonatomic, assign) VerticalAlignment verticalAlignment;

@end
