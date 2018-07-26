//
//  BasePlaceholerCellModel.h
//  DreamArt
//
//  Created by qianpanpan on 2018/6/28.
//  Copyright © 2018年 QPP. All rights reserved.
//

#import "BaseTableViewCellModel.h"

@interface BasePlaceholerCellModel : BaseTableViewCellModel
@property (nonatomic, copy) NSString *placeholder;
@property (nonatomic, assign) CGFloat top;
@property (nonatomic, assign) CGFloat left;
@end
