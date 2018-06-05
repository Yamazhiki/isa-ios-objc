//
// Created by Yamazhiki on 04/06/2018.
// Copyright (c) 2018 Yamazhiki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Request.h"
@class RACSignal;
@class SampleResponseConfig;

@protocol Injector
- (void)after:(NSURLResponse *)response data:(NSData *)data;
@end

@interface ISAClientManager: NSObject
/**
 * 构造默认Client Session使用的是NSURLSession.shareSession
 * @param baseURLString NSString
 * @return ISAClientManager
 */
- (instancetype)initWithBaseURLString:(NSString *)baseURLString;
/**
 * 构造ISAClient
 * @param session 自定义的MSURLSession
 * @param baseURLString Api基址
 * @return ISAClientManager
 */
- (instancetype)initWithSession:(NSURLSession *)session baseURLString:(NSString *)baseURLString;

- (void)addInjector:(id<Injector>)injector;

- (NSURLSessionDataTask *)send:(id<Request>)request completion:(void (^)(NSData *, NSError *))completion;
@end