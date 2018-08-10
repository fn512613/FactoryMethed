//
//  EasyAlert.m
//  FactoryMethed
//
//  Created by qianpanpan on 2018/7/30.
//  Copyright © 2018年 qianpanpan. All rights reserved.
//

#import "EasyAlert.h"


@interface EasyAlert ()
@property (nonatomic, strong) UIView *backgroundView;
@end


@implementation EasyAlert

+ (EasyAlert *)sharedView {
    static EasyAlert *sharedView;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedView = [[self alloc] initWithFrame:[[[UIApplication sharedApplication] delegate] window].bounds];
    });
    return sharedView;
}

- (UIView *)backgroundView{
    if(!_backgroundView){
        _backgroundView = [UIView new];
        _backgroundView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    if(!_backgroundView.superview){
        [self insertSubview:_backgroundView belowSubview:self];
    }
    return _backgroundView;
}

+ (void)show{
    [[[[UIApplication sharedApplication] delegate]window]addSubview:[self sharedView]];
    [self sharedView].backgroundView.backgroundColor = [UIColor yellowColor];
}


@end
