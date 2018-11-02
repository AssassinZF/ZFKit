//
//  FMCellUpdating.h
//  BNMarket
//
//  Created by 方立立 on 2018/2/27.
//  Copyright © 2018年 Baoneng. All rights reserved.
//

#ifndef FMCellProtocol_h
#define FMCellProtocol_h

@protocol FMCellAction

@property (nonatomic, weak) UIViewController *executor;

- (void)execute;

@end

@protocol FMCellDelegate

- (void)triggerAction:(id<FMCellAction>)action;

@end

@protocol FMCellActionResponding

@property (nonatomic, weak) id<FMCellDelegate> delegate;

@end

@protocol FMCellUpdating

- (void)updateCellWithModel:(id)model atIndexPath:(NSIndexPath *)path;

@end

@protocol FMCellReforming

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath model:(id)model;

@end

#endif /* FMCellProtocol_h */
