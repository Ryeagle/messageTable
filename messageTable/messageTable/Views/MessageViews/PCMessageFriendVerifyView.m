//
//  PCMessageFriendVerifyView.m
//  messageTable
//
//  Created by Ryeagler on 2017/3/2.
//  Copyright © 2017年 Ryeagle. All rights reserved.
//

#import "PCMessageFriendVerifyView.h"

@implementation PCMessageFriendVerifyView

- (instancetype)init
{
    self = [super init];
    if (self) {
        _verifyTextLabel = [YYLabel new];
        _verifyTextLabel.textVerticalAlignment = YYTextVerticalAlignmentCenter;
        _verifyTextLabel.clearContentsBeforeAsynchronouslyDisplay = NO;
        _verifyTextLabel.displaysAsynchronously = YES;
        _verifyTextLabel.ignoreCommonProperties = YES;
        _verifyTextLabel.fadeOnHighlight = NO;
        _verifyTextLabel.fadeOnAsynchronouslyDisplay = NO;
        
        __weak typeof(self) weakSelf = self;
        _verifyTextLabel.highlightTapAction =  ^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect) {
            if (self.delegate && [self.delegate respondsToSelector:@selector(receiveViewEvent:layout:object:)]) {
                [weakSelf.delegate receiveViewEvent:PCFriendVerifyTapEvent layout:weakSelf.layout object:text.string];
            }
            NSLog(@"%@点击了:%@", PCFriendVerifyTapEvent, [text.string substringWithRange:range]);
        };
        self.bubbleView.userInteractionEnabled = YES;
        [self.bubbleView addSubview:_verifyTextLabel];
    }
    
    return self;
}

- (void)setLayout:(PCMessageLayout *)layout
{
    [super setLayout:layout];
    
    self.bubbleView.frame = CGRectMake(layout.contentViewLeft, layout.contentViewTop, layout.contentViewWidth, layout.contentViewHeight);
    self.bubbleView.image = [PCMessageHelper resizableImageWithName:@"Chat_system_msg_bg"];
    
    PCMessageFriendVerifyLayout *verifyLayout = (PCMessageFriendVerifyLayout *)layout.contentLayout;
    _verifyTextLabel.frame = verifyLayout.verifyTextFrame;
    _verifyTextLabel.textLayout = verifyLayout.verifyTextLayout;
}

@end
