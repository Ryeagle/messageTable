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
    _bubbleViewLeft = 0;
    _bubbleViewTop = 0;
    _bubbleViewWidth = 0;
    _bubbleViewHeight = 0;
    _timeLabelTop = 0;
    _timeLabelLeft = 0;
    _timeLabelWidth = 0;
    _timeLabelHeight = 0;
    _timeViewTop = 0;
    _timeViewLeft = 0;
    _timeViewWidth = 0;
    _timeViewHeight = 0;
}

- (void)setLayout
{
    _bubbleType = [PCMessageComponentBubble componentBubbleType:_messageModel];
    
    if (_shouldShowTime) {
        [self setTimeLayout];
        _avatarViewTop = _timeViewTop + _timeViewHeight + PCMessageTopPadding;
    } else {
        _avatarViewTop = PCMessageTopPadding;
    }
    
    [self setTextMessageLayout];
}

#pragma mark SetupLayout Time View
- (void)setTimeLayout
{
    UIFont *timeFont = [UIFont systemFontOfSize:PCMessageTimeFontSize];
    NSMutableAttributedString *timeStr = [[NSMutableAttributedString alloc] initWithString:[[NSDate getDateFromT8TimeStamp:_messageModel.created_at] formattedTime]];
    timeStr.font = timeFont;
    timeStr.color = [UIColor whiteColor];
    YYTextLinePositionSimpleModifier *modifier = [YYTextLinePositionSimpleModifier new];
    modifier.fixedLineHeight = PCMessageTimeFontSize * 1.3;
    YYTextContainer *timeContainer = [YYTextContainer containerWithSize:CGSizeMake(PCMessageTextMaxWidth, MAXFLOAT)];
    timeContainer.linePositionModifier = modifier;
    _timeLabelLayout = [YYTextLayout layoutWithContainer:timeContainer text:timeStr];
    
    _timeLabelWidth = _timeLabelLayout.textBoundingSize.width;
    _timeLabelHeight = _timeLabelLayout.textBoundingSize.height;
    
    _timeViewTop = PCMessageTopPadding;
    _timeViewWidth = _timeLabelWidth + 2 * PCMessageTimeInnerPaddding;
    _timeViewHeight = _timeLabelHeight + 2 * PCMessageTimeInnerPaddding;
    _timeViewLeft = (SCREEN_WIDTH - _timeLabelWidth) / 2;
    
    _timeLabelLeft = PCMessageTimeInnerPaddding;
    _timeLabelTop = PCMessageTimeInnerPaddding;
}

#pragma mark SetupLayout Text Message
- (void)setTextMessageLayout
{
    UIFont *textFont = [UIFont systemFontOfSize:PCMessageTextFontSize];
    NSMutableAttributedString *textStr = [[NSMutableAttributedString alloc] initWithString:_messageModel.content];
    textStr.font = textFont;
    textStr.color = MainContentColor;
    YYTextLinePositionSimpleModifier *modifier = [YYTextLinePositionSimpleModifier new];
    modifier.fixedLineHeight = PCMessageTextFontSize * 1.3;
    YYTextContainer *textContainer = [YYTextContainer containerWithSize:CGSizeMake(PCMessageTextMaxWidth, MAXFLOAT)];
    textContainer.linePositionModifier = modifier;
    _textLayout = [YYTextLayout layoutWithContainer:textContainer text:textStr];
    
    _textHeight = _textLayout.textBoundingSize.height + PCMessageTextBottomPadding;
    _textWidth = _textLayout.textBoundingSize.width;
    
    _bubbleViewWidth = _textWidth + 2 * PCMessageTextBubblePadding + PCMessageBubbleAngleWidth;
    _bubbleViewHeight = (_textHeight < PCMessageTextLineHeight) ? PCMessageTextMinHeight : _textHeight + 2 * PCMessageTextBubblePadding;
    
    if (_messageModel.message_bubble_type == PCMessageBubbleTypeSending) {
        _avatarViewLeft = PCMessageAvatarSenderLeft;
        _bubbleViewLeft = _avatarViewLeft - PCMessageBubbleAvatarPadding - _bubbleViewWidth;
        _textLeft = _bubbleViewLeft + PCMessageTextBubblePadding;
    } else {
        _avatarViewLeft = PCMessageAvatarReceiverLeft;
        _bubbleViewLeft = PCMessageAvatarReceiverLeft + PCMessageAvatarSize + PCMessageBubbleAvatarPadding;
        _textLeft = _bubbleViewLeft + PCMessageTextBubblePadding + PCMessageBubbleAngleWidth;
    }
    
    _bubbleViewTop = _avatarViewTop;
    
    _textTop =(_textHeight < PCMessageTextLineHeight) ? _bubbleViewTop + (_bubbleViewHeight - _textHeight) / 2 : _bubbleViewTop + PCMessageTextBubblePadding;
    
    _height = _bubbleViewTop + _bubbleViewHeight + PCMessageTopPadding + PCMessageTopPadding;
}

@end
