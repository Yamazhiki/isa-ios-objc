//
// Created by Yamazhiki on 01/06/2018.
// Copyright (c) 2018 Yamazhiki. All rights reserved.
//

#import "NSMutableURLRequest+Request.h"
#import "Request.h"


@implementation NSMutableURLRequest (Request)
- (instancetype)initWithRequest:(id<Request>)request baseURL:(NSString *)baseURL {
    NSAssert(baseURL != nil, @"baseURL 不能为空");
    NSMutableString *tempUrl = [[NSMutableString alloc] initWithString:baseURL];
    if (![tempUrl hasSuffix:@"/"])
        [tempUrl appendString:@"/"];

    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", tempUrl, request.path]];
    self = [super initWithURL:url];
    self.HTTPMethod = [self method:request.method];
    return self;
}

- (NSString *)method:(Method)method {
    switch (method) {
        case GET:return @"GET";
        case POST:return @"POST";
        case DELETE:return @"DELETE";
        case PUT:return @"PUT";
        default: return @"";
    }
}

@end