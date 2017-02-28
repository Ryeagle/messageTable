//
//  PCMessageTextViewLayout.m
//  messageTable
//
//  Created by Ryeagler on 2017/2/28.
//  Copyright © 2017年 Ryeagle. All rights reserved.
//

#import "PCMessageTextViewLayout.h"

@implementation PCMessageTextViewLayout

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
    _textLabelHeight = 0;
    _textLabelWidth = 0;
    _textLabelTop = 0;
    _textLabelLeft = 0;
}

- (void)layout:(PCMessageModel *)messageModel
{
    UIFont *textFont = [UIFont systemFontOfSize:PCMessageTextFontSize];
    NSMutableAttributedString *textStr = [[NSMutableAttributedString alloc] initWithString:messageModel.content];
    textStr.font = textFont;
    textStr.color = MainContentColor;
    YYTextLinePositionSimpleModifier *modifier = [YYTextLinePositionSimpleModifier new];
    modifier.fixedLineHeight = PCMessageTextFontSize * 1.3;
    YYTextContainer *textContainer = [YYTextContainer containerWithSize:CGSizeMake(PCMessageTextMaxWidth, MAXFLOAT)];
    textContainer.linePositionModifier = modifier;
    _textLayout = [YYTextLayout layoutWithContainer:textContainer text:textStr];
    
    _textLabelHeight = _textLayout.textBoundingSize.height + PCMessageTextInnerBottomPadding;
    _textLabelWidth = _textLayout.textBoundingSize.width;
    if (messageModel.message_bubble_type == PCMessageBubbleTypeSending) {
        _textLabelLeft = PCMessageTextBubblePadding;
    } else {
        _textLabelLeft = PCMessageTextBubblePadding + PCMessageBubbleAngleWidth;
    }
    
    _viewWidth = _textLabelWidth + 2 * PCMessageTextBubblePadding + PCMessageBubbleAngleWidth;
    _viewHeight = (_textLabelHeight < PCMessageTextOneLineHeight) ? PCMessageTextMinHeight : _textLabelHeight + 2 * PCMessageTextBubblePadding;

    
    _textLabelTop =(_textLabelHeight < PCMessageTextOneLineHeight) ? (_viewHeight - _textLabelHeight) / 2 :PCMessageTextBubblePadding;
    
}
@end
