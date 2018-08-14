//
//  Waiter.h
//  FactoryMethed
//
//  Created by qianpanpan on 2018/8/14.
//  Copyright © 2018年 qianpanpan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommandProtocol.h"

//服务员

@interface Waiter : NSObject

/**
 点菜
 */
- (void)addOrder:(id<CommandProtocol>)command;

/**
 全点好了
 */
- (void)submitOrder;
/**
 取消菜
 */
- (void)cancelOrder:(id<CommandProtocol>)command;

@end
