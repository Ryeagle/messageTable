//
//  PCMessageMyCardLayout.m
//  messageTable
//
//  Created by Ryeagler on 2017/3/2.
//  Copyright © 2017年 Ryeagle. All rights reserved.
//

#import "PCMessageMyCardLayout.h"

@implementation PCMessageMyCardLayout

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
}

- (void)layout:(PCMessageModel *)messageModel
{
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
