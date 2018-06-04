//
// Created by Yamazhiki on 04/06/2018.
// Copyright (c) 2018 Yamazhiki. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ServerError: NSObject
@property(readonly) NSInteger code;
@property(readonly) NSString *message;
@property(readonly) NSString *documentUrl;

- (instancetype)initWithData:(NSData *)data;

@end