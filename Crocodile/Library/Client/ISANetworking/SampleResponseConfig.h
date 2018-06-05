//
// Created by Yamazhiki on 05/06/2018.
// Copyright (c) 2018 Yamazhiki. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SampleResponseConfig: NSObject

@property(readonly) NSTimeInterval time;

- (instancetype)initWithTime:(NSTimeInterval)time;
@end