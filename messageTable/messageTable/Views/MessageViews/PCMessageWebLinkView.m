//
//  PCMessageWebLinkView.m
//  messageTable
//
//  Created by Ryeagler on 2017/3/3.
//  Copyright © 2017年 Ryeagle. All rights reserved.
//

#import "PCMessageWebLinkView.h"

@implementation PCMessageWebLinkView

- (instancetype)init
{
    self = [super init];
    if (self) {
        _webLinkCoverView = [UIImageView new];
        [self.bubbleView addSubview:_webLinkCoverView];
        
        _titleLabel = [YYLabel new];
        _titleLabel.textVerticalAlignment = YYTextVerticalAlignmentTop;
        _titleLabel.clearContentsBeforeAsynchronouslyDisplay = NO;
        _titleLabel.displaysAsynchronously = YES;
        _titleLabel.ignoreCommonProperties = YES;
        _titleLabel.fadeOnHighlight = NO;
        _titleLabel.fadeOnAsynchronouslyDisplay = NO;
        [self.bubbleView addSubview:_titleLabel];
        
        _infoLabel = [YYLabel new];
        _infoLabel.textVerticalAlignment = YYTextVerticalAlignmentTop;
        _infoLabel.clearContentsBeforeAsynchronouslyDisplay = NO;
        _infoLabel.displaysAsynchronously = YES;
        _infoLabel.ignoreCommonProperties = YES;
        _infoLabel.fadeOnHighlight = NO;
        _infoLabel.fadeOnAsynchronouslyDisplay = NO;
        [self.bubbleView addSubview:_infoLabel];
    }
    
    return self;
}


- (void)setLayout:(PCMessageLayout *)layout
{
    [super setLayout:layout];
    PCMessageWebLinkLayout *webLinkLayout = layout.contentLayout;
    
    _webLinkCoverView.frame = webLinkLayout.webLinkCoverRect;
    self.bubbleView.type = [PCMessageAvatarBubble avatarBubbleType:layout.messageModel];
    [_webLinkCoverView sd_setImageWithURL:[NSURL URLWithString:[layout.messageModel.webLinkCover stringByAppendingFormat:@"%@",[PCSetImageSizeManager componentStrWithImageWidth:PCMessageWebLinkAvatarWidth height:PCMessageWebLinkAvatarWidth]]] placeholderImage:[UIImage imageNamed:@"defaultLink"]];
    
    _titleLabel.frame = webLinkLayout.titleRect;
    _titleLabel.textLayout = webLinkLayout.titleTextLayout;
    
    _infoLabel.frame = webLinkLayout.infoRect;
    _infoLabel.textLayout = webLinkLayout.infoTextLayout;
}

#pragma mark Gesture Action
- (void)bubbleTapAction:(UITapGestureRecognizer *)gesture
{
    self.bubbleView.highlighted = YES;
    
    __weak typeof(self) weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        weakSelf.bubbleView.highlighted = NO;
    });
    NSLog(@"WebLink Mesage Tap...");
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(receiveViewEvent:layout:object:)]) {
        [self.delegate receiveViewEvent:PCWebLinkTapEvent layout:self.layout object:nil];
    }
}


@end
