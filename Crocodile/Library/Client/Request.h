//
// Created by Yamazhiki on 01/06/2018.
// Copyright (c) 2018 Yamazhiki. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger) {
    GET,
    POST
} Method;

@protocol Request<NSObject>
/**
 * 路径
 */
@property(readonly) NSString *path;
/**
 * HttpMethod
 */
@property(readonly) Method method;
@property(readonly) NSDictionary<NSString *, NSString *> *headers;
/**
 * 参数
 */
@property(readonly) NSDictionary<NSString *, NSString *> *parameters;
/**
 * 相应结果类型
 */
@property(readonly) Class cls;
@end
