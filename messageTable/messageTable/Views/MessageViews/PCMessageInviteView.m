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
    PCMessageInviteLayout *inviteLayout = layout.contentLayout;

    _inviteAvatarView.frame = inviteLayout.inviteAvatarRect;
    self.bubbleView.type = [PCMessageAvatarBubble avatarBubbleType:layout.messageModel];
    [_inviteAvatarView sd_setImageWithURL:[NSURL URLWithString:[layout.messageModel.invite_avatar stringByAppendingFormat:@"%@",[PCSetImageSizeManager componentStrWithImageWidth:PCMessageInviteAvatarWidth height:PCMessageInviteAvatarWidth]]] placeholderImage:[UIImage imageNamed:@"default_avatar"]];
    
    _titleLabel.frame = inviteLayout.titleRect;
    _titleLabel.textLayout = inviteLayout.titleTextLayout;
    
    _infoLabel.frame = inviteLayout.infoRect;
    _infoLabel.textLayout = inviteLayout.infoTextLayout;
}

#pragma mark Gesture Action
- (void)bubbleTapAction:(UITapGestureRecognizer *)gesture
{
    self.bubbleView.highlighted = YES;
    
    __weak typeof(self) weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        weakSelf.bubbleView.highlighted = NO;
    });
    
    NSLog(@"Invite Mesage Tap...");
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(receiveViewEvent:layout:object:)]) {
        [self.delegate receiveViewEvent:PCChannelInviteTapEvent layout:self.layout object:nil];
    }
}

@end
