//
//  BaseTemplateCell.h
//  ZFKit
//
//  Created by kris on 2018/11/2.
//  Copyright © 2018年 zf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseTemplateCell : NSObject

@property (nonatomic, copy) NSString *identity;
@property (nonatomic, copy) Class cellClass;//携带一个具体的CELL class

@end

