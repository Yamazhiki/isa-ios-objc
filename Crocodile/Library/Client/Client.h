//
// Created by Yamazhiki on 01/06/2018.
// Copyright (c) 2018 Yamazhiki. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol Request;
@protocol Client<NSObject>
- (NSURLSessionDataTask *)send:(id<Request>)request completion:(void (^)(NSData *, NSError *))completion;
@end