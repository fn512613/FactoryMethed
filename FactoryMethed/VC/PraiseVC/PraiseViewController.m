//
//  PraiseViewController.m
//  FactoryMethed
//
//  Created by qianpanpan on 2018/8/15.
//  Copyright © 2018年 qianpanpan. All rights reserved.
//

#import "PraiseViewController.h"
#import "PraiseButton.h"
#import <MobileCoreServices/UTCoreTypes.h>
@interface PraiseViewController ()
@property (weak, nonatomic) IBOutlet PraiseButton *praiseBtn;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (nonatomic, strong) CAEmitterLayer *redpacketLayer;
@property (nonatomic, strong) CAEmitterLayer *snowLayer;
@end

@implementation PraiseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupPraiseBtn];
    [self redpacketRain];
    [self setEmitter];
    self.title = @"粒子效果";
    
    
//    NSData *data = [pasteboard valueForPasteboardType:@"com.apple.flat-rtfd"];
//    self.imageView.image = [UIImage imageWithData:data];
//
//    if ([[pasteboard pasteboardTypes] containsObject:@"Apple Web Archive pasteboard type"]) {
//        NSArray<NSDictionary *> *items = [[UIPasteboard generalPasteboard] items];
//        for (NSDictionary *item in items) {
//            NSData *data = item[@"Apple Web Archive pasteboard type"];
////            self.imageView.image = [UIImage imageWithData:data];
//            if (data) {
//                NSDictionary *archive = [NSPropertyListSerialization propertyListWithData:data options:NSPropertyListImmutable format:NULL error:nil];
//                if (archive) {
//                    NSArray<NSDictionary *> *resources = archive[@"WebSubresources"];
//                    for (NSDictionary *resource in resources) {
//                        NSData *resData = resource[@"WebResourceData"];
//                        self.imageView.image = [UIImage imageWithData:resData];
//                    }
//
//                }
//
//            }
//
//        }
//    }
    
    
   
}

- (void)setupPraiseBtn{
    _praiseBtn.particleImage = [UIImage imageNamed:@"like_white"];
    _praiseBtn.particleScale = 0.05;
    _praiseBtn.particleScaleRange = 0.02f;
    [_praiseBtn addTarget:self action:@selector(praiseAction:) forControlEvents:UIControlEventTouchUpInside];
    [_praiseBtn setImage:[UIImage imageNamed:@"like_black"] forState:UIControlStateNormal];
    [_praiseBtn setImage:[UIImage imageNamed:@"like_white"] forState:UIControlStateSelected];
}


- (IBAction)clickHongbao:(id)sender {
    [self.redpacketLayer setValue:@1.f forKeyPath:@"birthRate"];
    [self performSelector:@selector(endRedpacketAnimation) withObject:nil afterDelay:2.f];
}

- (IBAction)clickSnow:(id)sender {
    [self.snowLayer setValue:@1.f forKeyPath:@"birthRate"];
    [self performSelector:@selector(endSnowAnimation) withObject:nil afterDelay:2.f];
}

- (void)endSnowAnimation{
    [self.snowLayer setValue:@0.f forKeyPath:@"birthRate"];
}

- (void)endRedpacketAnimation{
    [self.redpacketLayer setValue:@0.f forKeyPath:@"birthRate"];
}

/** * 红包雨 */
- (void)redpacketRain{ // 1. 设置CAEmitterLayer
    CAEmitterLayer * redpacketLayer = [CAEmitterLayer layer];
    [self.view.layer addSublayer:redpacketLayer];
    self.redpacketLayer = redpacketLayer;
    redpacketLayer.emitterShape = kCAEmitterLayerLine; // 发射源的形状 是枚举类型
    redpacketLayer.emitterMode = kCAEmitterLayerSurface; // 发射模式 枚举类型
    redpacketLayer.emitterSize = self.view.frame.size; // 发射源的size 决定了发射源的大小
    redpacketLayer.emitterPosition = CGPointMake(self.view.bounds.size.width * 0.5, -10); // 发射源的位置
    redpacketLayer.birthRate = 0.f; // 每秒产生的粒子数量的系数
    // 2. 配置cell
    CAEmitterCell * snowCell = [CAEmitterCell emitterCell];
    snowCell.contents = (id)[[UIImage imageNamed:@"hongbao"] CGImage]; // 粒子的内容 是CGImageRef类型的
    snowCell.birthRate = 30.f; // 每秒产生的粒子数量
    snowCell.lifetime = 20.f; // 粒子的生命周期
    snowCell.velocity = 8.f; // 粒子的速度
    snowCell.yAcceleration = 1000.f; // 粒子再y方向的加速的
    snowCell.scale = 0.3; // 粒子的缩放比例
    redpacketLayer.emitterCells = @[snowCell];
    // 粒子添加到CAEmitterLayer上

}



- (void)setEmitter{
    //粒子图层
    CAEmitterLayer *snowLayer = [CAEmitterLayer layer];
    self.snowLayer = snowLayer;
    snowLayer.backgroundColor = [UIColor redColor].CGColor;
    //发射位置
    snowLayer.emitterPosition = CGPointMake(0, 0);
    //发射源的尺寸
    snowLayer.emitterSize = CGSizeMake(640, 1);
    //发射源的形状
    snowLayer.emitterMode = kCAEmitterLayerSurface;
    //发射模式
    snowLayer.emitterShape = kCAEmitterLayerLine;
    snowLayer.birthRate = 0;
    //存放粒子种类的数组
    NSMutableArray *snow_array = @[].mutableCopy;
    
    for (NSInteger i=1; i<5; i++) {
        //snow
        CAEmitterCell *snowCell = [CAEmitterCell emitterCell];
        snowCell.contents = (id)[[UIImage imageNamed:@"like_white"] CGImage];
        snowCell.name = @"snow";
        //产生频率
        snowCell.birthRate = .4f;
        //生命周期
        snowCell.lifetime = 30.0f;
        //运动速度
        snowCell.velocity = 10.0f;
        //运动速度的浮动值
        snowCell.velocityRange = 10;
        //y方向的加速度
        snowCell.yAcceleration = 2;
        //抛洒角度的浮动值
        snowCell.emissionRange = 0.5*M_PI;
        //自旋转角度范围
        snowCell.spinRange = 0.25*M_PI;
        //粒子透明度在生命周期内的改变速度
        snowCell.alphaSpeed = 2.0f;
        //cell的内容，一般是图片
        NSString *snow_str = [NSString stringWithFormat:@"snow%ld",i];
        snowCell.contents = (id)[UIImage imageNamed:snow_str].CGImage;
        
        [snow_array addObject:snowCell];
    }
    
    //添加到当前的layer上
    snowLayer.shadowColor = [[UIColor redColor]CGColor];
    snowLayer.cornerRadius = 1.0f;
    snowLayer.shadowOffset = CGSizeMake(1, 1);
    snowLayer.emitterCells = [NSArray arrayWithArray:snow_array];
    [self.view.layer addSublayer:snowLayer];
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



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
