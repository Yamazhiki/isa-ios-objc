//
// Created by 王斌 on 2018/5/23.
// Copyright (c) 2018 Yamazhiki. All rights reserved.
//

#import "AccountValidatorImp.h"


@implementation AccountValidatorImp {

}

- (BOOL)invalidateUsername:(NSString *)src {
    return [src isEqualToString:@"admin"];
}

- (BOOL)invalidatePassword:(NSString *)src {
    return [src isEqualToString:@"123"];
}
@end