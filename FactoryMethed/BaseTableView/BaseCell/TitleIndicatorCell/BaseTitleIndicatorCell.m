//
//  BaseTitleIndicatorCell.m
//  DreamArt
//
//  Created by qianpanpan on 2018/5/2.
//  Copyright © 2018年 QPP. All rights reserved.
//

#import "BaseTitleIndicatorCell.h"
#import "BaseTitleIndicatorCellModel.h"

@interface BaseTitleIndicatorCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;

@end


@implementation BaseTitleIndicatorCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.separatorInset = UIEdgeInsetsMake(0,0,0,0);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (void)setModel:(BaseTableViewCellModel *)model{
    BaseTitleIndicatorCellModel *info = (BaseTitleIndicatorCellModel *)model;
    self.titleLbl.text = info.title;
}
@end
