//
//  PraiseButton.h
//  FactoryMethed
//
//  Created by qianpanpan on 2018/8/15.
//  Copyright © 2018年 qianpanpan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PraiseButton : UIButton
@property (nonatomic, strong) UIImage *particleImage;
@property (nonatomic, assign) CGFloat particleScale;
@property (nonatomic, assign) CGFloat particleScaleRange;

- (void)animate;
- (void)popOutsideWithDuration:(NSTimeInterval)duration;
- (void)popInsideWithDuration:(NSTimeInterval)duration;


@end
