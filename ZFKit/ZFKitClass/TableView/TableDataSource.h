//
//  TableDataSource.h
//  ZFKit
//
//  Created by kris on 2018/11/2.
//  Copyright © 2018年 zf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ModuleProviderProtocol.h"

//提取的共有数据源

@class UITableView;

@interface TableDataSource : NSObject <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) id<ModuleProviderProtocol> dataProvider;//数据提供者

@end
