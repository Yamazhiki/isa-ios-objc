//
// Created by Yamazhiki on 31/05/2018.
// Copyright (c) 2018 Yamazhiki. All rights reserved.
//

#import "AliPusher.h"


@implementation AliPusher {

}
- (RACSignal<NSNumber *> *)pushStatus {
    return [RACSignal return:@(LiveStreamPushStatusFinish)];
}

- (void)preview {

}

- (void)push:(NSURL *)url {

}

@end