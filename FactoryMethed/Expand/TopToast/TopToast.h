//
//  TopToast.h
//  FactoryMethed
//
//  Created by qianpanpan on 2018/9/26.
//  Copyright © 2018年 qianpanpan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TopToast : NSObject
+ (void)showToptoastWithText:(NSString *)text;
+ (void)showToptoastWithText:(NSString *)text duration:(CGFloat)duration;
+ (void)showToptoastWithText:(NSString *)text duration:(CGFloat)duration height:(float)height;
+ (void)showToptoastWithText:(NSString *)text duration:(CGFloat)duration height:(float)height backGroundColor:(UIColor *)color;
+ (void)showToptoastWithText:(NSString *)text duration:(CGFloat)duration height:(float)height backGroundColor:(UIColor *)color alpha:(float)alpha;

@end

