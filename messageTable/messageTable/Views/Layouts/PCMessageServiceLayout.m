//
//  PCMessageServiceLayout.m
//  messageTable
//
//  Created by Ryeagler on 2017/3/1.
//  Copyright © 2017年 Ryeagle. All rights reserved.
//

#import "PCMessageServiceLayout.h"

@implementation PCMessageServiceLayout
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
    _serviceTextLabelHeight = 0;
    _serviceTextLabelWidth = 0;
    _serviceTextLabelTop = 0;
    _serviceTextLabelLeft = 0;
}

- (void)layout:(PCMessageModel *)messageModel
{
    UIFont *serviceFont = [UIFont systemFontOfSize:PCMessageSeriveMessageFontSize];
    NSMutableAttributedString *serviceStr = [[NSMutableAttributedString alloc] initWithString:messageModel.content];
    serviceStr.font = serviceFont;
    serviceStr.color = [UIColor whiteColor];
    YYTextContainer *serviceContainer = [YYTextContainer containerWithSize:CGSizeMake(PCMessageServiceMaxWidth, PCMessageServiceMaxHeight)];
    serviceContainer.maximumNumberOfRows = 1;
    serviceContainer.truncationType = YYTextTruncationTypeMiddle;
    _serviceTextLayout = [YYTextLayout layoutWithContainer:serviceContainer text:serviceStr];
    
    _serviceTextLabelWidth = _serviceTextLayout.textBoundingSize.width;
    _serviceTextLabelHeight = _serviceTextLayout.textBoundingSize.height;
    _serviceTextLabelTop = PCMessageServiceInnerTopPadding;
    _serviceTextLabelLeft = PCMessageServiceInnerLeftPadding;
    
    _viewWidth = _serviceTextLabelWidth + 2 * PCMessageServiceInnerLeftPadding;
    _viewHeight = _serviceTextLabelHeight + + 2 * PCMessageServiceInnerTopPadding;
}

#pragma mark PCMessageLayoutProtol
- (CGFloat)contentHeight
{
    return _viewHeight;
}

- (CGFloat)contentWidth
{
    return _viewWidth;
}
@end
