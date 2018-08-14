//
//  Command.h
//  FactoryMethed
//
//  Created by qianpanpan on 2018/8/14.
//  Copyright © 2018年 qianpanpan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommandProtocol.h"
#import "Cook.h"


@interface Command : NSObject<CommandProtocol>

@property (nonatomic, strong, readonly) Cook *cook;

- (instancetype)initWithReceiver:(Cook *)cook;
@end
