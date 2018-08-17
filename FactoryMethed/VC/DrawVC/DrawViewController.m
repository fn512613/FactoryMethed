//
//  DrawViewController.m
//  FactoryMethed
//
//  Created by qianpanpan on 2018/8/17.
//  Copyright © 2018年 qianpanpan. All rights reserved.
//

#import "DrawViewController.h"
#import "LineView.h"
@interface DrawViewController ()

@end

@implementation DrawViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"画线";
//    [self drawLine1];
    [self addSubView];
}

- (void)addSubView{
    LineView *view = [[LineView alloc]init];
    view.backgroundColor = [UIColor yellowColor];
    view.frame = self.view.frame;
    [self.view addSubview:view];
}


-(void)drawLine1{
    
    //1、获取图形上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //2、描述路径
    //创建路径
    CGMutablePathRef path =  CGPathCreateMutable();
    //设置起点
    CGPathMoveToPoint(path, NULL, 50, 150);
    //设置终点
    CGPathAddLineToPoint(path, NULL, 100, 100);
    //颜色
    [[UIColor redColor] setStroke];
    //线宽
    CGContextSetLineWidth(ctx, 20.0);
    //设置连接样式
    CGContextSetLineJoin(ctx, kCGLineJoinBevel);
    //设置顶角样式
    CGContextSetLineCap(ctx, kCGLineCapButt);
    
    
    //3、把路径添加到上下文
    CGContextAddPath(ctx, path);
    //4、渲染上下文到View的layer
    CGContextStrokePath(ctx);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
