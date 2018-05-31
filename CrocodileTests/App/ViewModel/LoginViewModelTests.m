//
// Created by Yamazhiki on 31/05/2018.
// Copyright (c) 2018 Yamazhiki. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import <ReactiveObjC/RACSignal.h>
#import "LoginViewModel.h"
#import "ApiClient.h"
#import "AccountValidatorImp.h"

SPEC_BEGIN(LoginViewModelSpec)

        describe(@"LoginViewModel", ^{
            __block LoginViewModel *vm = nil;

            beforeEach(^{
                vm = [[LoginViewModel alloc] initWithClient:[ApiClient new] validator:[AccountValidatorImp new]];
            });

            afterEach(^{
                vm = nil;
            });

            context(@"当用户名是 admin 密码是 123 的时候", ^{
                it(@"canLogin 发射YES", ^{
                    __block BOOL result = NO;
                    vm.username = @"admin";
                    vm.password = @"123";
                    [vm.canLogin subscribeNext:^(id x) {
                        result = [x boolValue];
                    }];

                    [[theValue(result) should] beYes];
                });
            });
        });

SPEC_END
