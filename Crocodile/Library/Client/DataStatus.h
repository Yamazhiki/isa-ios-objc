//
// Created by Yamazhiki on 04/06/2018.
// Copyright (c) 2018 Yamazhiki. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DataStatus<__covariant T>: NSObject

@property(readonly) NSError *error;
@property(readonly) T data;

- (instancetype)initWithData:(T)data error:(NSError *)error;

- (T)data;

@end