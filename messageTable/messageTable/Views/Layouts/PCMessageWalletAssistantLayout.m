//
//  PCMessageWalletAssistantLayout.m
//  messageTable
//
//  Created by Ryeagler on 2017/3/2.
//  Copyright © 2017年 Ryeagle. All rights reserved.
//

#import "PCMessageWalletAssistantLayout.h"

@implementation PCMessageWalletAssistantLayout

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
