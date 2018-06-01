//
// Created by Yamazhiki on 01/06/2018.
// Copyright (c) 2018 Yamazhiki. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger) {
    GET,
    POST,
    DELETE,
    PUT
} Method;

@protocol Request<NSObject>
@property(readonly) NSDictionary *parameters;
@property(readonly) NSString *path;
@property(readonly) Method method;
@property(readonly) Class cls;
@end
