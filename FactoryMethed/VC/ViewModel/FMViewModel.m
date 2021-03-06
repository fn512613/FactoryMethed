//
//  FMViewModel.m
//  FactoryMethed
//
//  Created by qianpanpan on 2018/7/27.
//  Copyright © 2018年 qianpanpan. All rights reserved.
//

#import "FMViewModel.h"
#import "FMImageTableViewCellModel.h"
#import "BaseTitleSwitchCellModel.h"
#import "BaseTitleTextFieldCellModel.h"
#import "BaseTitleIndicatorCellModel.h"
@implementation FMViewModel

- (NSMutableArray *)dataSource{
    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:4];
    
    BaseTitleIndicatorCellModel *info4 = [BaseTitleIndicatorCellModel new];
    info4.title = @"跑马灯效果";
    [arr addObject:info4];
    
    BaseTitleIndicatorCellModel *info5 = [BaseTitleIndicatorCellModel new];
    info5.title = @"文字闪耀";
    [arr addObject:info5];
    
    BaseTitleIndicatorCellModel *info6 = [BaseTitleIndicatorCellModel new];
    info6.title = @"点赞效果";
    [arr addObject:info6];

    BaseTitleIndicatorCellModel *info7 = [BaseTitleIndicatorCellModel new];
    info7.title = @"画线";
    [arr addObject:info7];

    BaseTitleIndicatorCellModel *info8 = [BaseTitleIndicatorCellModel new];
    info8.title = @"进度条";
    [arr addObject:info8];
    
    BaseTitleIndicatorCellModel *info9 = [BaseTitleIndicatorCellModel new];
    info9.title = @"弹出框";
    [arr addObject:info9];
    
    BaseTitleIndicatorCellModel *info10 = [BaseTitleIndicatorCellModel new];
    info10.title = @"顶部Toast";
    [arr addObject:info10];
    
    
    FMImageTableViewCellModel *info = [FMImageTableViewCellModel new];
    info.title = @"支付宝";
    info.image = @"alipay";
    [arr addObject:info];
    FMImageTableViewCellModel *info2 = [FMImageTableViewCellModel new];
    info2.title = @"微信";
    info2.image = @"wechat";
    [arr addObject:info2];
    BaseTitleSwitchCellModel *info3 = [BaseTitleSwitchCellModel new];
    info3.title = @"支付比例";
    [arr addObject:info3];
    
    
    return arr;
}

- (void)addCell:(NSMutableArray *)arr{
    BaseTitleTextFieldCellModel *info = [BaseTitleTextFieldCellModel new];
    info.title = @"比例";
    info.placeholder = @"请输入比例";
    [arr addObject:info];
}

- (void)delectCell:(NSMutableArray *)arr{
    [arr removeLastObject];
}



@end
