//
// Created by Yamazhiki on 04/06/2018.
// Copyright (c) 2018 Yamazhiki. All rights reserved.
//

#import "NSData+Object.h"


@implementation NSData (Object)
- (id)dictionary {
    NSError *error;
    NSDictionary *dic =
        [NSJSONSerialization JSONObjectWithData:self options:NSJSONReadingAllowFragments error:&error];
    if (!error) {
        return nil;
    }
    return dic;
}
@end