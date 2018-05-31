//
// Created by 王斌 on 2018/5/24.
// Copyright (c) 2018 Yamazhiki. All rights reserved.
//

#import <ReactiveObjC/RACDisposable.h>
#import <ReactiveObjC/RACSubscriber.h>
#import <ReactiveObjC/RACSignal+Operations.h>
#import "HttpClient.h"
#import "ClientConfigType.h"

@implementation HttpClient
{
    NSMutableArray <id<HttpInjector>> *_injectors;
}

- (instancetype)initWithConfig:(id<ClientConfigType>)config {
    self = [super initWithBaseURL:config.apiBaseURL];
    return self;
}

- (void)addInjector:(id<HttpInjector>)injector {
    [_injectors addObject:injector];
}

- (RACSignal *)GET:(NSString *)url parameters:(id)parameters {

    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSURLSessionDataTask *task =
            [self GET:url parameters:parameters progress:nil success:^(NSURLSessionDataTask *task,
                                                                       id responseObject) {
                [self endInjector:(NSHTTPURLResponse *) task.response responseObject:responseObject];
                [subscriber sendNext:responseObject];
                [subscriber sendCompleted];
            } failure:^(NSURLSessionDataTask *task, NSError *error) {
                [self endInjector:(NSHTTPURLResponse *) task.response responseObject:nil];
                [subscriber sendError:nil];
            }];
        return [RACDisposable disposableWithBlock:^{
            [task cancel];
        }];
    }];
}

- (void)prepareInjector {
    for (id<HttpInjector> item in _injectors) {
        if ([item respondsToSelector:@selector(pre)])
            [item pre];
    }
}

- (void)endInjector:(NSHTTPURLResponse *)response responseObject:(id)responseObject {
    for (id<HttpInjector> item in _injectors) {
        if ([item respondsToSelector:@selector(finishResponse: responseObject:)])
            [item finishResponse:response responseObject:responseObject];
    }
}

@end