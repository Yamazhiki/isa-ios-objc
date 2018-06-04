//
// Created by Yamazhiki on 01/06/2018.
// Copyright (c) 2018 Yamazhiki. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol Request;
@protocol Client<NSObject>
/**
 * 发送请求
 * @param request 任何实现Request的类型
 * @param completion 回调 (void (^)(NSData *, NSError *))
 * @return NSURLSessionDataTask BTW:外面可能会使用返回值 比如取消请求之类
 */
- (NSURLSessionDataTask *)send:(id<Request>)request completion:(void (^)(NSData *, NSError *))completion;
@end