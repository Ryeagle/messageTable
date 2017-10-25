//
//  PCMessageCell.m
//  messageTable
//
//  Created by Ryeagler on 2017/2/24.
//  Copyright © 2017年 Ryeagle. All rights reserved.
//

#import "PCMessageCell.h"
#import "PCMessageHelper.h"


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
    self.backgroundColor = AppBgColor;
    [self.backgroundView setBackgroundColor:AppBgColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)configContentView:(NSString *)reuseIdentifier
{
    if ([reuseIdentifier isEqualToString:@"PCMessageMediaTypeText"]) {
        _boundsView = [[PCMessageTextView alloc] init];
    } else if ([reuseIdentifier isEqualToString:@"PCMessageMediaTypePhoto"]) {
        _boundsView = [[PCMessagePhotoView alloc] init];
    } else if ([reuseIdentifier isEqualToString:@"PCMessageTypeService"]) {
        _boundsView = [[PCMessageServiceView alloc] init];
    } else if ([reuseIdentifier isEqualToString:@"PCMessageMediaTypeFriendVerify"]) {
        _boundsView = [[PCMessageFriendVerifyView alloc] init];
    } else if ([reuseIdentifier isEqualToString:@"PCMessageMeidaTypeWalletAssistant"]) {
        _boundsView = [[PCMessageWalletAssistantView alloc] init];
    } else if ([reuseIdentifier isEqualToString:@"PCMessageMediaTypeWebLink"]) {
        _boundsView = [[PCMessageWebLinkView alloc] init];
    } else if ([reuseIdentifier isEqualToString:@"PCMessageMediaTypeMyCard"]) {
        _boundsView = [[PCMessageMyCardView alloc] init];
    } else if ([reuseIdentifier isEqualToString:@"PCMessageMediaTypePersonCard"]) {
        _boundsView = [[PCMessageFriendCardView alloc] init];
    } else if ([reuseIdentifier isEqualToString:@"PCMessageMediaTypeInvite"]) {
        _boundsView = [[PCMessageInviteView alloc] init];
    } else if ([reuseIdentifier isEqualToString:@"PCMessageMediaTypePhotoText"]) {
    } else if ([reuseIdentifier isEqualToString:@"PCMessageMediaTypeRender"]) {
    } else if ([reuseIdentifier isEqualToString:@"PCMessageMediaTypeCombination"]) {
    } else if ([reuseIdentifier isEqualToString:@"PCMessageMediaTypeAudio"]) {
    } else {
        //不支持的消息类型
        _boundsView = [[PCMessageTextView alloc] init];
    }
    
    [_boundsView setDelegate:self];
    [self.contentView addSubview:_boundsView];
}

- (void)setLayout:(PCMessageLayout *)layout
{
    _layout = layout;
    [_boundsView setupLayout:layout];
}

- (void)receiveViewEvent:(NSString *)eventPath layout:(PCMessageLayout *)layout object:(id)object
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(receiveCellEvent:cell:object:)]) {
        [self.delegate receiveCellEvent:eventPath cell:self object:object];
    }
}
@end
