//
//  Xlbl.m
//  FactoryMethed
//
//  Created by qianpanpan on 2018/8/10.
//  Copyright © 2018年 qianpanpan. All rights reserved.
//

#import "RunLabel.h"
@interface RunLabel ()
@property (nonatomic, assign) CGFloat offsetX; //x偏移量
@property (nonatomic, assign) CGFloat labelWidth; //label的宽度
@property (nonatomic, strong) UILabel *moveLabel;
@end

@implementation RunLabel
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]){
        _speed = 0.2;//默认值
        [self initView];
        [self initTimer];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        _speed = 0.2;//默认值
        [self initView];
        [self initTimer];
    }
    return self;
    
}



- (void)initView{
    _moveLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    _moveLabel.font = [UIFont systemFontOfSize:15];
    [self addSubview:_moveLabel];
}
//初始化timer
- (void)initTimer{
    CADisplayLink *timer = [CADisplayLink displayLinkWithTarget:self selector:@selector(displayLabelAction)];
    timer.frameInterval = 2.0;
    [timer addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)setTextColor:(UIColor *)textColor{
    _moveLabel.textColor = textColor;
}

- (void)setFont:(UIFont *)font{
    _moveLabel.font = font;
}
//设置速度
- (void)setSpeed:(CGFloat)speed{
    if (speed < 0) {
        speed = 0;
    }else if (speed > 1){
        speed = 1;
    }
    _speed = speed*5;
}

//赋值text
- (void)setText:(NSString *)text{
    _moveLabel.text = text;
    [_moveLabel sizeToFit];
    CGRect rect = _moveLabel.frame;
    rect.size.height = self.frame.size.height;
    rect.origin = CGPointMake(0, 0);
    _moveLabel.frame = rect;
    _offsetX = _moveLabel.frame.origin.x;
    self.clipsToBounds = YES;//设置了这个属性后才能局部显示
}

- (void)displayLabelAction{
    
    _labelWidth = self.moveLabel.frame.size.width;
    if (_labelWidth < self.frame.size.width) {
        return;//如果字能显示全则不移动
    }
    CGRect rect = self.moveLabel.frame;
    _offsetX -= self.speed;
    rect.origin.x = _offsetX;
    self.moveLabel.frame = rect;
    if (_offsetX < -_labelWidth){
        _offsetX = self.frame.size.width;
    }
}


@end
