//
// Created by Yamazhiki on 31/05/2018.
// Copyright (c) 2018 Yamazhiki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class Intent;

@interface UIViewController (Intent)
@property(readonly) Intent *intent;

- (void)push;
- (void)pop;

- (void)onRequestResult:(Intent *)intent;
@end