//
// Created by Yamazhiki on 01/06/2018.
// Copyright (c) 2018 Yamazhiki. All rights reserved.
//

#import "NSMutableURLRequest+Request.h"
#import "Request.h"


@implementation NSMutableURLRequest (Request)
- (instancetype)initWithRequest:(id<Request>)request baseURLString:(NSString *)baseURLString {
    NSAssert(baseURLString != nil, @"baseURL 不能为空");

    NSURLComponents *components = [self componentWithRequest:request baseURLString:baseURLString];
    NSString *queryString = components.query;
    if (request.method == POST) {
        components.queryItems = nil;
    }

    self = [super initWithURL:components.URL];
    if (request.headers) {
        self.allHTTPHeaderFields = request.headers;
    }
    self.HTTPMethod = [self method:request.method];
    if (request.method == POST) {
        self.HTTPBody = [queryString dataUsingEncoding:NSUTF8StringEncoding];
    }
    return self;
}

- (NSURLComponents *)componentWithRequest:(id<Request>)request baseURLString:(NSString *)baseURLString {
    NSMutableString *tempBaseURLString = [[NSMutableString alloc] initWithString:baseURLString];
    if (![baseURLString hasSuffix:@"/"]) {
        [tempBaseURLString appendString:@"/"];
    }
    NSURLComponents *components =
        [NSURLComponents componentsWithString:[NSString stringWithFormat:@"%@%@", tempBaseURLString, request.path]];
    NSMutableArray<NSURLQueryItem *> *items = [NSMutableArray array];
    [request.parameters enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSString *obj, BOOL *stop) {
        [items addObject:[NSURLQueryItem queryItemWithName:key value:obj]];
    }];
    components.queryItems = items;
    return components;
}

- (NSString *)method:(Method)method {
    switch (method) {
        case GET:return @"GET";
        case POST:return @"POST";
        default: return @"";
    }
}

@end