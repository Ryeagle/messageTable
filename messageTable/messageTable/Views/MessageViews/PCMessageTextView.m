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
        
        __weak typeof(self) weakSelf = self;

        _textLabel.highlightTapAction =  ^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect) {
            YYTextHighlight *highlight = [weakSelf.textLabel.textLayout.text attribute:YYTextHighlightAttributeName atIndex:range.location];
            NSDictionary *info = highlight.userInfo;
            
            NSString *eventStr = nil;
            if ([[info objectForKey:@"PCMessageText"] isEqualToString:URLLINKREGULAR]) {
                eventStr = PCURLStringTapEvent;
            } else if ([[info objectForKey:@"PCMessageText"] isEqualToString:PHONEREGULAR]) {
                eventStr = PCPhoneNumberStringTapEvent;
            } else if ([[info objectForKey:@"PCMessageText"] isEqualToString:EMAILREGULAR]) {
                eventStr = PCEmailStringTapEvent;
            } else {
                eventStr = PCAdressStringTapEvent;
            }
            
            if (self.delegate && [self.delegate respondsToSelector:@selector(receiveViewEvent:layout:object:)]) {
                [weakSelf.delegate receiveViewEvent:eventStr layout:weakSelf.layout object:text.string];
            }
            NSLog(@"%@点击了:%@", eventStr, [text.string substringWithRange:range]);
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
    [self.bubbleView removeGestureRecognizer:self.bubbleTapGesture];
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
    if (self.delegate && [self.delegate respondsToSelector:@selector(receiveViewEvent:layout:object:)]) {
        [self.delegate receiveViewEvent:PCBubbleDoubleTapEvent layout:self.layout object:nil];
    }
}

@end
