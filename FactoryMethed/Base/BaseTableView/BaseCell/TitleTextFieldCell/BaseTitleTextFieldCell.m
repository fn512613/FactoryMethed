//
//  BaseTitleTextFieldCell.m
//  DreamArt
//
//  Created by qianpanpan on 2018/5/2.
//  Copyright © 2018年 QPP. All rights reserved.
//

#import "BaseTitleTextFieldCell.h"
#import "BaseTitleTextFieldCellModel.h"

@interface BaseTitleTextFieldCell ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (nonatomic, strong) BaseTitleTextFieldCellModel *info;
@end


@implementation BaseTitleTextFieldCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.separatorInset = UIEdgeInsetsMake(0,0,0,0);
    self.textField.delegate = self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    self.info.value = textField.text;
}

- (void)setModel:(BaseTableViewCellModel *)model{
    BaseTitleTextFieldCellModel *info = (BaseTitleTextFieldCellModel *)model;
    self.titleLbl.text = info.title;
    self.textField.placeholder = info.placeholder;
    self.textField.text = info.value;
    self.info = info;
}

@end
