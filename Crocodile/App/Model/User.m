//
// Created by 王斌 on 2018/5/24.
// Copyright (c) 2018 Yamazhiki. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import <CloudKit/CloudKit.h>
#import "User.h"
#import "NSData+Object.h"

@implementation User {
}

@synthesize uid;
@synthesize name;

- (instancetype)initWithUID:(NSInteger)uid1 name:(NSString *)name1 {
    self = [super init];
    uid = uid1;
    name = name1;
    return self;
}
- (instancetype)initWithDictionary:(NSDictionary *)src {
    self = [super init];
    if (self) {
        uid = [src[@"id"] integerValue];
        name = src[@"login"];
    }
    return self;
}

- (id)decode:(id)data {
    id obj = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    return [[User alloc] initWithDictionary:obj];
}

- (NSArray <User *> *)fromData:(NSData *)data {
    return nil;
}
+ (NSArray <User *> *)fromData:(NSData *)data {
    NSArray <NSDictionary *> *objects = data.object;
    NSMutableArray *rlt = [NSMutableArray array];
    [objects enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL *stop) {
        [rlt addObject:[[User alloc] initWithDictionary:obj]];
    }];
    return rlt;
}

@end
