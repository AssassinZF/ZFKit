//
//  UIView+Expand.m
//  ZFKit
//
//  Created by Daisy on 2017/12/16.
//  Copyright © 2017年 zf. All rights reserved.
//

#import "UIView+Expand.h"

@implementation UIView (Expand)

- (id)findFirstResponder
{
    if([self isFirstResponder]) {
        return self;
    }
    
    for (UIView *subView in self.subviews) {
        id view = [subView findFirstResponder];
        if (view) {
            return view;
        }
    }
    return nil;
}

- (UIImage *)snapshot {
    UIGraphicsBeginImageContext(self.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self.layer renderInContext:context];
    UIImage* snapshot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return snapshot;
}

@end
