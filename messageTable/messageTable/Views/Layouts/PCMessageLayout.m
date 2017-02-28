//
//  PCMessageLayout.m
//  messageTable
//
//  Created by Ryeagler on 2017/2/27.
//  Copyright © 2017年 Ryeagle. All rights reserved.
//

#import "PCMessageLayout.h"

@implementation PCMessageLayout

- (instancetype)initWithMessageModel:(PCMessageModel *)messageModel
{
    self = [super init];
    
    if (self) {
        _messageModel = messageModel;
        [self reset];
#warning 临时写这里
        _shouldShowTime = YES;
        [self setLayout];
    }
    
    return self;
}

- (void)reset
{
    _height = 0;
    _avatarViewLeft = 0;
    _avatarBubbleViewTop = 0;
    _avatarBubbleViewLeft = 0;
    _avatarBubbleViewWidth = 0;
    _avatarBubbleViewHeight = 0;
    _timeViewTop = 0;
    _timeViewLeft = 0;
}

- (void)setLayout
{
    _bubbleType = [PCMessageAvatarBubble componentBubbleType:_messageModel];
    
    [self setNameLayout];
    
    if (_shouldShowTime) {
        [self setTimeLayout];
        _avatarViewTop = _timeViewTop + _timeViewLayout.viewHeight + PCMessageTimeBottomPadding;
    } else {
        _avatarViewTop = PCMessageTopPadding;
    }
    
    switch (_messageModel.media_type) {
        case PCMessageMediaTypeText:
            [self setTextMessageLayout];
            break;
            
        default:
            break;
    }
}

#pragma mark SetupLayout Name View
- (void)setNameLayout
{
#warning 项目中替换判断方式
    if (_messageModel.message_bubble_type == PCMessageBubbleTypeReceiving) {
        _nameViewLayout = [[PCMessageNameViewLayout alloc] initWithMessageModel:_messageModel];
    }
}

#pragma mark SetupLayout Time View
- (void)setTimeLayout
{
    _timeViewLayout = [[PCMessageTimeViewLayout alloc]initWithMessageModel:_messageModel];
    
    _timeViewTop = PCMessageTopPadding;
    _timeViewLeft = (SCREEN_WIDTH - _timeViewLayout.viewWidth) / 2;
}

#pragma mark SetupLayout Text Message
- (void)setTextMessageLayout
{
    _textViewLayout = [[PCMessageTextViewLayout alloc] initWithMessageModel:_messageModel];
    
    if (_messageModel.message_bubble_type == PCMessageBubbleTypeSending) {
        _avatarViewLeft = PCMessageAvatarSenderLeft;
        _avatarBubbleViewLeft = _avatarViewLeft - PCMessageBubbleAvatarPadding - _textViewLayout.viewWidth;
    } else {
        _avatarViewLeft = PCMessageAvatarReceiverLeft;
        _avatarBubbleViewLeft = PCMessageAvatarReceiverLeft + PCMessageAvatarSize + PCMessageBubbleAvatarPadding;
    }
    
    _avatarBubbleViewTop = _avatarViewTop;
    _avatarBubbleViewHeight = _textViewLayout.viewHeight;
    _avatarBubbleViewWidth = _textViewLayout.viewWidth;
    
    _height = _avatarBubbleViewTop + _avatarBubbleViewHeight + PCMessageTopPadding + PCMessageTopPadding;
}

@end
