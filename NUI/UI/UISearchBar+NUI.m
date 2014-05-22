//
//  UISearchBar+NUI.m
//  NUIDemo
//
//  Created by Tom Benner on 1/11/13.
//  Copyright (c) 2013 Tom Benner. All rights reserved.
//

#import "UISearchBar+NUI.h"

@implementation UISearchBar (NUI)

- (void)initNUI
{
    if (!self.nuiClass) {
        self.nuiClass = @"SearchBar";
    }
}

- (void)applyNUI
{
    [self initNUI];
    if (![self.nuiClass isEqualToString:kNUIClassNone]) {
        if ([self respondsToSelector:@selector(willApplyNUI)]) {
            [self willApplyNUI];
        }
        [NUIRenderer renderSearchBar:self withClass:self.nuiClass];
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
