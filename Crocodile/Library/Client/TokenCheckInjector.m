//
// Created by 王斌 on 2018/5/24.
// Copyright (c) 2018 Yamazhiki. All rights reserved.
//

#import <ReactiveObjC/RACChannel.h>
#import "TokenCheckInjector.h"


@implementation TokenCheckInjector {
    id<RACSubscriber> _tokenExpire;
}
- (instancetype)initWithObserver:(id<RACSubscriber>)observer {
    self = [super init];
    if (self) {
        _tokenExpire = observer;
    }
    return self;
}

- (void)finishResponse:(NSHTTPURLResponse *)response responseObject:(id)responseObject {
    if (response.statusCode == 403) {
        [_tokenExpire sendNext:@1];
    }
}

@end