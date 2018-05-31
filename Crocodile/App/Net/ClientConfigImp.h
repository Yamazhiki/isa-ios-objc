//
// Created by 王斌 on 2018/5/28.
// Copyright (c) 2018 Yamazhiki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ClientConfigType.h"


@interface ClientConfigImp : NSObject <ClientConfigType>

- (instancetype)initWithMode:(NSInteger)type;
@end