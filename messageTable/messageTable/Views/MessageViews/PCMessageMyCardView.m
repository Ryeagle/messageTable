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
    
    PCMessageMyCardLayout *myCardLayout = layout.contentLayout;
    
    self.bubbleView.type = [PCMessageAvatarBubble avatarBubbleType:layout.messageModel];
    
    _cardAvatarView.frame = myCardLayout.cardAvatarRect;
    [_cardAvatarView sd_setImageWithURL:[NSURL URLWithString:[layout.messageModel.webLinkCover stringByAppendingFormat:@"%@",[PCSetImageSizeManager componentStrWithImageWidth:PCMessageWebLinkAvatarWidth height:PCMessageWebLinkAvatarWidth]]] placeholderImage:[UIImage imageNamed:@"default_avatar"]];
    
    _titleLabel.frame = myCardLayout.titleRect;
    _titleLabel.textLayout = myCardLayout.titleTextLayout;
    
    _nameLabel.frame = myCardLayout.nameRect;
    _nameLabel.textLayout = myCardLayout.nameTextLayout;

}

@end
