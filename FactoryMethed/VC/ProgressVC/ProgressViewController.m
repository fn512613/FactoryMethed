//
//  ProgressViewController.m
//  FactoryMethed
//
//  Created by qianpanpan on 2018/8/27.
//  Copyright © 2018年 qianpanpan. All rights reserved.
//

#import "ProgressViewController.h"
#import "SDBallProgressView.h"
@interface ProgressViewController ()
@property (nonatomic, strong) SDBallProgressView *progressView;
@property (nonatomic, assign)NSTimer *timer;
@property (nonatomic, assign) CGFloat progress;
@end

@implementation ProgressViewController

- (SDBallProgressView *)progressView{
    if (_progressView == nil) {
        _progressView = [[SDBallProgressView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
        [self.view addSubview:_progressView];
    }
    return _progressView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"进度条";
    self.progressView.progress = 0;
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(progressSimulation) userInfo:self repeats:true];
}

- (void)viewDidLayoutSubviews{
    self.progressView.center = self.view.center;
}

- (void)progressSimulation{
    
    if (self.progress < 1.0) {
        self.progress += 0.01;
        
        // 循环
        if (self.progress >= 1.0) {
            [self.progressView dismiss];
            if ([_timer isValid]) {
                
                [_timer invalidate];
                _timer =nil;
            }
            
            
        }
        self.progressView.progress = self.progress;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc{
    NSLog(@"%@ delloc",self.class);
}

@end
