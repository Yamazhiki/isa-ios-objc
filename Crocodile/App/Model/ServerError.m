//
// Created by Yamazhiki on 04/06/2018.
// Copyright (c) 2018 Yamazhiki. All rights reserved.
//

#import <CloudKit/CloudKit.h>
#import "ServerError.h"


@implementation ServerError {

}
- (instancetype)initWithData:(NSData *)data {
    self = [super init];
    NSError *error;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    if (!error && dic) {
        _code = [dic[@"code"] integerValue];
        _message = [dic[@"message"] stringValue];
    }
    return self;
}

@end