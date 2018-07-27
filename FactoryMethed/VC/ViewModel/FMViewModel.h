//
//  FMViewModel.h
//  FactoryMethed
//
//  Created by qianpanpan on 2018/7/27.
//  Copyright © 2018年 qianpanpan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FMViewModel : NSObject
- (NSMutableArray *)dataSource;
- (void)addCell:(NSMutableArray *)arr;
- (void)delectCell:(NSMutableArray *)arr;
@end
