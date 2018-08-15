//
//  PraiseViewController.m
//  FactoryMethed
//
//  Created by qianpanpan on 2018/8/15.
//  Copyright © 2018年 qianpanpan. All rights reserved.
//

#import "PraiseViewController.h"
#import "PraiseButton.h"
@interface PraiseViewController ()
@property (nonatomic, strong) PraiseButton *praiseButton;
@end

@implementation PraiseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.praiseButton.center = self.view.center;
    [self.view addSubview:self.praiseButton];
}

- (void)praiseAction:(PraiseButton *)button {
    if (button.selected) {
        [button popInsideWithDuration:0.4];
    }else{
        [button popOutsideWithDuration:0.5f];
        [button animate];
    }
    button.selected = !button.selected;
}

- (PraiseButton *)praiseButton{
    if (!_praiseButton) {
        _praiseButton = [[PraiseButton alloc]init];
        _praiseButton.frame = CGRectMake(0, 0, 60, 60);
        _praiseButton.particleImage = [UIImage imageNamed:@"like_white"];
        _praiseButton.particleScale = 0.05;
        _praiseButton.particleScaleRange = 0.02f;
        [_praiseButton addTarget:self action:@selector(praiseAction:) forControlEvents:UIControlEventTouchUpInside];
        [_praiseButton setImage:[UIImage imageNamed:@"like_black"] forState:UIControlStateNormal];
        [_praiseButton setImage:[UIImage imageNamed:@"like_white"] forState:UIControlStateSelected];
    }
    return _praiseButton;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
