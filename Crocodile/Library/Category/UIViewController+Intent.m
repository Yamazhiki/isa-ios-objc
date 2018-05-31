//
// Created by Yamazhiki on 31/05/2018.
// Copyright (c) 2018 Yamazhiki. All rights reserved.
//

#import <CloudKit/CloudKit.h>
#import "UIViewController+Intent.h"
#import "Intent.h"

@interface RouterNode: NSObject
@property(readonly) UIViewController *controller;
- (instancetype)initWithController:(UIViewController *)vc;
@end

@implementation RouterNode
- (instancetype)initWithController:(UIViewController *)vc {
    self = [super init];
    _controller = vc;
    return self;
}

@end

@implementation UIViewController (Intent)


- (void)push {

}
- (void)pop {

}

- (void)onRequestResult:(Intent *)intent {

}

@end