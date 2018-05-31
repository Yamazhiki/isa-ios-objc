//
// Created by 王斌 on 2018/5/24.
// Copyright (c) 2018 Yamazhiki. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <pthread.h>
#import <ReactiveObjC/RACSubject.h>
#import "AppEnvironment.h"
#import "Environment.h"
#import "User.h"
#import "ApiClient.h"
#import "TokenCheckInjector.h"
#import "ClientConfigImp.h"
#import "AliPusher.h"
#import "TxLiveStream.h"
#import "UserType.h"
#import "MockApiClient.h"

static pthread_rwlock_t lock = PTHREAD_RWLOCK_INITIALIZER;

typedef struct {
    AppMode mode;
    AppLiveStreamSDKType liveStreamPusher;
} AppCurrentStatus;

static AppCurrentStatus status = {AppModeDebug, AppLiveStreamSDKTypeTx};

@interface AppEnvironment (Private)
- (Environment *)genEnv;
- (id<ApiClientType>)genApiFrom:(AppMode)mode;
- (id<LiveStreamPusherType>)genLiveStreamFrom:(AppLiveStreamSDKType)type;
@end

@implementation AppEnvironment {
    NSMutableArray<Environment *> *_stack;
    RACSubject *_sessionUpdateSubject;

}

+ (instancetype)shared {
    static AppEnvironment *_instance;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        _instance = [[AppEnvironment alloc] init];
    });
    return _instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _stack = [NSMutableArray array];
        _sessionUpdateSubject = [RACSubject subject];
        [_stack addObject:[self genEnv]];
    }
    return self;
}

- (RACSignal *)sessionUpdate {
    return _sessionUpdateSubject;
}

- (void)switchMode:(AppMode)mode {
    status.mode = mode;
    Environment *env = [[Environment alloc] initWithUser:self.current.user
                                                     api:[self genApiFrom:mode]
                                              liveStream:self.current.liveSteam
                                                  beauty:self.current.beauty];
    [self _replaceEnv:env];
}

- (Environment *)current {
    pthread_rwlock_rdlock(&lock);
    Environment *env = _stack.lastObject;
    pthread_rwlock_unlock(&lock);
    return env;

}

- (void)updateUser:(id<UserType>)user {
    Environment *env =
        [[Environment alloc]
            initWithUser:user api:self.current.api liveStream:self.current.liveSteam beauty:self.current.beauty];
    [self _replaceEnv:env];
    [_sessionUpdateSubject sendNext:@(user && user.uid > 0 ? UserEventTypeUpdate : UserEventTypeLogout)];
}

- (void)switchLiveStream:(AppLiveStreamSDKType)sdkType {
    id<LiveStreamPusherType> liveStream = [self genLiveStreamFrom:sdkType];
    Environment *env = [[Environment alloc] initWithUser:self.current.user
                                                     api:self.current.api
                                              liveStream:liveStream
                                                  beauty:self.current.beauty];
    [self _replaceEnv:env];
}

- (void)_replaceEnv:(Environment *)env {
    pthread_rwlock_wrlock(&lock);
    [_stack addObject:env];
    [_stack removeObjectAtIndex:_stack.count - 2];
    pthread_rwlock_unlock(&lock);
}

@end

@implementation AppEnvironment (Private)
- (Environment *)genEnv {
    ApiClient *client = [self genApiFrom:status.mode];
    id<LiveStreamPusherType> liveStream = [self genLiveStreamFrom:status.liveStreamPusher];
    return [[Environment alloc] initWithUser:nil api:client liveStream:liveStream beauty:nil];
}
- (id<ApiClientType>)genApiFrom:(AppMode)mode {
    switch (mode) {
        case AppModeSimulate:return [MockApiClient new];
        default: {
            TokenCheckInjector *tokenChecker = [[TokenCheckInjector alloc] initWithObserver:_sessionUpdateSubject];
            ApiClient *client = [[ApiClient alloc] initWithConfig:[[ClientConfigImp alloc] initWithMode:mode]];
            [client addInjector:tokenChecker];
            return client;
        }
    }
}

- (id<LiveStreamPusherType>)genLiveStreamFrom:(AppLiveStreamSDKType)type {
    switch (type) {

        case AppLiveStreamSDKTypeAli:return [[AliPusher alloc] init];
        default:
        AppLiveStreamSDKTypeTx:
            return [[TxLiveStream alloc] init];
    }
}
@end
