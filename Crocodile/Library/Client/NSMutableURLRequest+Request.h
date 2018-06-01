//
// Created by Yamazhiki on 01/06/2018.
// Copyright (c) 2018 Yamazhiki. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol Request;

@interface NSMutableURLRequest (Request)
- (instancetype)initWithRequest:(id<Request>)request baseURL:(NSString *)baseURL;
@end