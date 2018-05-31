//
// Created by 王斌 on 2018/5/24.
// Copyright (c) 2018 Yamazhiki. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ApiClient;
@class User;
@protocol LiveStreamPusherType;
@protocol LiveStreamBeautyType;
@protocol UserType;
@protocol ApiClientType;

@interface Environment: NSObject

@property(readonly) id<UserType> user;
@property(readonly) id<ApiClientType> api;
@property(readonly) id<LiveStreamPusherType> liveSteam;
@property(readonly) id<LiveStreamBeautyType> beauty;
/**
 * 构造
 * @param user  当前用户
 * @param api   Api配置
 * @param liveStream 推流
 * @param beauty 美颜
 * @return Environment
 */
- (instancetype)initWithUser:(id<UserType>)user
                         api:(id<ApiClientType>)api
                  liveStream:(id<LiveStreamPusherType>)liveStream
                      beauty:(id<LiveStreamBeautyType>)beauty;
@end
