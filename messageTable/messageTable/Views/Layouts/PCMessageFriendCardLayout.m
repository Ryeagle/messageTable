//
//  PCMessageFriendCardLayout.m
//  messageTable
//
//  Created by Ryeagler on 2017/3/2.
//  Copyright © 2017年 Ryeagle. All rights reserved.
//

#import "PCMessageFriendCardLayout.h"

@implementation PCMessageFriendCardLayout
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
    _cardAvatarRect = CGRectZero;
    _titleRect = CGRectZero;
    _nameRect = CGRectZero;
    _lineViewRect = CGRectZero;
}

- (void)layout:(PCMessageModel *)messageModel
{
    NSMutableAttributedString *titleStr = [[NSMutableAttributedString alloc] initWithString:@"个人名片"];
    titleStr.font = [UIFont systemFontOfSize:PCMessageCardTitleSize];
    titleStr.color = AssistContentColor;
    YYTextContainer *titleContainer = [YYTextContainer containerWithSize:CGSizeMake(MAXFLOAT,  MAXFLOAT)];
    _titleTextLayout = [YYTextLayout layoutWithContainer:titleContainer text:titleStr];
    
    NSMutableAttributedString *nameStr = [[NSMutableAttributedString alloc] initWithString:messageModel.friendCardName];
    nameStr.font = [UIFont systemFontOfSize: PCMessageCardNameFontSize];
    nameStr.color = [UIColor blackColor];
    YYTextContainer *nameContainer = [YYTextContainer containerWithSize:CGSizeMake(PCMessageCardNameMaxWidth, PCMessageCardNameFontSize * 1.2)];
    nameContainer.maximumNumberOfRows = 1;
    nameContainer.truncationType = YYTextTruncationTypeEnd;
    _nameTextLayout = [YYTextLayout layoutWithContainer:nameContainer text:nameStr];
    
    _cardAvatarRect = CGRectMake((messageModel.message_bubble_type == PCMessageBubbleTypeSending) ? PCMessageCardInnerPadding : PCMessageCardInnerPadding + PCMessageBubbleAngleWidth, PCMessageCardInnerPadding, PCMessageCardAvatarWidth, PCMessageCardAvatarWidth);
    _nameRect = CGRectMake(CGRectGetMaxX(_cardAvatarRect) + PCMessageCardAvatarNamePadding, CGRectGetMinY(_cardAvatarRect) + (PCMessageCardAvatarWidth - _nameTextLayout.textBoundingSize.height) / 2, _nameTextLayout.textBoundingSize.width, _nameTextLayout.textBoundingSize.height);
    _viewWidth = CGRectGetMaxX(_cardAvatarRect) + PCMessageCardNameMaxWidth + 2 * PCMessageCardInnerPadding;
    _lineViewRect = CGRectMake((messageModel.message_bubble_type == PCMessageBubbleTypeSending) ?  PCMessageCardLineLeft : PCMessageBubbleAngleWidth + PCMessageCardLineLeft , CGRectGetMaxY(_cardAvatarRect) + PCMessageCardInnerPadding, _viewWidth - PCMessageBubbleAngleWidth - 2 * PCMessageCardLineLeft, PCMessageCardLineHeight);
    _titleRect = CGRectMake(CGRectGetMinX(_cardAvatarRect), CGRectGetMaxY(_lineViewRect) + PCMessageCardLineTitlePadding, _titleTextLayout.textBoundingSize.width, _titleTextLayout.textBoundingSize.height);

    _viewHeight = CGRectGetMaxY(_titleRect) + PCMessageCardBottomPadding;
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
