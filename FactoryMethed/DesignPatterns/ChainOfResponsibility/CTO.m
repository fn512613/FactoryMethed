//
//  CTO.m
//  FactoryMethed
//
//  Created by qianpanpan on 2018/8/14.
//  Copyright © 2018年 qianpanpan. All rights reserved.
//

#import "CTO.h"

@implementation CTO
- (void)handleLeaveApplication:(NSUInteger)dayCount {
    if (dayCount < 10) {
        NSLog(@"CTO:我很忙，这种小事别烦我");
        return;
    }
    if (dayCount < 20) {
        NSLog(@"dayCount:%ld----CTO:又请假相亲啊，去吧去吧~", dayCount);
    } else {
        if (self.superior != nil) {
            NSLog(@"dayCount:%ld----CTO:又请假相亲啊，我没权利批假，去问一下我的老大吧~", dayCount);
            [self.superior handleLeaveApplication:dayCount];
        }
    }
}
@end
