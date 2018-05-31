//
// Created by Yamazhiki on 31/05/2018.
// Copyright (c) 2018 Yamazhiki. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Intent<__covariant ValueType>: NSObject
@property(readonly) ValueType data;

- (instancetype)initWithData:(id)data;

@end