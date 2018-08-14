//
//  CommandTests.m
//  FactoryMethedTests
//
//  Created by qianpanpan on 2018/8/14.
//  Copyright © 2018年 qianpanpan. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Waiter.h"
#import "Cook.h"
#import "LobsterCommand.h"
#import "AbaloneCommand.h"
@interface CommandTests : XCTestCase

@end

@implementation CommandTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testCommand {
    Waiter *waiter = [[Waiter alloc] init];
    Cook *stephenChow = [[Cook alloc] init];
    LobsterCommand *lobsterCommand = [[LobsterCommand alloc] initWithReceiver:stephenChow];
    AbaloneCommand *abaloneCommand = [[AbaloneCommand alloc] initWithReceiver:stephenChow];
    
    [waiter addOrder:lobsterCommand];
    [waiter addOrder:abaloneCommand];
    [waiter submitOrder];
    [waiter cancelOrder:lobsterCommand];
}

- (void)testPerformanceExample {
    
    [self measureBlock:^{
        
    }];
}

@end
