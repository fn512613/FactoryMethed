//
//  ToastViewController.m
//  FactoryMethed
//
//  Created by qianpanpan on 2018/9/26.
//  Copyright © 2018年 qianpanpan. All rights reserved.
//

#import "ToastViewController.h"
#import "TopToast.h"
@interface ToastViewController ()

@end

@implementation ToastViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)clickNormal:(id)sender {
    [TopToast showToptoastWithText:@"我是t一条鱼"];
}

- (IBAction)clickTime:(id)sender {
    [TopToast showToptoastWithText:@"我是一只狗" duration:5];
}

- (IBAction)clickHeight:(id)sender {
    [TopToast showToptoastWithText:@"我是一只猫" duration:2 height:44];
}

- (IBAction)clickBg:(id)sender {
    [TopToast showToptoastWithText:@"我是一只鸟" duration:2 height:44 backGroundColor:[UIColor orangeColor]];
}

@end
