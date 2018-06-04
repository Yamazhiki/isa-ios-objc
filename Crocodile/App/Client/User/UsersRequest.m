//
// Created by Yamazhiki on 04/06/2018.
// Copyright (c) 2018 Yamazhiki. All rights reserved.
//

#import "UsersRequest.h"


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