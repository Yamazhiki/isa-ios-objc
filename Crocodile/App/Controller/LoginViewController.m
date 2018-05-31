//
// Created by 王斌 on 2018/5/23.
// Copyright (c) 2018 Yamazhiki. All rights reserved.
//
#import <ReactiveObjC/ReactiveObjC.h>
#import "LoginViewController.h"
#import "LoginViewModel.h"
#import "AppEnvironment.h"
#import "Environment.h"
#import "AccountValidatorImp.h"

@implementation LoginViewController {
    __weak IBOutlet UITextField *_usernameOutlet;
    __weak IBOutlet UITextField *_passwordOutlet;
    __weak IBOutlet UIButton *_submitOutlet;
    __weak IBOutlet UIButton *_userDetailOutlet;
    __weak IBOutlet UIButton *_closeOutlet;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    LoginViewModel *viewModel =
        [[LoginViewModel alloc] initWithClient:[AppEnvironment shared].current.api validator:[AccountValidatorImp new]];
    RAC(viewModel, username) = _usernameOutlet.rac_textSignal;
    RAC(viewModel, password) = _passwordOutlet.rac_textSignal;
    _submitOutlet.rac_command = viewModel.submitCmd;

    [viewModel.submitCmd.executionSignals subscribeNext:^(RACSignal *x) {
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
