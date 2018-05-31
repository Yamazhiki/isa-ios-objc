//
// Created by 王斌 on 2018/5/24.
// Copyright (c) 2018 Yamazhiki. All rights reserved.
//

#import <ReactiveObjC/RACSignal+Operations.h>
#import <ReactiveObjC/RACChannel.h>
#import "UserRepositoryImp.h"
#import "User.h"
#import "HttpClient.h"

@implementation UserRepositoryImp {
    HttpClient *_manager;
}

- (instancetype)init {
    self = [super init];
    if (self) {
    }
    return self;
}

- (instancetype)initWithManager:(HttpClient *)manager {
    self = [self init];
    if (self) {
        _manager = manager;
    }
    return self;
}

- (RACSignal <NSArray<User *> *> *)getUsers {
    return [[_manager GET:@"users" parameters:nil]
        map:^id(id value) {
          NSMutableArray *array = [NSMutableArray array];
          for (NSDictionary *item in value) {
              [array addObject:[[User alloc] initWithDictionary:item]];
          }
          return array;
        }];
}

- (RACSignal <User *> *)getUser:(NSInteger)uid {

    return [[_manager GET:[NSString stringWithFormat:@"user/%d", uid] parameters:nil] map:^id(id value) {
      return [[User alloc] initWithDictionary:value];
    }];

    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
      [subscriber sendNext:[[User alloc] init]];
      [subscriber sendCompleted];
      return nil;
    }];
}

- (void)dealloc {

}

@end