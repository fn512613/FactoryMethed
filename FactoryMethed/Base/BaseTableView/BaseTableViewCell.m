//
//  NYBaseTableViewCell.m
//  NuanYouAIO
//
//  Created by nuanyouMac on 17/9/19.
//  Copyright © 2017年 xiaoxueying. All rights reserved.
//

#import "BaseTableViewCell.h"
@implementation BaseTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setModel:(BaseTableViewCellModel *)model{
    
}
//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//     [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
//}

@end
