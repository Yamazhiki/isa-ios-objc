//
// Created by Yamazhiki on 01/06/2018.
// Copyright (c) 2018 Yamazhiki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Request.h"


@interface UserDetailRequest: NSObject<Request>

- (instancetype)initWithUID:(int)uid;

@end