//
// Created by Yamazhiki on 04/06/2018.
// Copyright (c) 2018 Yamazhiki. All rights reserved.
//

#import <CloudKit/CloudKit.h>
#import <ReactiveObjC/RACSignal.h>
#import "BaseClient.h"
#import "NSMutableURLRequest+Request.h"
#import "ApiClient.h"


@implementation BaseClient {
    NSMutableArray <id<Injector>> *_injectors;
    NSURLSession *_session;
    NSString *_baseURLString;
}


- (instancetype)initWithBaseURLString:(NSString *)baseURLString {
    _session = NSURLSession.sharedSession;
    _injectors = [NSMutableArray array];
    return self;
}
- (instancetype)initWithSession:(NSURLSession *)session baseURLString:(NSString *)baseURLString {
    self = [self initWithBaseURLString:baseURLString];
    _session = session;
    _baseURLString = baseURLString;
    return self;
}
- (void)addInjector:(id<Injector>)injector {
    [_injectors addObject:injector];
}

- (NSURLSessionDataTask *)send:(id<Request>)request completion:(void (^)(NSData *, NSError *))completion {
    return [_session                                        dataTaskWithRequest:[[NSMutableURLRequest alloc]
        initWithRequest:request baseURLString:_baseURLString] completionHandler:^(NSData *data,
                                                                                  NSURLResponse *response,
                                                                                  NSError *error) {
        [self forInjector:response data:data];
        completion(data, error);
    }];
}

- (void)forInjector:(NSURLResponse *)response data:(NSData *)data {
    [_injectors enumerateObjectsUsingBlock:^(id<Injector> obj, NSUInteger idx, BOOL *stop) {
        [obj after:response data:data];
    }];
}

@end