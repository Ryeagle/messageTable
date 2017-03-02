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
            NSLog(@"点击了:%@", [text.string substringWithRange:range]);
        };

        [self.bubbleView addSubview:_textLabel];
        [self addGestures];
    }
    
    return self;
}

#pragma mark Private Method
- (void)addGestures
{
    UITapGestureRecognizer *doubleTapGesuture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(textDoubleTapGesture:)];
    doubleTapGesuture.numberOfTapsRequired = 2;
    [_textLabel addGestureRecognizer:doubleTapGesuture];
}

#pragma mark SetLayout
- (void)setLayout:(PCMessageLayout *)layout
{
    [super setLayout:layout];
    PCMessageTextViewLayout *textViewLayout = layout.contentLayout;
    
    _textLabel.top = textViewLayout.textLabelTop;
    _textLabel.left = textViewLayout.textLabelLeft;
    _textLabel.size = CGSizeMake(textViewLayout.textLabelWidth, textViewLayout.textLabelHeight);
    _textLabel.textLayout = textViewLayout.textLayout;
}


#pragma mark Gesture Actions
- (void)textDoubleTapGesture:(UIGestureRecognizer *)gesture
{
    NSLog(@"Double Tap of Text Message");
}

@end
