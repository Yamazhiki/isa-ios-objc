//
// Created by 王斌 on 2018/5/28.
// Copyright (c) 2018 Yamazhiki. All rights reserved.
//

#import "ClientConfigImp.h"

#define API_URL_SIMULATE @"https://api.github.com/"


@implementation ClientConfigImp {
    NSURL *_apiBaseURL;
}


- (instancetype)initWithMode:(NSInteger)type {
    self = [super init];
    switch (type) {
        case 0:
            _apiBaseURL = [NSURL URLWithString:API_URL_SIMULATE];
            break;
        case 1:
            _apiBaseURL = [NSURL URLWithString:API_URL_SIMULATE];
            break;
        default:
            _apiBaseURL = [NSURL URLWithString:API_URL_SIMULATE];
            break;
    }
    return self;
};


- (NSURL *)apiBaseURL {
    return _apiBaseURL;
}

@end