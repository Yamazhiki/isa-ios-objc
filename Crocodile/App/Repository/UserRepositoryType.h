//
// Created by 王斌 on 2018/5/24.
// Copyright (c) 2018 Yamazhiki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC/ReactiveObjC.h>

@class User;

@protocol UserRepositoryType <NSObject>
- (RACSignal <NSArray<User *> *> *)getUsers;

- (RACSignal <User *> *)getUser:(NSInteger)uid;
@end