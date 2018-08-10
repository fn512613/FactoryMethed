//
//  RunLblViewController.m
//  FactoryMethed
//
//  Created by qianpanpan on 2018/8/10.
//  Copyright © 2018年 qianpanpan. All rights reserved.
//

#import "RunLblViewController.h"
#import "Xlbl.h"
@interface RunLblViewController ()
@property (weak, nonatomic) IBOutlet Xlbl *runLbl;

@end

@implementation RunLblViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"跑马灯";
    self.runLbl.text = @"我们在天上的父，愿人都尊你的名为圣";
    self.runLbl.textColor = [UIColor redColor];
    self.runLbl.speed = 0.3;
    
    Xlbl *lbl = [[Xlbl alloc]initWithFrame:CGRectMake(100, 50, 150, 40)];
    lbl.backgroundColor = [UIColor grayColor];
    lbl.textColor = [UIColor redColor];
    lbl.font = [UIFont systemFontOfSize:15];
    lbl.text = @"君不见,黄河之水天上来,奔流到海不复回";
    lbl.speed = 0.3;
    [self.view addSubview:lbl];
}
- (IBAction)clickChange:(id)sender {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc{
    NSLog(@"%@ alloc",[self class]);
    
}
@end
