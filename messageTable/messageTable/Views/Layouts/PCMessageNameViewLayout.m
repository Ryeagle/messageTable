//
//  PCMessageNameViewLayout.m
//  messageTable
//
//  Created by Ryeagler on 2017/2/28.
//  Copyright © 2017年 Ryeagle. All rights reserved.
//

#import "PCMessageNameViewLayout.h"

@implementation PCMessageNameViewLayout

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
    _nameLabelTop = 0;
    _nameLabelLeft = 0;
    _identityButtonTop = 0;
    _identityButtonLeft = 0;
    _identityButtonWidth = 0;
    _identityButtonHeight = 0;
}

- (void)layout:(PCMessageModel *)messageModel
{
    UIFont *nameFont = [UIFont systemFontOfSize:PCMessageNameFontSize];
    NSMutableAttributedString *nameStr = [[NSMutableAttributedString alloc] initWithString:@"新生大学用户"];
    nameStr.font = nameFont;
    nameStr.color = AssistContentColor;
    YYTextContainer *textContainer = [YYTextContainer containerWithSize:CGSizeMake(PCMessageNameLabelWidth, PCMessageNameLabelHeight)];
    _nameLabelLayout = [YYTextLayout layoutWithContainer:textContainer text:nameStr];
    
    _nameLabelHeight = PCMessageNameLabelHeight;
    _nameLabelWidth = PCMessageNameLabelWidth;
    _nameLabelTop = (PCMessageNameHeight - _nameLabelHeight) / 2;
    
#warning 项目中替换判断方法
    _identityButtonTop = PCMessageNameInnderPadding;
    _identityButtonLeft = PCMessageNameLeftPaddding;
    _identityButtonHeight = PCMessageNameLabelHeight;
    if ([messageModel.creator isEqualToString:@"56f3a79bb8df540c19a2556d"]) {
        _identityButtonWidth = PCMessageOwnerIdentityWidth;
        _nameLabelLeft = _identityButtonLeft + _identityButtonWidth + PCMessageNameInnderPadding;
    } else if ([messageModel.creator isEqualToString:@"5767abbecbaf43383bfba097"]) {
        _identityButtonWidth = PCMessageAdminIdentityWidth;
        _nameLabelLeft = _identityButtonLeft + _identityButtonWidth + PCMessageNameInnderPadding;
    } else {
        _identityButtonTop = 0;
        _identityButtonLeft = 0;
        _identityButtonHeight = 0;
        _identityButtonWidth = 0;
        _nameLabelLeft = PCMessageNameLeftPaddding;
    }

    _viewWidth = _nameLabelWidth + _identityButtonWidth + 2 * PCMessageNameInnderPadding;
    _viewHeight = PCMessageNameHeight;
}

@end
