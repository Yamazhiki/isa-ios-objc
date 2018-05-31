//
// Created by 王斌 on 2018/5/24.
// Copyright (c) 2018 Yamazhiki. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Environment;
@class RACSignal;
@class User;
@protocol UserType;
/**
 * App运行环境
 */
typedef NS_ENUM(NSInteger) {
  /*调试*/
      AppModeDebug = 0,
  /*模拟*/
      AppModeSimulate,
  /*生产*/
      AppModeProduction
} AppMode;
/**
 * 推流SDK
 */
typedef NS_ENUM(NSInteger) {
  /*阿里*/
      AppLiveStreamSDKTypeAli,
  /*腾讯*/
      AppLiveStreamSDKTypeTx
} AppLiveStreamSDKType;

typedef NS_ENUM(NSInteger) {
  UserEventTypeNone,
  UserEventTypeTokenExpired,
  UserEventTypeUpdate,
  UserEventTypeLogout
} UserEventType;

@interface AppEnvironment : NSObject

+ (instancetype)shared;

@property(readonly) Environment *current;

@property(readonly) RACSignal *sessionUpdate;

/**
 * 切换当前运行环境
 * @param mode AppMode
 */
- (void)switchMode:(AppMode)mode;

/**
 * 更新用户
 * @param user User
 */
- (void)updateUser:(id<UserType>)user;

/**
 * 切换当前直播SDK
 * @param sdkType AppLiveStreamSDKType
 */
- (void)switchLiveStream:(AppLiveStreamSDKType)sdkType;
@end
