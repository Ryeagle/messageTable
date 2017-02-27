//
//  PCMessageCell.m
//  messageTable
//
//  Created by Ryeagler on 2017/2/24.
//  Copyright © 2017年 Ryeagle. All rights reserved.
//

#import "PCMessageCell.h"
#import "PCMessageHelper.h"

@implementation PCMessageComponentTimeView

- (instancetype)init
{
    self = [super init];
    if (self) {
        UIImage *image = [UIImage imageNamed:@"Chat_system_msg_bg"];
        CGFloat w = image.size.width * 0.5;
        CGFloat h = image.size.height * 0.5;
        self.image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(h, w, h, w)];
        
        _timeLabel = [YYLabel new];
#ifdef RyeagleForTest
        _timeLabel.backgroundColor = [UIColor redColor];
#endif
        _timeLabel.textVerticalAlignment = YYTextVerticalAlignmentTop;
        _timeLabel.clearContentsBeforeAsynchronouslyDisplay = NO;
        _timeLabel.displaysAsynchronously = YES;
        _timeLabel.ignoreCommonProperties = YES;
        _timeLabel.fadeOnHighlight = NO;
        _timeLabel.fadeOnAsynchronouslyDisplay = NO;
        [self addSubview:_timeLabel];
    }
    
    return self;
}

@end

@implementation PCMessageTextView

- (instancetype)init
{
    self = [super init];
    if (self) {
        _timeView = [PCMessageComponentTimeView new];
        _timeView.hidden = YES;
        [self addSubview:_timeView];
        
        _avatarView = [UIImageView new];
#ifdef RyeagleForTest
        _avatarView.backgroundColor = [UIColor redColor];
#endif
        _avatarView.size = CGSizeMake(PCMessageAvatarSize, PCMessageAvatarSize);
        [self addSubview:_avatarView];
        
        _bubbleView = [[PCMessageComponentBubble alloc]init];
#ifdef RyeagleForTest
        _bubbleView.backgroundColor = [UIColor greenColor];
#endif
        [self addSubview:_bubbleView];
        
        _textLabel = [YYLabel new];
#ifdef RyeagleForTest
        _textLabel.backgroundColor = [UIColor orangeColor];
#endif
        _textLabel.textVerticalAlignment = YYTextVerticalAlignmentTop;
        _textLabel.clearContentsBeforeAsynchronouslyDisplay = NO;
        _textLabel.displaysAsynchronously = YES;
        _textLabel.ignoreCommonProperties = YES;
        _textLabel.fadeOnHighlight = NO;
        _textLabel.fadeOnAsynchronouslyDisplay = NO;
        [self addSubview:_textLabel];
    }
    
    return self;
}

- (void)setWithLayout:(PCMessageLayout *)layout
{
    if (layout.shouldShowTime) {
        _timeView.hidden = NO;
        _timeView.frame = CGRectMake(layout.timeViewLeft, layout.timeViewTop, layout.timeViewWidth, layout.timeViewHeight);
        _timeView.timeLabel.frame = CGRectMake(layout.timeLabelLeft, layout.timeLabelTop, layout.timeLabelWidth, layout.timeLabelHeight);
        _timeView.timeLabel.textLayout = layout.timeLabelLayout;
    }
    
    if (layout.messageModel.message_bubble_type == PCMessageBubbleTypeSending) {
        [_avatarView setImage:[UIImage imageNamed:@"Chat_sender_avatar"]];
    } else {
        [_avatarView setImage:[UIImage imageNamed:@"Chat_receiver_avatar"]];
    }
    _avatarView.left = layout.avatarViewLeft;
    _avatarView.top = layout.avatarViewTop;

    _bubbleView.top = layout.bubbleViewTop;
    _bubbleView.left = layout.bubbleViewLeft;
    _bubbleView.size = CGSizeMake(layout.bubbleViewWidth, layout.bubbleViewHeight);
    _bubbleView.type = layout.bubbleType;

    _textLabel.top = layout.textTop;
    _textLabel.left = layout.textLeft;
    _textLabel.size = CGSizeMake(layout.textWidth, layout.textHeight);
    _textLabel.textLayout = layout.textLayout;
}

@end

@implementation PCMessageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self configDefault];
        [self configContentView:reuseIdentifier];
    }
    
    return self;
}

- (void)configDefault
{
    self.userInteractionEnabled = YES;
#warning 据说clearColor性能不高,之后再优化
    self.backgroundColor = [UIColor clearColor];
    [self.backgroundView setBackgroundColor:[UIColor clearColor]];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)configContentView:(NSString *)reuseIdentifier
{
    _boundsView = [PCMessageTextView new];
    
    [self.contentView addSubview:_boundsView];
}

- (void)setLayout:(PCMessageLayout *)layout
{
    _layout = layout;
    PCMessageTextView *textView = (PCMessageTextView *)_boundsView;
    [textView setWithLayout:layout];
}
@end
