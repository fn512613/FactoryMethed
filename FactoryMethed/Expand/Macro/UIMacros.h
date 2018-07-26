//
//  DimensMacros.h
//  Homework
//
//  Created by wyx on 16/10/25.
//  Copyright © 2016年 ShanghaiJizhi. All rights reserved.
//


#define kScreenWidth ([UIScreen mainScreen].bounds.size.width)

#define kScreenHeight ([UIScreen mainScreen].bounds.size.height)

#define macro_Color(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define Localized(key) NSLocalizedString(key, nil)

#define ScaleSizeIphone6(size) (floor((size)/375.0*kScreenWidth))
