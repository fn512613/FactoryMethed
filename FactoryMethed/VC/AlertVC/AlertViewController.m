//
//  AlertViewController.m
//  FactoryMethed
//
//  Created by qianpanpan on 2018/9/12.
//  Copyright © 2018年 qianpanpan. All rights reserved.
//

#import "AlertViewController.h"
#import "QPAlertViewController.h"
@interface AlertViewController ()

@end

@implementation AlertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"弹出框";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (IBAction)click:(id)sender {
    QPAlertViewController *vc = [QPAlertViewController alertControllerWithTitle:@"成为VIP，畅学所有名师课程"
                                                                   leftBtnTitle:@"任性花钱看"
                                                                  rightBtnTitle:@"成为VIP"
                                                                     leftAction:^{
                                                                         
                                                                     }
                                                                    rightAction:^{
                                                                        
                                                                    } notAction:^{
                                                                        
                                                                    }];
    [self presentViewController:vc animated:true completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
