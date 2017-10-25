//
//  PCMessageTimeViewLayout.m
//  messageTable
//
//  Created by Ryeagler on 2017/2/28.
//  Copyright © 2017年 Ryeagle. All rights reserved.
//

#import "PCMessageTimeViewLayout.h"

@implementation PCMessageTimeViewLayout

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
    _timeLabelWidth = 0;
    _timeLabelHeight = 0;
    _timeLabelTop = 0;
    _timeLabelLeft = 0;
    _viewHeight = 0;
    _viewWidth = 0;
}

- (void)layout:(PCMessageModel *)messageModel
{
    UIFont *timeFont = [UIFont systemFontOfSize:PCMessageTimeFontSize];
    NSMutableAttributedString *timeStr = [[NSMutableAttributedString alloc] initWithString:[[NSDate getDateFromT8TimeStamp:messageModel.created_at] formattedTime]];
    timeStr.font = timeFont;
    timeStr.color = [UIColor whiteColor];
    YYTextLinePositionSimpleModifier *modifier = [YYTextLinePositionSimpleModifier new];
    modifier.fixedLineHeight = PCMessageTimeFontSize;
    YYTextContainer *timeContainer = [YYTextContainer containerWithSize:CGSizeMake(PCMessageTextMaxWidth, MAXFLOAT)];
    timeContainer.linePositionModifier = modifier;
    _timeLabelLayout = [YYTextLayout layoutWithContainer:timeContainer text:timeStr];
    
    _timeLabelWidth = _timeLabelLayout.textBoundingSize.width;
    _timeLabelHeight = _timeLabelLayout.textBoundingSize.height;
    _timeLabelTop = PCMessageTimeInnerTopPadding;
    _timeLabelLeft = PCMessageTimeInnerLeftPaddding;
    
    _viewWidth = _timeLabelWidth + 2 * PCMessageTimeInnerLeftPaddding;
    _viewHeight = _timeLabelHeight + 2 * PCMessageTimeInnerTopPadding;
}
@end
