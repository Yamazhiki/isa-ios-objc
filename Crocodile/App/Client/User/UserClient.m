//
// Created by Yamazhiki on 01/06/2018.
// Copyright (c) 2018 Yamazhiki. All rights reserved.
//

#import <ReactiveObjC/RACSignal.h>
#import <ReactiveObjC/RACDisposable.h>
#import <ReactiveObjC/RACSubscriber.h>
#import <Foundation/Foundation.h>
#import "UserClient.h"
#import "User.h"
#import "Request.h"
#import "Decodable.h"
#import "DataStatus.h"
#import "UserDetailRequest.h"
#import "NSMutableURLRequest+Request.h"
#import "NSData+Object.h"
#import "UsersRequest.h"
#define USER_HOST  @"https://api.github.com/"

@implementation UserClient {

}


- (nonnull RACSignal <User *> *)userById:(NSInteger)uid {
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSURLSessionDataTask *task =
            [self send:[[UserDetailRequest alloc] initWithUID:uid] completion:^(NSData *data, NSError *error) {
                [subscriber sendNext:[[User alloc] initWithDictionary:data.dictionary]];
            }];
        return [RACDisposable disposableWithBlock:^{
            [task cancel];
        }];
    }];
}
- (nonnull RACSignal <DataStatus<NSArray<User *> *> *> *)users:(NSInteger)page {
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSURLSessionDataTask *task = [self send:[UsersRequest new] completion:^(NSData *data, NSError *error) {
            id users = [User fromData:data];
            [subscriber sendNext:[[DataStatus alloc] initWithData:users error:error]];
            [subscriber sendCompleted];
        }];
        return [RACDisposable disposableWithBlock:^{
            [task cancel];
        }];
    }];
}

@end