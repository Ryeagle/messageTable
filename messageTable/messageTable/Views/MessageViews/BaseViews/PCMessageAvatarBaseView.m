//
//  PCMessageAvatarBaseView.m
//  messageTable
//
//  Created by Ryeagler on 2017/2/28.
//  Copyright © 2017年 Ryeagle. All rights reserved.
//

#import "PCMessageAvatarBaseView.h"

@implementation PCMessageAvatarBaseView

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        _timeView = [PCMessageTimeView new];
        _timeView.hidden = YES;
        [self addSubview:_timeView];
        
        _avatarView = [UIImageView new];
        _avatarView.size = CGSizeMake(PCMessageAvatarSize, PCMessageAvatarSize);
        [self addSubview:_avatarView];
        
        _bubbleView = [PCMessageAvatarBubble new];
        [self addSubview:_bubbleView];
        
        _nameView = [PCMessageNameView new];
        _nameView.hidden = YES;
        [self addSubview:_nameView];
    }
    
    return self;
}

- (void)setLayout:(PCMessageLayout *)layout
{
    _layout = layout;
    
    [self setTimeLayout:layout];
    [self setAvatarLayout:layout];
    [self setNameLayout:layout];
    [self setBubbleLayout:layout];
    self.size = CGSizeMake(SCREEN_WIDTH, self.layout.height);
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

- (void)setAvatarLayout:(PCMessageLayout *)layout
{
    if (layout.messageModel.message_bubble_type == PCMessageBubbleTypeSending) {
        [_avatarView setImage:[UIImage imageNamed:@"Chat_sender_avatar"]];
    } else {
        [_avatarView setImage:[UIImage imageNamed:@"Chat_receiver_avatar"]];
    }
    
    _avatarView.left = layout.avatarViewLeft;
    _avatarView.top = layout.avatarViewTop;
}

- (void)setBubbleLayout:(PCMessageLayout *)layout
{
    _bubbleView.top = _nameView.hidden ? layout.avatarBubbleViewTop : layout.avatarBubbleViewTop + layout.nameViewLayout.viewHeight;
    _bubbleView.left = layout.avatarBubbleViewLeft;
    _bubbleView.size = CGSizeMake(layout.avatarBubbleViewWidth, layout.avatarBubbleViewHeight);
    _bubbleView.type = layout.bubbleType;
}

- (void)setNameLayout:(PCMessageLayout *)layout
{
#warning 项目中替换判断方式
    if ([PCUserDefaultHelper sharedInstance].showMemberName) {
        if (layout.messageModel.message_bubble_type == PCMessageBubbleTypeReceiving) {
            
            _nameView.hidden = NO;
            _nameView.frame = CGRectMake(_avatarView.left + _avatarView.width, _avatarView.top, layout.nameViewLayout.viewWidth, layout.nameViewLayout.viewHeight);
            _nameView.identityButton.frame = CGRectMake(layout.nameViewLayout.identityButtonLeft, layout.nameViewLayout.identityButtonTop, layout.nameViewLayout.identityButtonWidth, layout.nameViewLayout.identityButtonHeight);
            _nameView.nameLabel.frame = CGRectMake(layout.nameViewLayout.nameLabelLeft, layout.nameViewLayout.nameLabelTop, layout.nameViewLayout.nameLabelWidth, layout.nameViewLayout.nameLabelHeight);
        

            UIImage *image = nil;
            if ([layout.messageModel.creator isEqualToString:@"56f3a79bb8df540c19a2556d"]) {
                image = [UIImage imageNamed:@"Chat_qunzhu_bg"];
                [_nameView.identityButton setTitle:@"群主" forState:UIControlStateNormal];
                _nameView.identityButton.hidden = NO;
            } else if ([layout.messageModel.creator isEqualToString:@"5767abbecbaf43383bfba097"]) {
                image = [UIImage imageNamed:@"Chat_guanliyuan_bg"];
                [_nameView.identityButton setTitle:@"管理员" forState:UIControlStateNormal];
                _nameView.identityButton.hidden = NO;
            } else {
                _nameView.identityButton.hidden = YES;
            }
            
            CGFloat w = image.size.width * 0.5;
            CGFloat h = image.size.height * 0.5;
            [_nameView.identityButton setBackgroundImage:[image resizableImageWithCapInsets:UIEdgeInsetsMake(h, w, h, w)] forState:UIControlStateNormal];
            
            _nameView.nameLabel.textLayout = layout.nameViewLayout.nameLabelLayout;
        } else {
            _nameView.hidden = YES;
        }
    } else {
        _nameView.hidden = YES;
    }
}

@end
