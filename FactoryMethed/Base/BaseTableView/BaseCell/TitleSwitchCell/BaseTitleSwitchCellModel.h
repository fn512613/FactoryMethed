//
//  BaseTitleSwitchCellModel.h
//  DreamArt
//
//  Created by qianpanpan on 2018/5/2.
//  Copyright © 2018年 QPP. All rights reserved.
//

#import "BaseTableViewCellModel.h"

@interface BaseTitleSwitchCellModel : BaseTableViewCellModel
@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) BOOL selected;
@end
