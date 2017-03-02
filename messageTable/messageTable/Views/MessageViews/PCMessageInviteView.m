//
//  PCMessageInviteView.m
//  messageTable
//
//  Created by Ryeagler on 2017/3/2.
//  Copyright © 2017年 Ryeagle. All rights reserved.
//

#import "PCMessageInviteView.h"

@implementation PCMessageInviteView

- (instancetype)init
{
    self = [super init];
    if (self) {
        _inviteAvatarView = [UIImageView new];
        [self.bubbleView addSubview:_inviteAvatarView];
        
        _titleLabel = [YYLabel new];
        _titleLabel.textVerticalAlignment = YYTextVerticalAlignmentTop;
        _titleLabel.clearContentsBeforeAsynchronouslyDisplay = NO;
        _titleLabel.displaysAsynchronously = YES;
        _titleLabel.ignoreCommonProperties = YES;
        _titleLabel.fadeOnHighlight = NO;
        _titleLabel.fadeOnAsynchronouslyDisplay = NO;
        [self.bubbleView addSubview:_titleLabel];
        
        _infoLabel = [YYLabel new];
        _infoLabel.textVerticalAlignment = YYTextVerticalAlignmentTop;
        _infoLabel.clearContentsBeforeAsynchronouslyDisplay = NO;
        _infoLabel.displaysAsynchronously = YES;
        _infoLabel.ignoreCommonProperties = YES;
        _infoLabel.fadeOnHighlight = NO;
        _infoLabel.fadeOnAsynchronouslyDisplay = NO;
        [self.bubbleView addSubview:_infoLabel];
    }
    
    return self;
}


- (void)setLayout:(PCMessageLayout *)layout
{
    [super setLayout:layout];
}


@end
