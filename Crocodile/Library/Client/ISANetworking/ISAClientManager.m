//
// Created by Yamazhiki on 04/06/2018.
// Copyright (c) 2018 Yamazhiki. All rights reserved.
//

#import <CloudKit/CloudKit.h>
#import "ISAClientManager.h"
#import "NSMutableURLRequest+Request.h"
#import "StubResponseType.h"


@implementation ISAClientManager {
    NSMutableArray <id<Injector>> *_injectors;
    NSURLSession *_session;
    NSString *_baseURLString;
    dispatch_queue_t _stubQueue;
}


- (instancetype)initWithBaseURLString:(NSString *)baseURLString {
    self = [super init];
    _baseURLString = baseURLString;
    _session = NSURLSession.sharedSession;
    _injectors = [NSMutableArray array];
    _stubQueue = dispatch_queue_create("com.isa.networking.stub", NULL);
    return self;
}

- (instancetype)initWithStubSession:(NSURLSession *)session baseURLString:(NSString *)baseURLString {
    self = [self initWithBaseURLString:baseURLString];
    _session = session;
    return self;
}

- (void)addInjector:(id<Injector>)injector {
    [_injectors addObject:injector];
}

- (NSURLSessionDataTask *)send:(id<Request>)request completion:(void (^)(NSData *, NSError *))completion {
    if ([request conformsToProtocol:@protocol(StubResponseType)]) {
        id<StubResponseType> stub = (id<StubResponseType>) request;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t) (stub.delay * NSEC_PER_SEC)), _stubQueue, ^{
            completion(stub.sampleData, nil);
        });
        return nil;
    } else {
        NSURLSessionDataTask *task = [_session                  dataTaskWithRequest:[[NSMutableURLRequest alloc]
            initWithRequest:request baseURLString:_baseURLString] completionHandler:^(NSData *data,
                                                                                      NSURLResponse *response,
                                                                                      NSError *error) {


            [self forInjector:response data:data];
            completion(data, error);
        }];
        [task resume];
        return task;
    }
}

- (void)forInjector:(NSURLResponse *)response data:(NSData *)data {
    [_injectors enumerateObjectsUsingBlock:^(id<Injector> obj, NSUInteger idx, BOOL *stop) {
        [obj after:response data:data];
    }];
}

@end
