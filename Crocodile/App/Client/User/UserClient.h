//
// Created by Yamazhiki on 01/06/2018.
// Copyright (c) 2018 Yamazhiki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Client.h"
@class RACSignal;

@interface UserClient: NSObject<Client>


/**
 * 根据UID 获取用户信息
 * @param uid 用户ID
 * @return RACSignal<User*>
 */
- (RACSignal *)userById:(NSInteger)uid;

@end