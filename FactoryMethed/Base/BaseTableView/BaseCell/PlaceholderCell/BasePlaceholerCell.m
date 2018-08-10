//
//  BasePlaceholerCell.m
//  DreamArt
//
//  Created by qianpanpan on 2018/6/28.
//  Copyright © 2018年 QPP. All rights reserved.
//

#import "BasePlaceholerCell.h"
#import "BasePlaceholerCellModel.h"
@interface BasePlaceholerCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topConstraint;

@end


@implementation BasePlaceholerCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)setModel:(BaseTableViewCellModel *)model{
    BasePlaceholerCellModel *info = (BasePlaceholerCellModel *)model;
    self.titleLbl.text = info.placeholder;
    if (info.top) {
        self.topConstraint.constant = info.top;
    }
    if (info.left) {
        self.leftConstraint.constant = info.left;
    }
}

@end
