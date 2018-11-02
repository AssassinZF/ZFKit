//
//  ModuleProviderProtocol.h
//  ZFKit
//
//  Created by kris on 2018/11/2.
//  Copyright © 2018年 zf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class BaseTemplateCell;
//给Section模块提供共有接口
@protocol SectionModule <NSObject>

@property (nonatomic, strong) id data;
@property (nonatomic, assign) NSUInteger numberOfItems;
@property (nonatomic, assign, getter=isShowHeader) BOOL showHeader;

- (BaseTemplateCell *)header;
- (BaseTemplateCell *)cellClassAtIndex:(NSUInteger)index;

- (CGSize)itemSizeAtIndex:(NSUInteger)index;
- (CGSize)headerSizeAtSection:(NSUInteger)section;
- (UIEdgeInsets)sectionInsets;
- (CGFloat)itemSpace;
- (CGFloat)lineSpace;

@end



//给数据源提供接口
@protocol ModuleProviderProtocol <NSObject>

@optional
- (instancetype)initWithJSON:(NSDictionary *)json;

- (void)addModulesWithJSON:(NSDictionary *)json;
- (void)addModule:(id<SectionModule>)module atSection:(NSUInteger)section;
- (void)setModule:(id<SectionModule>)module atSection:(NSUInteger)section;

- (NSArray<id<SectionModule>> *)allModules;

- (void)removeAllModule;

@end


