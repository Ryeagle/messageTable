//
//  PCMessageNoAvatarBaseView.m
//  messageTable
//
//  Created by Ryeagler on 2017/2/28.
//  Copyright © 2017年 Ryeagle. All rights reserved.
//

#import "PCMessageNoAvatarBaseView.h"

@implementation PCMessageNoAvatarBaseView

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        _timeView = [PCMessageTimeView new];
        _timeView.hidden = YES;
        [self addSubview:_timeView];
        
        _bubbleView = [UIImageView new];
        [self addSubview:_bubbleView];
    }
    
    return self;
}

- (void)setLayout:(PCMessageLayout *)layout
{
    [self setTimeLayout:layout];
    [self setContainerLayout:layout];
}

#pragma mark Set SubView's Layouts
- (void)setTimeLayout:(PCMessageLayout *)layout
{
    if (layout.shouldShowTime) {
        _timeView.hidden = NO;
        _timeView.frame = CGRectMake(layout.timeViewLeft, layout.timeViewTop, layout.timeViewLayout.viewWidth, layout.timeViewLayout.viewHeight);
        _timeView.timeLabel.frame = CGRectMake(layout.timeViewLayout.timeLabelLeft, layout.timeViewLayout.timeLabelTop, layout.timeViewLayout.timeLabelWidth, layout.timeViewLayout.timeLabelHeight);
        _timeView.timeLabel.textLayout = layout.timeViewLayout.timeLabelLayout;
    }
}

- (void)setContainerLayout:(PCMessageLayout *)layout
{
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH, layout.height);
}

#pragma mark PCMessageCellProtocol
- (void)setupLayout:(PCMessageLayout *)layout;
{
    [self setLayout:layout];
}

- (void)setDelegate:(id)delegate
{
    _delegate = delegate;
}
@end
