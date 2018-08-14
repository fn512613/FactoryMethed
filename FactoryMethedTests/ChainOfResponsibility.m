//
//  FactoryMethedTests.m
//  FactoryMethedTests
//
//  Created by qianpanpan on 2018/7/26.
//  Copyright © 2018年 qianpanpan. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CEO.h"
#import "CTO.h"
#import "PM.h"
@interface FactoryMethedTests : XCTestCase

@end

@implementation FactoryMethedTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testChainOfResponsibility{
    CEO *ceo = [[CEO alloc] init];
    CTO *cto = [[CTO alloc] init];
    PM *pm = [[PM alloc] init];
    pm.superior = cto;
    cto.superior = ceo;
    
    NSArray *leaveApplicationArray = @[@"1", @"16", @"25", @"31"];
    for (NSString *string in leaveApplicationArray) {
        [pm handleLeaveApplication:[string integerValue]];
    }
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
