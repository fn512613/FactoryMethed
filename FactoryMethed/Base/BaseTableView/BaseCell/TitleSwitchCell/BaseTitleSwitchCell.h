//
//  BaseTitleSwitchCell.h
//  DreamArt
//
//  Created by qianpanpan on 2018/5/2.
//  Copyright © 2018年 QPP. All rights reserved.
//

#import "BaseTableViewCell.h"

@class BaseTitleSwitchCellModel;
@protocol BaseTitleSwitchCellDelegate;
@interface BaseTitleSwitchCell : BaseTableViewCell
@property (nonatomic, strong) id<BaseTitleSwitchCellDelegate> delegate;

@end

@protocol BaseTitleSwitchCellDelegate <NSObject>
- (void)didSelectSwitch:(BaseTitleSwitchCellModel *)model;

@end
