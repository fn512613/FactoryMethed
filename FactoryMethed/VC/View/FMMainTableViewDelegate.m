//
//  FMMainTableViewDelegate.m
//  FactoryMethed
//
//  Created by qianpanpan on 2018/7/27.
//  Copyright © 2018年 qianpanpan. All rights reserved.
//

#import "FMMainTableViewDelegate.h"
#import "BaseTitleSwitchCell.h"


@interface FMMainTableViewDelegate ()<BaseTitleSwitchCellDelegate>

@end


@implementation FMMainTableViewDelegate

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    BaseTableViewCellModel *model=self.dataSource[indexPath.row];
    NSString *modelName = [NSString stringWithUTF8String:object_getClassName(model)];
    modelName = [modelName stringByReplacingOccurrencesOfString:@"Model" withString:@""];
    BaseTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:modelName];
    [cell setModel:model];
    if ([cell isKindOfClass:[BaseTitleSwitchCell class]]) {
        BaseTitleSwitchCell *xcell = (BaseTitleSwitchCell *)cell;
        xcell.delegate = self;
    }
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
    if ([self.delegate respondsToSelector:@selector(didSelectItem:)]) {
        [self.delegate didSelectItem:indexPath];
    }
    
    
}

#pragma mark - BaseTitleSwitchCellDelegate
- (void)didSelectSwitch:(BaseTitleSwitchCellModel *)model{
    if ([self.delegate respondsToSelector:@selector(didSelectSwitchItem:)]) {
        [self.delegate didSelectSwitchItem:model];
    }
}
@end
