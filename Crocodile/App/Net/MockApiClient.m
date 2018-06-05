//
// Created by Yamazhiki on 31/05/2018.
// Copyright (c) 2018 Yamazhiki. All rights reserved.
//

#import <ReactiveObjC/RACSignal.h>
#import "MockApiClient.h"
#import "User.h"


@implementation MockApiClient {

}
- (RACSignal *)users {
    return [RACSignal return:@[
        [[User alloc] initWithUID:1 name:@"Yamazhiki"],
        [[User alloc] initWithUID:2 name:@"ISA"]]];
}
- (RACSignal *)userById:(NSInteger)uid {
    return [RACSignal return:[[User alloc] initWithUID:uid name:@"Test"]];
}

@end