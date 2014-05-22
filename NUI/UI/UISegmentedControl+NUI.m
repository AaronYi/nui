//
//  UISegmentedControl+NUI.m
//  NUIDemo
//
//  Created by Tom Benner on 12/9/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import "UISegmentedControl+NUI.h"

@implementation UISegmentedControl (NUI)

- (void)initNUI
{
    if (!self.nuiClass) {
        self.nuiClass = @"SegmentedControl";
    }
}

- (void)applyNUI
{
    [self initNUI];
    if (![self.nuiClass isEqualToString:kNUIClassNone]) {
        if ([self respondsToSelector:@selector(willApplyNUI)]) {
            [self willApplyNUI];
        }
        [NUIRenderer renderSegmentedControl:self withClass:self.nuiClass];
        if ([self respondsToSelector:@selector(didApplyNUI)]) {
            [self didApplyNUI];
        }
    }
    self.nuiApplied = YES;
}

- (void)override_didMoveToWindow
{
    if (!self.isNUIApplied) {
        [self applyNUI];
    }
    [self override_didMoveToWindow];
}

@end
