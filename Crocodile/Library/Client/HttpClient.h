//
// Created by 王斌 on 2018/5/24.
// Copyright (c) 2018 Yamazhiki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFHTTPSessionManager.h>

@class RACSignal;
@protocol ClientConfigType;

@protocol HttpInjector <NSObject>
@optional
- (void)pre;

- (void)finishResponse:(NSHTTPURLResponse *)response responseObject:(id)responseObject;
@end


@interface HttpClient : AFHTTPSessionManager
- (instancetype)initWithConfig:(id <ClientConfigType>)config;

- (void)addInjector:(id <HttpInjector>)injector;

- (RACSignal *)GET:(NSString *)url parameters:(id)parameters;
@end