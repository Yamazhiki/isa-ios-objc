//
// Created by 王斌 on 2018/5/24.
// Copyright (c) 2018 Yamazhiki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserType.h"

@interface User: NSObject<UserType>

@property(readonly) NSString *name;

- (instancetype)initWithUID:(NSInteger)uid name:(NSString *)name;
- (instancetype)initWithDictionary:(NSDictionary *)src;

@end