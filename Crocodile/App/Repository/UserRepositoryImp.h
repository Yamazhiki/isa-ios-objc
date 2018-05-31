//
// Created by 王斌 on 2018/5/24.
// Copyright (c) 2018 Yamazhiki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserRepositoryType.h"

@class HttpClient;


@interface UserRepositoryImp : NSObject <UserRepositoryType>
- (instancetype)initWithManager:(HttpClient *)manager;
@end