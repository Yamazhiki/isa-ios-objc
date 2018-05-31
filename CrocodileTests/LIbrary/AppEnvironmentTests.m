//
//  AppEnvironmentTests.m
//  CrocodileTests
//
//  Created by Yamazhiki on 31/05/2018.
//  Copyright © 2018 Yamazhiki. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AppEnvironment.h"
#import "Environment.h"
#import "TestUser.h"
#import "User.h"
#import "AliPusher.h"

@interface AppEnvironmentTests : XCTestCase

@end

@implementation AppEnvironmentTests

- (void)setUp {
  [super setUp];
  // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
  [super tearDown];
}

- (void)testUser {
  TestUser *user = [[TestUser alloc] initWithUID:1 name:@"Yamazhiki"];
  [AppEnvironment.shared updateUser:user];
  NSAssert(AppEnvironment.shared.current.user.uid == user.uid, @"用户更新失败");
}

- (void)testLiveStream {
  [AppEnvironment.shared switchLiveStream:AppLiveStreamSDKTypeAli];
  NSAssert([AppEnvironment.shared.current.liveSteam isKindOfClass:[AliPusher class]], @"替换SDK失败");
}

- (void)testExample {
  // This is an example of a functional test case.
  // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
  // This is an example of a performance test case.
  [self measureBlock:^{
    // Put the code you want to measure the time of here.
  }];
}

@end
