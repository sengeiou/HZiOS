//
//  UIView+HZ.m
//  Objective-C-Project
//
//  Created by 华天杰 on 2019/1/13.
//  Copyright © 2019年 HZ. All rights reserved.
//

#import "UIView+HZ.h"
#import <objc/runtime.h>

static const void* K_CUSTOMER_FLAG = @"customeFlag";
static const void* K_CUSTOMER_DELEGATE= @"customeDelegate";

@implementation UIView (HZ)


- (id<UIViewCustomeDelegagte>)customeDelegate{
     return objc_getAssociatedObject(self, K_CUSTOMER_DELEGATE);
}

- (void)setCustomeDelegate:(id<UIViewCustomeDelegagte>)customeDelegate{
    objc_setAssociatedObject(self, K_CUSTOMER_DELEGATE, customeDelegate, OBJC_ASSOCIATION_ASSIGN);
}

-(NSString *)customeFlag{
    return objc_getAssociatedObject(self, K_CUSTOMER_FLAG);
}

-(void)setCustomeFlag:(NSString *)customeFlag{
    objc_setAssociatedObject(self, K_CUSTOMER_FLAG, customeFlag, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(CGFloat)x{
    return self.frame.origin.x;
}
-(CGFloat)y{
    return self.frame.origin.y;
}

-(void)testAddProtocol{
    if ([self.customeDelegate respondsToSelector:@selector(view:selectedItem:)]) {
        [self.customeDelegate view:self selectedItem:@"selected item"];
    }
}


@end
