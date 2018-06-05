//
// Created by Yamazhiki on 31/05/2018.
// Copyright (c) 2018 Yamazhiki. All rights reserved.
//

#import <ReactiveObjC/RACSignal.h>
#import <ReactiveObjC/RACSignal+Operations.h>
#import <ReactiveObjC/RACSubject.h>
#import "MainContainerViewModel.h"
#import "AppEnvironment.h"
#import "Environment.h"
#import "UserType.h"
#import "UserClient.h"

@implementation MainContainerViewModel {
    RACSubject *_viewWillAppearSubject;
}

- (instancetype)init {
    self = [super init];
    _viewWillAppearSubject = RACSubject.subject;
    RACSignal *userSignal =
        [[AppEnvironment shared].sessionUpdate merge:[RACSignal return:[AppEnvironment shared].current.user]];

    _sessionUpdate = [userSignal map:^id(id value) {
        return @([AppEnvironment shared].current.user && [AppEnvironment shared].current.user.uid > 0);
    }];

    _user = [_viewWillAppearSubject flattenMap:^RACSignal *(id value) {
        return [[[UserClient alloc] init] userById:1];
    }];

    return self;
}
- (void)viewWillAppear {
    [_viewWillAppearSubject sendNext:nil];
}

@end