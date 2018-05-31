//
// Created by 王斌 on 2018/5/23.
// Copyright (c) 2018 Yamazhiki. All rights reserved.
//
#import <ReactiveObjC/ReactiveObjC.h>
#import "LoginViewController.h"
#import "LoginViewModel.h"
#import "UserRepositoryImp.h"
#import "AppEnvironment.h"
#import "Environment.h"

@implementation LoginViewController {
    LoginViewModel *_viewModel;
    __weak IBOutlet UITextField *_usernameOutlet;
    __weak IBOutlet UITextField *_passwordOutlet;
    __weak IBOutlet UIButton *_submitOutlet;
    __weak IBOutlet UIButton *_userDetailOutlet;
    __weak IBOutlet UIButton *_closeOutlet;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    _viewModel = [[LoginViewModel alloc] initWithClient:[AppEnvironment shared].current.api];
    RAC(_viewModel, username) = _usernameOutlet.rac_textSignal;
    RAC(_viewModel, password) = _passwordOutlet.rac_textSignal;
    _submitOutlet.rac_command = _viewModel.submitCmd;

    [_viewModel.submitCmd.executionSignals subscribeNext:^(RACSignal *x) {
        [x subscribeNext:^(id x) {
            [[AppEnvironment shared] updateUser:x];
        }];
    }];

    @weakify(self)
    [[_closeOutlet rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl *x) {
        @strongify(self)
        [self dismissViewControllerAnimated:true completion:nil];
    }];

}

@end
