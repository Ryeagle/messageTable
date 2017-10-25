//
//  PCMessageWebLinkLayout.m
//  messageTable
//
//  Created by Ryeagler on 2017/3/2.
//  Copyright © 2017年 Ryeagle. All rights reserved.
//

#import "PCMessageWebLinkLayout.h"

@implementation PCMessageWebLinkLayout
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
    _viewWidth = 0;
    _viewHeight = 0;
    _webLinkCoverRect = CGRectZero;
    _titleRect = CGRectZero;
    _infoRect = CGRectZero;

}

- (void)layout:(PCMessageModel *)messageModel
{
    NSMutableAttributedString *titleStr = [[NSMutableAttributedString alloc] initWithString:messageModel.webLinkTitle];
    titleStr.font = [UIFont systemFontOfSize:PCMessageWebLinkTitleFontSize];
    titleStr.color = [UIColor blackColor];
    
    YYTextLinePositionSimpleModifier *modifier = [YYTextLinePositionSimpleModifier new];
    modifier.fixedLineHeight = PCMessageWebLinkTitleFontSize * 1.3;
    YYTextContainer *titleContainer = [YYTextContainer containerWithSize:CGSizeMake(PCMessageWebLinkContentMaxWidth, PCMessageFriendVefiryFontSize * 1.3 * 2)];
    titleContainer.linePositionModifier = modifier;
    titleContainer.maximumNumberOfRows = 2;
    titleContainer.truncationType = YYTextTruncationTypeEnd;
    _titleTextLayout = [YYTextLayout layoutWithContainer:titleContainer text:titleStr];

    _titleRect = CGRectMake((messageModel.message_bubble_type == PCMessageBubbleTypeSending) ?PCMessageWebLinkInnerLeftPadding : PCMessageWebLinkInnerLeftPadding + PCMessageBubbleAngleWidth, PCMessageWebLinkInnerTopPadding, _titleTextLayout.textBoundingSize.width, _titleTextLayout.textBoundingSize.height + PCMessageWebLinkTitleInfoPadding);

    _webLinkCoverRect = CGRectMake(CGRectGetMinX(_titleRect), CGRectGetMaxY(_titleRect), PCMessageWebLinkAvatarWidth, PCMessageWebLinkAvatarWidth);

    NSMutableAttributedString *infoAtrrStr = [[NSMutableAttributedString alloc] initWithString:messageModel.webLinkDesc];
    infoAtrrStr.font = [UIFont systemFontOfSize:PCMessageWebLinkInfoFontSize];
    infoAtrrStr.color = AssistContentColor;
    
    YYTextLinePositionSimpleModifier *infoModifier = [YYTextLinePositionSimpleModifier new];
    infoModifier.fixedLineHeight = PCMessageWebLinkAvatarWidth / 3;
    YYTextContainer *infoContainer = [YYTextContainer containerWithSize:CGSizeMake(PCMessageWebLinkInfoMaxWidth, PCMessageWebLinkAvatarWidth)];
    infoContainer.truncationType = YYTextTruncationTypeEnd;
    infoContainer.maximumNumberOfRows = 3;
    infoContainer.linePositionModifier = infoModifier;
    _infoTextLayout = [YYTextLayout layoutWithContainer:infoContainer text:infoAtrrStr];
    
    _infoRect = CGRectMake(CGRectGetMaxX(_webLinkCoverRect) + PCMessageWebLinkInnerLeftPadding, CGRectGetMinY(_webLinkCoverRect), _infoTextLayout.textBoundingSize.width, _infoTextLayout.textBoundingSize.height + PCMessageWebLinkInnerBottomPadding);
    
    _viewWidth = PCMessageWebLinkContentMaxWidth + 2 * PCMessageWebLinkInnerLeftPadding + PCMessageBubbleAngleWidth;
    _viewHeight = PCMessageWebLinkInnerBottomPadding + CGRectGetMaxY(_webLinkCoverRect);
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
