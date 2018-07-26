//
//  BaseTitleSwitchCell.m
//  DreamArt
//
//  Created by qianpanpan on 2018/5/2.
//  Copyright © 2018年 QPP. All rights reserved.
//

#import "BaseTitleSwitchCell.h"
#import "BaseTitleSwitchCellModel.h"
@interface BaseTitleSwitchCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
@property (weak, nonatomic) IBOutlet UISwitch *switchBtn;
@property (nonatomic, strong) BaseTitleSwitchCellModel *info;

@end

@implementation BaseTitleSwitchCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
}

- (IBAction)didSelectSwitch:(UISwitch *)sender {
    self.info.selected = sender.isOn;
    if ([self.delegate respondsToSelector:@selector(didSelectSwitch:)]) {
        [self.delegate didSelectSwitch:self.info];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)setModel:(BaseTableViewCellModel *)model{
    BaseTitleSwitchCellModel *info =(BaseTitleSwitchCellModel *)model;
    self.titleLbl.text = info.title;
    [self.switchBtn setOn:info.selected];
    self.info = info;
}


@end
