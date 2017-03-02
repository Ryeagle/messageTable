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
    _contentViewTop = 0;
    _contentViewLeft = 0;
    _contentViewWidth = 0;
    _contentViewHeight = 0;
    _timeViewTop = 0;
    _timeViewLeft = 0;
}

- (void)setLayout
{    
    [self setNameLayout];
    
    if (_shouldShowTime) {
        [self setTimeLayout];
        _avatarViewTop = _timeViewTop + _timeViewLayout.viewHeight + PCMessageTimeBottomPadding;
    } else {
        _avatarViewTop = PCMessageTopPadding;
    }
    
    [self setContentLayout];
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

#pragma mark Set Content Layout
- (void)setContentLayout
{
    PCMessageMediaType mediaType = _messageModel.media_type;
    
    BOOL hasAvatar = YES;
    if (_messageModel.message_type == PCMessageTypeService) {
        self.contentLayout = [[PCMessageServiceLayout alloc]initWithMessageModel:_messageModel];
        hasAvatar = NO;
    } else if (mediaType == PCMessageMediaTypeText) {
        self.contentLayout = [[PCMessageTextViewLayout alloc]initWithMessageModel:_messageModel];
    } else if (mediaType == PCMessageMediaTypePhoto){
        self.contentLayout = [[PCMessagePhotoViewLayout alloc]initWithMessageModel:_messageModel];
    } else if (mediaType == PCMessageMediaTypeFriendVerify) {
        self.contentLayout = [[PCMessageFriendVerifyLayout alloc]initWithMessageModel:_messageModel];
        hasAvatar = NO;
    } else if (mediaType == PCMessageMediaTypeInvite) {
        self.contentLayout = [[PCMessageInviteLayout alloc] initWithMessageModel:_messageModel];
    } else if (mediaType == PCMessageMediaTypeWebLink) {
        self.contentLayout = [[PCMessageWebLinkLayout alloc] initWithMessageModel:_messageModel];
    } else if (mediaType == PCMessageMeidaTypeWalletAssistant) {
        self.contentLayout = [[PCMessageWalletAssistantLayout alloc] initWithMessageModel:_messageModel];
        hasAvatar = NO;
    } else if (mediaType == PCMessageMediaTypePhotoText) {
        self.contentLayout = [[PCMessagePhotoTextLayout alloc] initWithMessageModel:_messageModel];
        hasAvatar = NO;
    } else if (mediaType == PCMessageMediaTypeRender) {
        self.contentLayout = [[PCMessageRenderLayout alloc] initWithMessageModel:_messageModel];
    } else if (mediaType == PCMessageMediaTypeCombination) {
        self.contentLayout = [[PCMessageCombinationLayout alloc] initWithMessageModel:_messageModel];
    } else if (mediaType == PCMessageMediaTypeAudio) {
        self.contentLayout = [[PCMessageAudioLayout alloc] initWithMessageModel:_messageModel];
    } else if (mediaType == PCMessageMediaTypeMyCard) {
        self.contentLayout = [[PCMessageMyCardLayout alloc] initWithMessageModel:_messageModel];
    } else if (mediaType == PCMessageMediaTypePersonCard) {
        self.contentLayout = [[PCMessageFriendCardLayout alloc] initWithMessageModel:_messageModel];
    }

    if (self.contentLayout && [self.contentLayout respondsToSelector:@selector(contentWidth)] && [self.contentLayout respondsToSelector:@selector(contentHeight)]) {
        if (hasAvatar) {
            if (_messageModel.message_bubble_type == PCMessageBubbleTypeSending) {
                _avatarViewLeft = PCMessageAvatarSenderLeft;
                _contentViewLeft = _avatarViewLeft - PCMessageBubbleAvatarPadding - [self.contentLayout contentWidth];
            } else {
                _avatarViewLeft = PCMessageAvatarReceiverLeft;
                _contentViewLeft = PCMessageAvatarReceiverLeft + PCMessageAvatarSize + PCMessageBubbleAvatarPadding;
            }
            
            _contentViewTop = _avatarViewTop;
            _contentViewHeight = [self.contentLayout contentHeight];
            _contentViewWidth = [self.contentLayout contentWidth];
            
            _height = _contentViewTop + _contentViewHeight + PCMessageTopPadding + PCMessageTopPadding;
        } else {
            _contentViewWidth = [self.contentLayout contentWidth];
            _contentViewHeight = [self.contentLayout contentHeight];
            _contentViewTop = _timeViewTop + _timeViewLayout.viewHeight + PCMessageTimeBottomPadding;
            _contentViewLeft = (SCREEN_WIDTH - _contentViewWidth) / 2;
            
            _height = _contentViewTop + _contentViewHeight + PCMessageBottomPadding;
        }
    }
}   

@end
