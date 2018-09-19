//
//  QPAlertViewController.m
//  FactoryMethed
//
//  Created by qianpanpan on 2018/9/12.
//  Copyright © 2018年 qianpanpan. All rights reserved.
//

#import "QPAlertViewController.h"
#import "KTCenterAnimationController.h"
@interface QPAlertViewController ()<UIViewControllerTransitioningDelegate>
@property (weak, nonatomic) IBOutlet UIButton *leftBtn;
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
@property (nonatomic, copy) NSString *titleText;
@property (nonatomic, copy) NSString *cancelText;
@property (nonatomic, copy) NSString *buttonText;
@property (nonatomic, copy) alertButtonAction rightAction;
@property (nonatomic, copy) alertButtonAction leftAction;
@property (nonatomic, copy) alertButtonAction notAction;
@end

@implementation QPAlertViewController


+ (instancetype)alertControllerWithTitle:(NSString *)title leftBtnTitle:(NSString *)leftTitle rightBtnTitle:(NSString *)rightTitle leftAction:(alertButtonAction)leftAction rightAction:(alertButtonAction)rightAction notAction:(alertButtonAction)notAction{
    QPAlertViewController *alert = [[QPAlertViewController alloc]init];
    alert.transitioningDelegate = alert;
    alert.modalPresentationStyle = UIModalPresentationCustom;
    alert.titleText = title;
    alert.cancelText = leftTitle;
    alert.buttonText = rightTitle;
    alert.rightAction = rightAction;
    alert.leftAction = leftAction;
    alert.notAction = notAction;
    return alert;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleLbl.text = self.titleText;
    [self.leftBtn setTitle:self.cancelText forState:UIControlStateNormal];
    [self.rightBtn setTitle:self.buttonText forState:UIControlStateNormal];
}



#pragma mark --UIViewControllerTransitioningDelegate--

- (IBAction)clickLeftBtn:(id)sender {
    if (self.leftAction) {
        self.leftAction();
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)clickRightBtn:(id)sender {
    if (self.rightAction) {
        self.rightAction();
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)clickNotBtn:(UIButton *)sender {
    if (self.notAction) {
        self.notAction();
    }
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    
    return [[KTCenterAnimationController alloc] init];
    
    
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    
    return [[KTCenterAnimationController alloc] init];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
