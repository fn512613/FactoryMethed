//
//  Manager.h
//  FactoryMethed
//
//  Created by qianpanpan on 2018/8/14.
//  Copyright © 2018年 qianpanpan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Leave.h"
@interface Manager : NSObject<Leave>
@property (nonatomic, strong) id<Leave> superior;
@end
