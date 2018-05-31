//
// Created by Yamazhiki on 31/05/2018.
// Copyright (c) 2018 Yamazhiki. All rights reserved.
//

#import "TxLiveStream.h"


@implementation TxLiveStream {

}
- (RACSignal<NSNumber *> *)pushStatus {
    return [RACSignal return:@(LiveStreamPushStatusFinish)];
}

- (void)preview {

}

- (void)push:(NSURL *)url {

}

- (void)setBuffing:(CGFloat)value {

}


@end