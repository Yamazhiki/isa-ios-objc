//
// Created by Yamazhiki on 31/05/2018.
// Copyright (c) 2018 Yamazhiki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserType.h"

@interface TestUser : NSObject<UserType>

- (instancetype)initWithUID:(NSInteger)uid
                       name:(NSString *)name;
@end
