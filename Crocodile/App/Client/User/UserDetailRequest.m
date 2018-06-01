//
// Created by Yamazhiki on 01/06/2018.
// Copyright (c) 2018 Yamazhiki. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import "UserDetailRequest.h"
#import "User.h"


@implementation UserDetailRequest {
    int _uid;
}
- (instancetype)initWithUID:(int)uid {
    self = [super init];
    _uid = uid;
    return self;
}

- (NSDictionary *)parameters {
    return nil;
}

- (NSString *)path {
    return [NSString stringWithFormat:@"user/%d", _uid];
}

- (NSDictionary<NSString *, NSString *> *)headers {
    return nil;
}

- (Method)method {
    return GET;
}

- (Class)cls {
    return [User class];
}

@end