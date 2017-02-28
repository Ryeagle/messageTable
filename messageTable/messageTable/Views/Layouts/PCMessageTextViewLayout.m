//
//  PCMessageTextViewLayout.m
//  messageTable
//
//  Created by Ryeagler on 2017/2/28.
//  Copyright © 2017年 Ryeagle. All rights reserved.
//

#import "PCMessageTextViewLayout.h"

@interface PCMessageTextViewLayout()

@end

@implementation PCMessageTextViewLayout
{
    NSRange _currentRange;
}

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
    YYTextLinePositionSimpleModifier *modifier = [YYTextLinePositionSimpleModifier new];
    modifier.fixedLineHeight = PCMessageTextFontSize * 1.3;
    YYTextContainer *textContainer = [YYTextContainer containerWithSize:CGSizeMake(PCMessageTextMaxWidth, MAXFLOAT)];
    textContainer.linePositionModifier = modifier;
    _textLayout = [YYTextLayout layoutWithContainer:textContainer text:[self highlightTextWithModel:messageModel]];
    
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

- (NSMutableAttributedString *)highlightTextWithModel:(PCMessageModel *)messageModel{
    NSMutableAttributedString *textStr = [[NSMutableAttributedString alloc] initWithString:messageModel.content];
    textStr.font = [UIFont systemFontOfSize:PCMessageTextFontSize];
    textStr.color = MainContentColor;

    NSString* string = textStr.string;
    NSRange range = NSMakeRange(0,[string length]);
    for(NSString* expression in @[URLLINKREGULAR, PHONEREGULAR, EMAILREGULAR, ADRESSREGULAR]) {
        NSArray* matches = [[NSRegularExpression regularExpressionWithPattern:expression options:NSRegularExpressionDotMatchesLineSeparators error:nil] matchesInString:string options:0 range:range];
        for(NSTextCheckingResult* match in matches) {
            NSLog(@"Match String: %@", [textStr.string substringWithRange:match.range]);
            [self setHighlightInfo:@{@"String...." : @"Fuck The World"} withRange:match.range toText:textStr];
        }
    }
    
    return textStr;
}

- (void)setHighlightInfo:(NSDictionary*)info withRange:(NSRange)range toText:(NSMutableAttributedString *)text {
    if (range.length == 0 || text.length == 0) return;
    if (range.location >= text.length) return;
    if (range.location + range.length > text.length) return;
    
    YYTextBorder *border = [YYTextBorder new];
    border.cornerRadius = 3;
    border.insets = UIEdgeInsetsMake(-2, -2, -2, -2);
#warning 根据项目需求更改
    border.fillColor = UIColorHex(EBEEF0);
    
    YYTextHighlight *highlight = [YYTextHighlight new];
    [highlight setBackgroundBorder:border];
    highlight.userInfo = info;
    
    [text setTextHighlight:highlight range:range];
#warning 根据项目需求更改
    [text setColor:UIColorHex(1A91DA) range:range];
}
@end
