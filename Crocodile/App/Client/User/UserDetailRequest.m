//
// Created by Yamazhiki on 01/06/2018.
// Copyright (c) 2018 Yamazhiki. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import "UserDetailRequest.h"
#import "User.h"


@implementation UserDetailRequest {
    NSInteger _uid;
}
- (instancetype)initWithUID:(NSInteger)uid {
    self = [super init];
    _uid = uid;
    return self;
}

- (NSDictionary *)parameters {
    return nil;
}

- (NSString *)path {
    return [NSString stringWithFormat:@"user/%i", _uid];
}

- (Method)method {
    return GET;
}

- (Class)cls {
    return [User class];
}

@end