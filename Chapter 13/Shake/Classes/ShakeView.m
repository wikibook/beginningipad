//
//  ShakeView.m
//  Shake
//
//  Created by Wei-Meng Lee on 3/6/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import "ShakeView.h"


@implementation ShakeView


- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)dealloc {
    [super dealloc];
}

- (BOOL)canBecomeFirstResponder {
    return YES;
}

@end
