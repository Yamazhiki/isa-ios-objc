//
// Created by Yamazhiki on 05/06/2018.
// Copyright (c) 2018 Yamazhiki. All rights reserved.
//

#import "UserRequests.h"

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
    return [NSString stringWithFormat:@"user/%d", _uid];
}

- (NSDictionary<NSString *, NSString *> *)headers {
    return nil;
}

- (Method)method {
    return GET;
}

- (NSTimeInterval)delay {
    return 10;
}

- (NSData *)sampleData {
    return [NSJSONSerialization  dataWithJSONObject:@{
        @"id": @10, @"login": @"Yamazhiki"} options:NSJSONWritingPrettyPrinted error:nil];
}

@end

@implementation UsersRequest {

}

- (NSString *)path {
    return @"users";
}

- (NSDictionary *)parameters {
    return nil;
}

- (NSDictionary<NSString *, NSString *> *)headers {
    return nil;
}

- (Method)method {
    return GET;
}

@end