//
//  DAUITool.m
//  DreamArt
//
//  Created by QPP on 2018/4/15.
//  Copyright © 2018年 QPP. All rights reserved.
//

#import "DAUITool.h"

@implementation DAUITool

+ (void)registerTableView:(UITableView *)tableView name:(NSString *)cellName{
    [tableView registerNib:[UINib nibWithNibName:cellName bundle:nil] forCellReuseIdentifier:cellName];
}

+ (void)registerCollectionView:(UICollectionView *)collectionView name:(NSString *)cellName{
    [collectionView registerNib:[UINib nibWithNibName:cellName bundle:nil]  forCellWithReuseIdentifier:cellName];
}

+ (void)setExtraCellLineHidden: (UITableView *)tableView{
    
    UIView *view =[ [UIView alloc]init];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
    [tableView setTableHeaderView:view];
    
}

+ (void)setContentInsetAdjustment:(UIScrollView *)scrollView viewController:(UIViewController *)vc{
    if (@available(iOS 11.0, *)) {
        scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        vc.automaticallyAdjustsScrollViewInsets = NO;
    }
}


+ (CGFloat)getContentHeight:(NSString*)content width:(CGFloat)width fontSize:(CGFloat)size{
    CGSize constraint = CGSizeMake(width, 2000.0f);
    CGRect rect = [content boundingRectWithSize:constraint options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading  attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:size]} context:nil];
    return rect.size.height;
}

+ (void)setChangeColor:(UIView *)view direction:(BOOL)isUpToBottom{
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = view.bounds;  // 设置显示的frame
    gradientLayer.colors = @[(id)macro_Color(0x877D79).CGColor,(id)macro_Color(0x4F4744).CGColor];  // 设置渐变颜色
    gradientLayer.startPoint = CGPointMake(0, 0);   //
    if (isUpToBottom) {
        gradientLayer.endPoint = CGPointMake(0, 1);  //1.0从左往右 0.1从上往下
    }else{
        gradientLayer.endPoint = CGPointMake(1, 0);
    }
    [view.layer insertSublayer:gradientLayer atIndex:0];
}


+ (void)setChangeColor:(UIView *)view direction:(BOOL)isUpToBottom firstColor:(UIColor *)firstColor secondColor:(UIColor *)secondColor{
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = view.bounds;  // 设置显示的frame
    gradientLayer.colors = @[(id)firstColor.CGColor,(id)secondColor.CGColor];  // 设置渐变颜色
    gradientLayer.startPoint = CGPointMake(0, 0);   //
    if (isUpToBottom) {
        gradientLayer.endPoint = CGPointMake(0, 1);  //1.0从左往右 0.1从上往下
    }else{
        gradientLayer.endPoint = CGPointMake(1, 0);
    }
    [view.layer insertSublayer:gradientLayer atIndex:0];
}




+ (void)setGlassBackground:(UIView *)view{
    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
    effectView.frame = view.bounds;
    [view insertSubview:effectView atIndex:0];
//    [view addSubview:effectView];
}



@end
