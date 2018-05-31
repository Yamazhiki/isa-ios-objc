//
// Created by Yamazhiki on 31/05/2018.
// Copyright (c) 2018 Yamazhiki. All rights reserved.
//

#import "TestUser.h"

@implementation TestUser

@synthesize uid;
@synthesize name;

- (instancetype)initWithUID:(NSInteger)uid name:(NSString *)name {
  self = [super init];
  uid = uid;
  name = name;
  return self;
}

@end
