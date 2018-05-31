//
// Created by 王斌 on 2018/5/24.
// Copyright (c) 2018 Yamazhiki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFHTTPSessionManager.h>
#import "ApiClientType.h"

@class RACSignal;
@protocol ClientConfigType;

@protocol HttpInjector<NSObject>
@optional
- (void)pre;

- (void)finishResponse:(NSHTTPURLResponse *)response responseObject:(id)responseObject;
@end

@interface ApiClient: NSObject<ApiClientType>

- (instancetype)initWithConfig:(id<ClientConfigType>)config;

- (void)addInjector:(id<HttpInjector>)injector;
@end
