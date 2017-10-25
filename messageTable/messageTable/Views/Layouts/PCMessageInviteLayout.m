//
//  PCMessageInviteLayout.m
//  messageTable
//
//  Created by Ryeagler on 2017/3/2.
//  Copyright © 2017年 Ryeagle. All rights reserved.
//

#import "PCMessageInviteLayout.h"

@implementation PCMessageInviteLayout

- (instancetype)initWithMessageModel:(PCMessageModel *)messageModel;
{
    self = [super init];
    if (self) {
        [self reset];
        [self layout:messageModel];
    }
    
    return self;
}

- (void)reset
{
    _viewHeight = 0;
    _viewWidth = 0;
    _titleRect = CGRectZero;
    _infoRect = CGRectZero;
}

- (void)layout:(PCMessageModel *)messageModel
{
    NSMutableAttributedString *titleStr = [[NSMutableAttributedString alloc] initWithString:@"邀请你将入群聊"];
    titleStr.font = [UIFont systemFontOfSize:PCMessageInviteTitleFontSize];
    titleStr.color = [UIColor blackColor];
    
    YYTextLinePositionSimpleModifier *modifier = [YYTextLinePositionSimpleModifier new];
    modifier.fixedLineHeight = PCMessageInviteTitleFontSize * 1.2;
    YYTextContainer *titleContainer = [YYTextContainer containerWithSize:CGSizeMake(PCMessageInviteContentMaxWidth, PCMessageFriendVefiryFontSize * 1.2)];
    titleContainer.linePositionModifier = modifier;
    _titleTextLayout = [YYTextLayout layoutWithContainer:titleContainer text:titleStr];
    
    _titleRect = CGRectMake((messageModel.message_bubble_type == PCMessageBubbleTypeSending) ?PCMessageInviteInnerLeftPadding : PCMessageInviteInnerLeftPadding + PCMessageBubbleAngleWidth, PCMessageInviteInnerTopPadding, _titleTextLayout.textBoundingSize.width, _titleTextLayout.textBoundingSize.height);
    
    _inviteAvatarRect = CGRectMake(CGRectGetMinX(_titleRect), CGRectGetMaxY(_titleRect) + PCMessageInviteTitleInfoPadding, PCMessageInviteAvatarWidth, PCMessageInviteAvatarWidth);
    
    NSString *infoStr = @"";
#warning 项目中需要更改....
    if (messageModel.invite_special_type == 2) {
        infoStr = @"邀请你加入经费群,进入可以查看详情";
    } else {
        infoStr = [NSString stringWithFormat:@"邀请你加入%@,进入可以查看详情", messageModel.invite_channel_name];
    }
    
    NSMutableAttributedString *infoAtrrStr = [[NSMutableAttributedString alloc] initWithString:infoStr];
    infoAtrrStr.font = [UIFont systemFontOfSize:PCMessageInviteInfoFontSize];
    infoAtrrStr.color = AssistContentColor;
    
    YYTextLinePositionSimpleModifier *infoModifier = [YYTextLinePositionSimpleModifier new];
    infoModifier.fixedLineHeight = PCMessageInviteAvatarWidth / 3;
    YYTextContainer *infoContainer = [YYTextContainer containerWithSize:CGSizeMake(PCMessageInviteInfoMaxWidth, PCMessageInviteAvatarWidth)];
    infoContainer.truncationType = YYTextTruncationTypeEnd;
    infoContainer.maximumNumberOfRows = 3;
    infoContainer.linePositionModifier = infoModifier;
    _infoTextLayout = [YYTextLayout layoutWithContainer:infoContainer text:infoAtrrStr];
    
    _infoRect = CGRectMake(CGRectGetMaxX(_inviteAvatarRect) + PCMessageInviteInnerLeftPadding, CGRectGetMinY(_inviteAvatarRect), _infoTextLayout.textBoundingSize.width, _infoTextLayout.textBoundingSize.height);
    
    _viewWidth = PCMessageInviteContentMaxWidth + 2 * PCMessageInviteInnerLeftPadding + PCMessageBubbleAngleWidth;
    _viewHeight = PCMessageInviteInnerBottomPadding + CGRectGetMaxY(_inviteAvatarRect);
}

#pragma mark PCMessageLayoutProtol
- (CGFloat)contentWidth
{
    return _viewWidth;
}

- (CGFloat)contentHeight
{
    return _viewHeight;
}
@end
