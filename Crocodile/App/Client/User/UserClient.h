//
// Created by Yamazhiki on 01/06/2018.
// Copyright (c) 2018 Yamazhiki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataStatus.h"
#import "ISAClientManager.h"
@class RACSignal;
@class DataStatus;
@class User;

@interface UserClient: ISAClientManager


/**
 * 根据UID 获取用户信息
 * @param uid 用户ID
 * @return RACSignal<User*>
 */
- (nonnull RACSignal *)userById:(NSInteger)uid;
- (nonnull RACSignal <DataStatus<NSArray<User *> *> *> *)users:(NSInteger)page;

@end