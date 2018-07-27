//
//  FMImageTableViewCell.m
//  FactoryMethed
//
//  Created by qianpanpan on 2018/7/27.
//  Copyright © 2018年 qianpanpan. All rights reserved.
//

#import "FMImageTableViewCell.h"
#import "FMImageTableViewCellModel.h"

@interface FMImageTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;

@end


@implementation FMImageTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)setModel:(BaseTableViewCellModel *)model{
    FMImageTableViewCellModel *info = (FMImageTableViewCellModel *)model;
    self.titleLbl.text = info.title;
    self.img.image = [UIImage imageNamed:info.image];
}

@end
