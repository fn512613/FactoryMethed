//
//  Xlbl.h
//  FactoryMethed
//
//  Created by qianpanpan on 2018/8/10.
//  Copyright © 2018年 qianpanpan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RunLabel : UIView
//字体颜色
@property (nonatomic, strong) UIColor *textColor;

//字体大小
@property (nonatomic, strong) UIFont *font;

//要显示的内容
@property (nonatomic, strong) NSString *text;
/**
 移动的速度[0~1],默认是0.2
 */
@property (nonatomic, assign) CGFloat speed;
@end
