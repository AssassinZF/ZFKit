//
//  TableDataSource.m
//  ZFKit
//
//  Created by kris on 2018/11/2.
//  Copyright © 2018年 zf. All rights reserved.
//

#import "TableDataSource.h"
#import "BaseTemplateCell.h"
#import "FMCellProtocol.h"

@interface TableDataSource()

//这两个map做延迟注册cell/header缓存
@property (nonatomic, strong) NSMutableDictionary *cellClass;
@property (nonatomic, strong) NSMutableDictionary *headerClass;

@end

@implementation TableDataSource

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    id<SectionModule> section = self.dataProvider.allModules[indexPath.section];
//    id items = section.data;
    
    BaseTemplateCell *cell = [section cellClassAtIndex:indexPath.item];
    /*
     上面这个方法可以这样去实现增加自己自定义的classhe 和 标识
     BNCellTemplateClass *cell = [[BNCellTemplateClass alloc] init];
     cell.identity = kMainPageModuleTypeSectionTitle;
     cell.cellClass = [BNBaseCollectionViewCell class];
     */
    
    
    // 延时cell的注册时间到使用之前
    if (![self.cellClass.allKeys containsObject:cell.identity]) {
        //register cell
        [self.cellClass setObject:cell.cellClass forKey:cell.identity];//注册完缓存
    }
    
    UITableViewCell *collectionViewCell = [tableView dequeueReusableCellWithIdentifier:cell.identity];//获取复用cell

    if ([collectionViewCell conformsToProtocol:@protocol(FMCellUpdating)]) {
//        [(id<FMCellUpdating>)collectionViewCell updateCellWithModel:items atIndexPath:indexPath];
    }

    if ([collectionViewCell conformsToProtocol:@protocol(FMCellActionResponding)]) {
//        ((id<FMCellActionResponding>)collectionViewCell).delegate = self;
    }
    return collectionViewCell;

}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataProvider.allModules[section].numberOfItems;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return  self.dataProvider.allModules.count;
}

#pragma mark - private

-(NSMutableDictionary *)cellClass{
    if (!_cellClass) {
        _cellClass = @{}.mutableCopy;
    }
    return _cellClass;
}

-(NSMutableDictionary *)headerClass{
    if (!_headerClass) {
        _headerClass = @{}.mutableCopy;
    }
    return _headerClass;
}
@end
