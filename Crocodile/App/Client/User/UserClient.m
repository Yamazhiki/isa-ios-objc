//
// Created by Yamazhiki on 01/06/2018.
// Copyright (c) 2018 Yamazhiki. All rights reserved.
//

#import <ReactiveObjC/RACSignal.h>
#import <ReactiveObjC/RACDisposable.h>
#import <ReactiveObjC/RACSubscriber.h>
#import <Foundation/Foundation.h>
#import "UserClient.h"
#import "User.h"
#import "Request.h"
#import "Decodable.h"
#import "UserDetailRequest.h"
#import "NSMutableURLRequest+Request.h"
#define USER_HOST  @"https://api.github.com/"

@implementation UserClient {

}

- (NSURLSessionDataTask *)send:(id<Request>)request completion:(void (^)(id))completion {
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc]
        initWithRequest:request baseURL:USER_HOST];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *rlt = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData *data,
                                                                                            NSURLResponse *response,
                                                                                            NSError *error) {
        if (error) {
            completion(nil);
        }
        if ([request.cls conformsToProtocol:@protocol(Decodable)]) {
            id<Decodable> entity = (id<Decodable>) [[request.cls alloc] init];
            completion([entity decode:data]);
        } else {

        }
    }];
    [rlt resume];
    return rlt;
}

- (RACSignal *)userById:(NSInteger)uid {
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSURLSessionDataTask *task = [self send:[[UserDetailRequest alloc] initWithUID:uid] completion:^(User *user) {
            [subscriber sendNext:user];
            [subscriber sendCompleted];
        }];
        return [RACDisposable disposableWithBlock:^{
            [task cancel];
        }];
    }];
}

@end