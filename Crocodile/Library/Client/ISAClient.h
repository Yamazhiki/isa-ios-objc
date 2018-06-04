//
// Created by Yamazhiki on 04/06/2018.
// Copyright (c) 2018 Yamazhiki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Client.h"
@class RACSignal;

@protocol Injector
- (void)after:(NSURLResponse *)response data:(NSData *)data;
@end

@interface ISAClient: NSObject<Client>
/**
 * 构造默认Client Session使用的是NSURLSession.shareSession
 * @param baseURLString
 * @return ISAClient
 */
- (instancetype)initWithBaseURLString:(NSString *)baseURLString;
/**
 * 构造ISAClient
 * @param session 自定义的MSURLSession
 * @param baseURLString
 * @return ISAClient
 */
- (instancetype)initWithSession:(NSURLSession *)session baseURLString:(NSString *)baseURLString;
- (void)addInjector:(id<Injector>)injector;

@end