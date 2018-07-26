
//
//  BaseTitleBigCell.m
//  DreamArt
//
//  Created by qianpanpan on 2018/5/8.
//  Copyright © 2018年 QPP. All rights reserved.
//

#import "BaseTitleBigCell.h"
#import "BaseTitleBigCellModel.h"
@interface BaseTitleBigCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;

@end


@implementation BaseTitleBigCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.separatorInset = UIEdgeInsetsMake(0, kScreenWidth, 0, 0);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setModel:(BaseTableViewCellModel *)model{
    BaseTitleBigCellModel *info = (BaseTitleBigCellModel *)model;
    self.titleLbl.text = info.title;
    
}

@end
