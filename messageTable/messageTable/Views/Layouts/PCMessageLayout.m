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
    PCMessageMediaType meidaType = _messageModel.media_type;
    
    if (_messageModel.message_type == PCMessageTypeService) {
        self.contentLayout = [[PCMessageServiceLayout alloc]initWithMessageModel:_messageModel];
    } else if (meidaType == PCMessageMediaTypeText) {
        self.contentLayout = [[PCMessageTextViewLayout alloc]initWithMessageModel:_messageModel];
    } else if (meidaType == PCMessageMediaTypePhoto){
        self.contentLayout = [[PCMessagePhotoViewLayout alloc]initWithMessageModel:_messageModel];
    } else if (meidaType == PCMessageMediaTypeFriendVerify) {
        self.contentLayout = [[PCMessageFriendVerifyLayout alloc]initWithMessageModel:_messageModel];
    }
    
    if (self.contentLayout && [self.contentLayout respondsToSelector:@selector(messageContentLayout:)]) {
        [self.contentLayout messageContentLayout:self];
    }
}   

@end
