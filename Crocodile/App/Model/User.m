//
// Created by 王斌 on 2018/5/24.
// Copyright (c) 2018 Yamazhiki. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import "User.h"

@implementation User {
}

@synthesize uid;
@synthesize name;

- (instancetype)initWithDictionary:(NSDictionary *)src {
  self = [super init];
  if (self) {
      uid = [src[@"id"] integerValue];
      name = src[@"login"];
  }
  return self;
}
@end
