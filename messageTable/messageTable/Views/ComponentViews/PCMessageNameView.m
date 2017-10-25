//
//  PCMessageNameView.m
//  messageTable
//
//  Created by Ryeagler on 2017/2/28.
//  Copyright © 2017年 Ryeagle. All rights reserved.
//

#import "PCMessageNameView.h"

@implementation PCMessageNameView

- (instancetype)init
{
    self = [super init];
    if (self) {
        _identityButton = [UIButton new];
        _identityButton.userInteractionEnabled = NO;
        [_identityButton.titleLabel setFont:[UIFont systemFontOfSize:PCMessageNameFontSize]];
        [self addSubview:_identityButton];
        
        _nameLabel = [YYLabel new];
        _nameLabel.textVerticalAlignment = YYTextVerticalAlignmentCenter;
        _nameLabel.clearContentsBeforeAsynchronouslyDisplay = NO;
        _nameLabel.displaysAsynchronously = YES;
        _nameLabel.ignoreCommonProperties = YES;
        _nameLabel.fadeOnHighlight = NO;
        _nameLabel.fadeOnAsynchronouslyDisplay = NO;
        [self addSubview:_nameLabel];
    }
    
    return self;
}

@end
