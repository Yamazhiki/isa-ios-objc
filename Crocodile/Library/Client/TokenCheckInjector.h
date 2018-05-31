//
// Created by 王斌 on 2018/5/24.
// Copyright (c) 2018 Yamazhiki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpClient.h"

@class RACSubject;
@protocol RACSubscriber;


@interface TokenCheckInjector : NSObject <HttpInjector>
- (instancetype)initWithObserver:(id <RACSubscriber>)observer;
@end