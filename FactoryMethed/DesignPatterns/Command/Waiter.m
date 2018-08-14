//
//  Waiter.m
//  FactoryMethed
//
//  Created by qianpanpan on 2018/8/14.
//  Copyright © 2018年 qianpanpan. All rights reserved.
//

#import "Waiter.h"

@interface Waiter ()
@property (nonatomic, strong) NSMutableArray *commandQueue;
@end


@implementation Waiter

- (instancetype)init{
    if (self == [super init]) {
        self.commandQueue = [[NSMutableArray alloc]init];
    }
    return self;
}

- (void)addOrder:(id<CommandProtocol>)command{
    [_commandQueue addObject:command];
}

- (void)submitOrder{
    for (id<CommandProtocol> command in _commandQueue) {
        [command execute];
    }
    [_commandQueue removeAllObjects];
}

- (void)cancelOrder:(id<CommandProtocol>)command{
    if ([_commandQueue containsObject:command]) {
        [_commandQueue removeObject:command];
        NSLog(@"取消成功");
    }else{
        NSLog(@"已经不可以取消了");
    }
}



@end
