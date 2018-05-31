//
// Created by 王斌 on 2018/5/24.
// Copyright (c) 2018 Yamazhiki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ApiClient.h"

@class RACSubject;
@protocol RACSubscriber;

/**
 * 用户认证检测器(使用StatusCode 403检测)
 */

@interface TokenCheckInjector: NSObject<HttpInjector>
- (instancetype)initWithObserver:(id<RACSubscriber>)observer;
@end