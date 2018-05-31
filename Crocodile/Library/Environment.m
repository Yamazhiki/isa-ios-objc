//
// Created by 王斌 on 2018/5/24.
// Copyright (c) 2018 Yamazhiki. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import "Environment.h"
#import "User.h"
#import "ApiClient.h"
#import "LiveStreamPusherType.h"
#import "LiveStreamBeautyType.h"
#import "UserType.h"
#import "ApiClientType.h"

@implementation Environment {
}

- (instancetype)initWithUser:(User *)user {
  self = [super init];
  if (self) {
    _user = user;
  }
  return self;
}

- (instancetype)initWithUser:(id<UserType>)user
                         api:(id<ApiClientType>)api
                  liveStream:(id<LiveStreamPusherType>)liveStream
                      beauty:(id<LiveStreamBeautyType>)beauty {
  self = [super init];
  _api = api;
  _user = user;
  _liveSteam = liveStream;
  _beauty = beauty;
  return self;
}
@end