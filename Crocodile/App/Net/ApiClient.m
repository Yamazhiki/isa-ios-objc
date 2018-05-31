//
// Created by 王斌 on 2018/5/24.
// Copyright (c) 2018 Yamazhiki. All rights reserved.
//

#import <ReactiveObjC/RACDisposable.h>
#import <ReactiveObjC/RACSubscriber.h>
#import <ReactiveObjC/RACSignal+Operations.h>
#import "ApiClient.h"
#import "ClientConfigType.h"
#import "User.h"

@implementation ApiClient {
    NSMutableArray <id<HttpInjector>> *_injectors;
    AFHTTPSessionManager *_manager;
}

- (instancetype)initWithConfig:(id<ClientConfigType>)config {
    self = [super init];
    _manager = [[AFHTTPSessionManager alloc] initWithBaseURL:config.apiBaseURL];
    _injectors = [NSMutableArray array];
    return self;
}

- (void)addInjector:(id<HttpInjector>)injector {
    [_injectors addObject:injector];
}

- (RACSignal *)GET:(NSString *)url parameters:(id)parameters {

    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSURLSessionDataTask *task =
            [_manager GET:url parameters:parameters progress:nil success:^(NSURLSessionDataTask *task,
                                                                           id responseObject) {
                [self endInjector:(NSHTTPURLResponse *) task.response responseObject:responseObject];
                [subscriber sendNext:responseObject];
                [subscriber sendCompleted];
            }     failure:^(NSURLSessionDataTask *task, NSError *error) {
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


#pragma mark ----- API -----
- (RACSignal *)users {
    return [[self GET:@"users" parameters:nil]
        map:^id(id value) {
            NSMutableArray *array = [NSMutableArray array];
            for (NSDictionary *item in value) {
                [array addObject:[[User alloc] initWithDictionary:item]];
            }
            return array;
        }];
}
- (RACSignal *)userById:(NSInteger)uid {
    return [[self GET:[NSString stringWithFormat:@"user/%ld", uid] parameters:nil] map:^id(id value) {
        return [[User alloc] initWithDictionary:value];
    }];
}

@end