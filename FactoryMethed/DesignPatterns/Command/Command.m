//
//  Command.m
//  FactoryMethed
//
//  Created by qianpanpan on 2018/8/14.
//  Copyright © 2018年 qianpanpan. All rights reserved.
//

#import "Command.h"
NSString * const stringConst = @"I am a NSString * const string";
@implementation Command
- (void)execute{
    NSLog(@"%@",stringConst);
}

- (instancetype)initWithReceiver:(Cook *)cook{
    if (self == [super init]) {
        _cook = cook;
    }
    return self;
}

@end
