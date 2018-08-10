//
//  BaseTitleTextFieldCellModel.h
//  DreamArt
//
//  Created by qianpanpan on 2018/5/2.
//  Copyright © 2018年 QPP. All rights reserved.
//

#import "BaseTableViewCellModel.h"

@interface BaseTitleTextFieldCellModel : BaseTableViewCellModel
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *placeholder;
@property (nonatomic, copy) NSString *value;
@end
