//
// Created by Yamazhiki on 31/05/2018.
// Copyright (c) 2018 Yamazhiki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC/ReactiveObjC.h>

typedef NS_ENUM(NSInteger) {
  LiveStreamPushStatusNone,
  LiveStreamPushStatusFinish,
} LiveStreamPushStatus;

@protocol LiveStreamPusherType<NSObject>

/**
 * 推流状态  LiveStreamPushStatus
 */
@property(readonly) RACSignal<NSNumber *> *pushStatus;

/**
 * 预览
 */
- (void)preview;

/**
 * 推流
 * @param url 推流地址
 */
- (void)push:(NSURL *)url;
@end