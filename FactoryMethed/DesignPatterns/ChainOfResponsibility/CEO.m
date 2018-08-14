//
//  CEO.m
//  FactoryMethed
//
//  Created by qianpanpan on 2018/8/14.
//  Copyright © 2018年 qianpanpan. All rights reserved.
//

#import "CEO.h"

@implementation CEO
- (void)handleLeaveApplication:(NSUInteger)dayCount {
    if (dayCount < 20) {
        NSLog(@"CEO:我很忙去找你上司");
        return;
    }
    if (dayCount < 30) {
        NSLog(@"dayCount:%ld----CEO:Bug都写完了吗？那就去吧", dayCount);
    } else {
        NSLog(@"dayCount:%ld----CEO:世界那么大你是不是也想出去看看？回去写你的Bug", dayCount);
    }
}
@end
