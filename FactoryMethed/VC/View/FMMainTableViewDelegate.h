//
//  FMMainTableViewDelegate.h
//  FactoryMethed
//
//  Created by qianpanpan on 2018/7/27.
//  Copyright © 2018年 qianpanpan. All rights reserved.
//

#import "BaseTableViewDelegate.h"

@class BaseTitleSwitchCellModel;
@protocol FMMainTableViewDelegateProtocol;
@interface FMMainTableViewDelegate : BaseTableViewDelegate
@property (nonatomic, weak) id<FMMainTableViewDelegateProtocol> delegate;
@end

@protocol FMMainTableViewDelegateProtocol <NSObject>
- (void)didSelectItem:(NSIndexPath *)indexPath;
- (void)didSelectSwitchItem:(BaseTitleSwitchCellModel *)indexPath;
@end
