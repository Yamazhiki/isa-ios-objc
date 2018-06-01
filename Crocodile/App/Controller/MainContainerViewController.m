//
// Created by Yamazhiki on 31/05/2018.
// Copyright (c) 2018 Yamazhiki. All rights reserved.
//

#import <ReactiveObjC/RACSignal+Operations.h>
#import <ReactiveObjC/UIControl+RACSignalSupport.h>
#import "MainContainerViewController.h"
#import "MainContainerViewModel.h"
#import "AppEnvironment.h"
#import "UserClient.h"

@implementation MainContainerViewController {

    __weak IBOutlet UILabel *statusOutlet;
    __weak IBOutlet UIButton *logoutOutlet;
    __weak IBOutlet UIButton *switchOutlet;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    MainContainerViewModel *viewModel = [[MainContainerViewModel alloc] init];

    [[[AppEnvironment shared] sessionUpdate] subscribeNext:^(id x) {
        NSLog(@"%@", x);
    }];

    UserClient *client = [[UserClient alloc] init];
    [[client userById:1] subscribeNext:^(id x) {

    }];

    [viewModel.sessionUpdate subscribeNext:^(id x) {
        BOOL isLogin = [x boolValue];
        if (isLogin) {
            self->statusOutlet.text = @"登录";
        } else {
            self->statusOutlet.text = @"没有登录";
        }
    }];

    [[switchOutlet rac_signalForControlEvents:UIControlEventTouchUpInside]
        subscribeNext:^(__kindof UIControl *x) {
            [[AppEnvironment shared] switchMode:AppModeSimulate];
        }];

    [[logoutOutlet rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl *x) {
        [[AppEnvironment shared] updateUser:nil];
    }];
}

@end
