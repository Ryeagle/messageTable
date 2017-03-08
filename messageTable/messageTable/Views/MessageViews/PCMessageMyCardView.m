//
//  PCMessageMyCardView.m
//  messageTable
//
//  Created by Ryeagler on 2017/3/3.
//  Copyright © 2017年 Ryeagle. All rights reserved.
//

#import "PCMessageMyCardView.h"

@implementation PCMessageMyCardView

- (instancetype)init
{
    self = [super init];
    if (self) {
        _cardAvatarView = [UIImageView new];
        [self.bubbleView addSubview:_cardAvatarView];
        
        _titleLabel = [YYLabel new];
        _titleLabel.textVerticalAlignment = YYTextVerticalAlignmentTop;
        _titleLabel.clearContentsBeforeAsynchronouslyDisplay = NO;
        _titleLabel.displaysAsynchronously = YES;
        _titleLabel.ignoreCommonProperties = YES;
        _titleLabel.fadeOnHighlight = NO;
        _titleLabel.fadeOnAsynchronouslyDisplay = NO;
        [self.bubbleView addSubview:_titleLabel];
        
        _lineView = [UIView new];
        _lineView.backgroundColor = PCMessageCardLineColor;
        [self.bubbleView addSubview:_lineView];
        
        _nameLabel = [YYLabel new];
        _nameLabel.textVerticalAlignment = YYTextVerticalAlignmentTop;
        _nameLabel.clearContentsBeforeAsynchronouslyDisplay = NO;
        _nameLabel.displaysAsynchronously = YES;
        _nameLabel.ignoreCommonProperties = YES;
        _nameLabel.fadeOnHighlight = NO;
        _nameLabel.fadeOnAsynchronouslyDisplay = NO;
        [self.bubbleView addSubview:_nameLabel];
    }
    
    return self;
}


- (void)setLayout:(PCMessageLayout *)layout
{
    [super setLayout:layout];
    
    PCMessageFriendCardLayout *myCardLayout = layout.contentLayout;
    
    self.bubbleView.type = [PCMessageAvatarBubble avatarBubbleType:layout.messageModel];
    
    _cardAvatarView.frame = myCardLayout.cardAvatarRect;
    [_cardAvatarView sd_setImageWithURL:[NSURL URLWithString:[layout.messageModel.friendCardAvatar stringByAppendingFormat:@"%@",[PCSetImageSizeManager componentStrWithImageWidth:PCMessageWebLinkAvatarWidth height:PCMessageWebLinkAvatarWidth]]] placeholderImage:[UIImage imageNamed:@"default_avatar"]];
    
    _lineView.frame = myCardLayout.lineViewRect;
    
    _titleLabel.frame = myCardLayout.titleRect;
    _titleLabel.textLayout = myCardLayout.titleTextLayout;
    
    _nameLabel.frame = myCardLayout.nameRect;
    NSMutableAttributedString *nameStr = [[NSMutableAttributedString alloc] initWithString:@"晚来天欲雪能饮一杯无"];
    nameStr.font = [UIFont systemFontOfSize: PCMessageCardNameFontSize];
    nameStr.color = [UIColor blackColor];
    YYTextContainer *nameContainer = [YYTextContainer containerWithSize:CGSizeMake(PCMessageCardNameMaxWidth, PCMessageCardNameFontSize * 1.2)];
    nameContainer.maximumNumberOfRows = 1;
    nameContainer.truncationType = YYTextTruncationTypeEnd;
    _nameLabel.textLayout = [YYTextLayout layoutWithContainer:nameContainer text:nameStr];
}

#pragma mark Gesture Action
- (void)bubbleTapAction:(UITapGestureRecognizer *)gesture
{
    NSLog(@"MyCard Message Tap...");
    
    self.bubbleView.highlighted = YES;
    
    __weak typeof(self) weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        weakSelf.bubbleView.highlighted = NO;
    });
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(receiveViewEvent:layout:object:)]) {
        [self.delegate receiveViewEvent:PCMyCardsTapEvent layout:self.layout object:nil];
    }
}


@end
