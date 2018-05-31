//
// Created by 王斌 on 2018/5/26.
// Copyright (c) 2018 Yamazhiki. All rights reserved.
//

#import <PDFKit/PDFKit.h>
#import "LoginViewModel.h"
#import "AccountValidatorImp.h"
#import "UserRepositoryImp.h"
#import "HttpClient.h"

@implementation LoginViewModel
{
}

- (instancetype)initWithClient:(HttpClient *)client {
    self = [super init];
    AccountValidatorImp *imp = [[AccountValidatorImp alloc] init];
    id<UserRepositoryType> repository = [[UserRepositoryImp alloc] initWithManager:client];
    RACSignal *correctInput;
    correctInput = [[RACObserve(self, username) combineLatestWith:RACObserve(self, password)]
        map:^id(RACTwoTuple *value) {
            return @([imp invalidateUsername:value.first] && [imp invalidatePassword:value.second]);
        }];

    _submitCmd = [[RACCommand alloc] initWithEnabled:correctInput signalBlock:^RACSignal *(id input) {
        return [repository getUser:1];
    }];
    return self;
}

@end