//
//  DAUITool.h
//  DreamArt
//
//  Created by QPP on 2018/4/15.
//  Copyright © 2018年 QPP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface DAUITool : NSObject

+ (void) registerTableView:(UITableView *)tableView name:(NSString *)cellName;
+ (void)setExtraCellLineHidden: (UITableView *)tableView;
+ (void)registerCollectionView:(UICollectionView *)collectionView name:(NSString *)cellName;


+ (void)setContentInsetAdjustment:(UIScrollView *)scrollView viewController:(UIViewController *)vc;
+ (CGFloat)getContentHeight:(NSString*)content width:(CGFloat)width fontSize:(CGFloat)size;

/**
 设置渐变色

 @param view 当前view
 @param isUpToBottom YES设置颜色从上往下 NO 从左往右还是
 */
+ (void)setChangeColor:(UIView *)view direction:(BOOL)isUpToBottom;


/**
 设置渐变色

 @param view view
 @param isUpToBottom YES设置颜色从上往下 NO 从左往右
 @param firstColor color
 @param secondColor color
 */
+ (void)setChangeColor:(UIView *)view direction:(BOOL)isUpToBottom firstColor:(UIColor *)firstColor secondColor:(UIColor *)secondColor;
/**
 毛玻璃

 @param view view
 */
+ (void)setGlassBackground:(UIView *)view;
@end
