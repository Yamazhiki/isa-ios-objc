//
// Created by 王斌 on 2018/5/23.
// Copyright (c) 2018 Yamazhiki. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AccountValidatorType <NSObject>
- (BOOL)invalidateUsername:(NSString *)src;

- (BOOL)invalidatePassword:(NSString *)src;
@end