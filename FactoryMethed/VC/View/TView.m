//
//  TView.m
//  FactoryMethed
//
//  Created by qianpanpan on 2018/8/9.
//  Copyright © 2018年 qianpanpan. All rights reserved.
//

#import "TView.h"

@interface TView ()
@property (nonatomic, assign) CGFloat snowY;
@property (nonatomic, strong) UIImageView *img;
@end


@implementation TView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    self.img = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"wechat"] ];
    self.img.frame = CGRectMake(20, 0, 20, 20);
    [self addSubview:self.img];
    
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(setNeedsDisplay)];
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    if (@available(iOS 10.0, *)) {
//        [link setPreferredFramesPerSecond:10];
    } else {
        // Fallback on earlier versions
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    if(_snowY > rect.size.height){
        _snowY = 0;
        
    }
   
    self.img.center = CGPointMake(20, _snowY);
    _snowY += 10;
}
@end
