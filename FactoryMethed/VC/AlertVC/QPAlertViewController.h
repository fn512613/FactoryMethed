//
//  QPAlertViewController.h
//  FactoryMethed
//
//  Created by qianpanpan on 2018/9/12.
//  Copyright © 2018年 qianpanpan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^alertButtonAction)(void);

@interface QPAlertViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UIView *contentView;

+ (instancetype)alertControllerWithTitle:(NSString *)title leftBtnTitle:(NSString *)leftTitle rightBtnTitle:(NSString *)rightTitle leftAction:(alertButtonAction)leftAction rightAction:(alertButtonAction)rightAction notAction:(alertButtonAction)notAction;
@end
