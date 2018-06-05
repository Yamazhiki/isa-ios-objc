//
// Created by Yamazhiki on 31/05/2018.
// Copyright (c) 2018 Yamazhiki. All rights reserved.
//

#import <Foundation/Foundation.h>
@class RACSignal;
@protocol ApiClientType<NSObject>
- (RACSignal *)users;
- (RACSignal *)userById:(NSInteger)uid;
@end