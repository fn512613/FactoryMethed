//
//  LineView.m
//  FactoryMethed
//
//  Created by qianpanpan on 2018/8/17.
//  Copyright © 2018年 qianpanpan. All rights reserved.
//

#import "LineView.h"

@implementation LineView

- (void)drawRect:(CGRect)rect{
    [self drawFiveLine];
}


- (void)drawFiveLine{
    for (int i = 1; i<6; i++) {
        [self drawLine1:kScreenWidth/5*i];
        [self drawLine2:self.frame.size.height/5*i];
    }
}


- (void)drawLine2:(CGFloat)y{
    CGContextRef ContextRef = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(ContextRef, [UIColor lightGrayColor].CGColor);
    CGContextSetLineCap(ContextRef, kCGLineCapRound);
    CGContextSetLineWidth(ContextRef, 1);
    CGContextBeginPath(ContextRef);
    CGContextMoveToPoint(ContextRef,0,y);
    CGContextAddLineToPoint(ContextRef,kScreenWidth,y);
    CGContextStrokePath(ContextRef);
}

-(void)drawLine1:(CGFloat)x{
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineWidth(context, 1);  //线宽
    CGContextSetAllowsAntialiasing(context, true);
    CGContextSetStrokeColorWithColor(context, [UIColor lightGrayColor].CGColor);  //线的颜色
    CGContextBeginPath(context);
    
    CGContextMoveToPoint(context, x, 0);  //起点坐标
    CGContextAddLineToPoint(context, x, self.frame.size.height);   //终点坐标
    
    CGContextStrokePath(context);
    
//    //1、获取图形上下文
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    //2、描述路径
//    //创建路径
//    CGMutablePathRef path =  CGPathCreateMutable();
//    //设置起点
//    CGPathMoveToPoint(path, NULL, x, 0);
//    //设置终点
//    CGPathAddLineToPoint(path, NULL, x, 200);
//    //颜色
//    [[UIColor redColor] setStroke];
//    //线宽
//    CGContextSetLineWidth(ctx, 2.0);
//    //设置连接样式
//    CGContextSetLineJoin(ctx, kCGLineJoinBevel);
//    //设置顶角样式
//    CGContextSetLineCap(ctx, kCGLineCapButt);
//    //3、把路径添加到上下文
//    CGContextAddPath(ctx, path);
//    //4、渲染上下文到View的layer
//    CGContextStrokePath(ctx);
}



@end
