//
//  UIView+Expand.h
//  ZFKit
//
//  Created by Daisy on 2017/12/16.
//  Copyright © 2017年 zf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Expand)

/**
 获取第一响应者

 @return id
 */
- (id)findFirstResponder;


/**
 屏幕快照

 @return image
 */
- (UIImage *)snapshot;
@end
