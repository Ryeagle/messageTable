//
//  PCMessageFriendVerifyLayout.m
//  messageTable
//
//  Created by Ryeagler on 2017/3/2.
//  Copyright © 2017年 Ryeagle. All rights reserved.
//

#import "PCMessageFriendVerifyLayout.h"

@implementation PCMessageFriendVerifyLayout
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
    _verifyTextFrame = CGRectZero;
}

- (void)layout:(PCMessageModel *)messageModel
{
    NSMutableAttributedString *verifyStr = [[NSMutableAttributedString alloc] initWithString:messageModel.content];
    verifyStr.font = [UIFont systemFontOfSize:PCMessageFriendVefiryFontSize];
    verifyStr.color = [UIColor whiteColor];
    
    YYTextLinePositionSimpleModifier *modifier = [YYTextLinePositionSimpleModifier new];
    modifier.fixedLineHeight = PCMessageFriendVefiryFontSize * 1.3;
    YYTextContainer *textContainer = [YYTextContainer containerWithSize:CGSizeMake(PCMessageFriendVefiryMaxWidth, MAXFLOAT)];
    textContainer.linePositionModifier = modifier;
    _verifyTextLayout = [YYTextLayout layoutWithContainer:textContainer text:[PCMessageHelper highlightTextWithModel:messageModel font:[UIFont systemFontOfSize:PCMessageFriendVefiryFontSize] color:[UIColor whiteColor]]];

    _verifyTextFrame = CGRectMake(PCMessageFriendVefiryInnerLeftPadding, PCMessageFriendVefiryInnerTopPadding, _verifyTextLayout.textBoundingSize.width, _verifyTextLayout.textBoundingSize.height);
    
    _viewWidth = _verifyTextLayout.textBoundingSize.width + 2 * PCMessageFriendVefiryInnerLeftPadding;
    _viewHeight = _verifyTextLayout.textBoundingSize.height + 2 * PCMessageFriendVefiryInnerTopPadding;
}

#pragma mark PCMessageLayoutProtol
- (void)messageContentLayout:(PCMessageLayout *)layout
{
    layout.contentViewWidth = _viewWidth;
    layout.contentViewHeight = _viewHeight;
    layout.contentViewTop = layout.timeViewTop + layout.timeViewLayout.viewHeight + PCMessageTimeBottomPadding;
    layout.contentViewLeft = (SCREEN_WIDTH - layout.contentViewWidth) / 2;
    
    layout.height = layout.contentViewTop + layout.contentViewHeight + PCMessageBottomPadding;
}
@end
