//
// Created by 王斌 on 2018/5/26.
// Copyright (c) 2018 Yamazhiki. All rights reserved.
//

#import <PDFKit/PDFKit.h>
#import <ReactiveObjC/RACCommand.h>
#import <ReactiveObjC/RACTuple.h>
#import <ReactiveObjC/NSObject+RACPropertySubscribing.h>
#import <ReactiveObjC/RACSignal.h>
#import <ReactiveObjC/RACSignal+Operations.h>
#import <ReactiveObjC/RACSubject.h>
#import "LoginViewModel.h"
#import "ApiClient.h"
#import "AccountValidatorType.h"

@implementation LoginViewModel {

}

- (instancetype)initWithClient:(id<ApiClientType>)client validator:(id<AccountValidatorType>)validator {
    self = [super init];
    RACSignal *correctInput;

    correctInput = [[RACObserve(self, username) combineLatestWith:RACObserve(self, password)]
        map:^id(RACTwoTuple *value) {
            return @([validator invalidateUsername:value.first] && [validator invalidatePassword:value.second]);
        }];

    RACSubject *subject = RACSubject.subject;
    _canLogin = correctInput;
    _submitCmd = [[RACCommand alloc] initWithEnabled:correctInput signalBlock:^RACSignal *(id input) {
        [subject sendNext:@1];
        return [client userById:1];
    }];

    RACSignal *signal = [subject scanWithStart:@100 reduce:^id(id running, id next) {
        NSLog(@"-----%@", running);
        return @([running intValue] + [next intValue]);
    }];

    return self;
}

@end