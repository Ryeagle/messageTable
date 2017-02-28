//
//  PCMessageTextView.m
//  messageTable
//
//  Created by Ryeagler on 2017/2/28.
//  Copyright © 2017年 Ryeagle. All rights reserved.
//

#import "PCMessageTextView.h"

@implementation PCMessageTextView

- (instancetype)init
{
    self = [super init];
    if (self) {
        _textLabel = [YYLabel new];
        _textLabel.textVerticalAlignment = YYTextVerticalAlignmentTop;
        _textLabel.clearContentsBeforeAsynchronouslyDisplay = NO;
        _textLabel.displaysAsynchronously = YES;
        _textLabel.ignoreCommonProperties = YES;
        _textLabel.fadeOnHighlight = NO;
        _textLabel.fadeOnAsynchronouslyDisplay = NO;
        _textLabel.highlightTapAction =  ^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect) {
            NSLog(@"点击了:%@", text);
        };

        [self.bubbleView addSubview:_textLabel];
    }
    
    return self;
}

- (void)setLayout:(PCMessageLayout *)layout
{
    [super setLayout:layout];
    
    _textLabel.top = layout.textViewLayout.textLabelTop;
    _textLabel.left = layout.textViewLayout.textLabelLeft;
    _textLabel.size = CGSizeMake(layout.textViewLayout.textLabelWidth, layout.textViewLayout.textLabelHeight);
    _textLabel.textLayout = layout.textViewLayout.textLayout;
}

@end
