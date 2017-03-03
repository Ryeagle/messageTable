//
//  PCMessageAvatarBubble.m
//  messageTable
//
//  Created by Ryeagler on 2017/2/28.
//  Copyright © 2017年 Ryeagle. All rights reserved.
//

#import "PCMessageAvatarBubble.h"

//有头像的气泡
#define PCTextMessageBackgroundImageDef(name, isSend, filePhone) \
static UIImage *name() \
{ \
static UIImage *image = nil; \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^ \
{ \
image = [[UIImage imageNamed:filePhone] stretchableImageWithLeftCapWidth:isSend ? 25 : (40 - 25) topCapHeight:30]; \
}); \
return image; \
}

PCTextMessageBackgroundImageDef(senderTextImage, true, @"Chat_text_sender_normal")
PCTextMessageBackgroundImageDef(receiverTextImage, false, @"Chat_text_receiver_normal")
PCTextMessageBackgroundImageDef(senderLinkImage, false, @"Chat_link_sender_normal")
PCTextMessageBackgroundImageDef(senderTextHighlightImage, true, @"Chat_text_sender_highlight")
PCTextMessageBackgroundImageDef(receiverTextHighlightImage, false, @"Chat_text_receiver_highlight")
PCTextMessageBackgroundImageDef(senderLinkHighlightImage, false, @"Chat_link_sender_highlight")

@implementation PCMessageAvatarBubble

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.userInteractionEnabled = YES;
        
    }
    
    return self;
}

+ (PCMessageAvatarBubbleType)avatarBubbleType:(PCMessageModel *)messageModel
{
    switch (messageModel.media_type) {
        case PCMessageMediaTypeText:
        case PCMessageMediaTypeAudio:
        case PCMessageMediaTypeRender:
            if (messageModel.message_bubble_type == PCMessageBubbleTypeSending) {
                return PCMessageAvatarBubbleTypeTextSender;
            } else {
                return PCMessageAvatarBubbleTypeTextReceiver;
            }
            break;
        case PCMessageMediaTypeInvite:
        case PCMessageMediaTypePersonCard:
        case PCMessageMediaTypeMyCard:
        case PCMessageMediaTypeWebLink:
        case PCMessageMediaTypeCombination:
            if (messageModel.message_bubble_type == PCMessageBubbleTypeSending) {
                return PCMessageAvatarBubbleTypeLinkSender;
            } else {
                return PCMessageAvatarBubbleTypeLinkReceiver;
            }
            break;
            
        default:
            if (messageModel.message_bubble_type == PCMessageBubbleTypeSending) {
                return PCMessageAvatarBubbleTypeTextSender;
            } else {
                return PCMessageAvatarBubbleTypeTextReceiver;
            }
            break;
    }
    
    return PCMessageAvatarBubbleTypeUnknown;
}

#pragma mark Private Method
- (void)setNormalImageWithType:(PCMessageAvatarBubbleType)type
{
    switch (type) {
        case PCMessageAvatarBubbleTypeTextSender:
            self.image = senderTextImage();
            break;
        case PCMessageAvatarBubbleTypeLinkSender:
            self.image = senderLinkImage();
            break;
        case PCMessageAvatarBubbleTypeTextReceiver:
        case PCMessageAvatarBubbleTypeLinkReceiver:
            self.image = receiverTextImage();
            break;
        default:
            break;
    }
}

- (void)setHightlightImageWithType:(PCMessageAvatarBubbleType)type
{
    switch (type) {
        case PCMessageAvatarBubbleTypeTextSender:
            self.highlightedImage = senderTextHighlightImage();
            break;
        case PCMessageAvatarBubbleTypeLinkSender:
            self.highlightedImage = senderLinkHighlightImage();
            break;
        case PCMessageAvatarBubbleTypeTextReceiver:
        case PCMessageAvatarBubbleTypeLinkReceiver:
            self.highlightedImage = receiverTextHighlightImage();
            break;
        default:
            break;
    }
}

#pragma mark Setter & Getter
- (void)setType:(PCMessageAvatarBubbleType)type
{
    [self setNormalImageWithType:type];
    [self setHightlightImageWithType:type];
}

@end
