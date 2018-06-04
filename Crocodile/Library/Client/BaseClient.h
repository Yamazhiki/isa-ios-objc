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

@interface BaseClient: NSObject<Client>
- (instancetype)initWithBaseURLString:(NSString *)baseURLString;
- (instancetype)initWithSession:(NSURLSession *)session baseURLString:(NSString *)baseURLString;
- (void)addInjector:(id<Injector>)injector;

@end