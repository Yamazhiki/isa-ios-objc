//
// Created by Yamazhiki on 04/06/2018.
// Copyright (c) 2018 Yamazhiki. All rights reserved.
//

#import "DataStatus.h"


@implementation DataStatus {

}

- (instancetype)initWithData:(id)data error:(NSError *)error {
    self = [super init];
    _data = data;
    _error = error;
    return self;
}
@end