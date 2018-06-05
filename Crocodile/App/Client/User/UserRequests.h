//
// Created by Yamazhiki on 05/06/2018.
// Copyright (c) 2018 Yamazhiki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Request.h"
#import "StubResponseType.h"

@interface UserDetailRequest: NSObject<Request, StubResponseType>
- (instancetype)initWithUID:(NSInteger)uid;
@end

@interface UsersRequest: NSObject<Request>
@end
