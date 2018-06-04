//
// Created by Yamazhiki on 31/05/2018.
// Copyright (c) 2018 Yamazhiki. All rights reserved.
//

#import <Foundation/Foundation.h>
@class RACSignal;

@interface MainContainerViewModel: NSObject

@property(readonly) RACSignal *user;
@property(readonly) RACSignal *sessionUpdate;

- (void)viewWillAppear;

@end