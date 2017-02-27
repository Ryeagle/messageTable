//
//  PCMessageComponentBubble.m
//  messageTable
//
//  Created by Ryeagler on 2017/2/24.
//  Copyright © 2017年 Ryeagle. All rights reserved.
//

#import "PCMessageComponentBubble.h"

#define T8TextMessageBackgroundImageDef(name, isSend, filePhone) \
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

T8TextMessageBackgroundImageDef(senderTextImage, true, @"Chat_text_sender_normal")
T8TextMessageBackgroundImageDef(receiverTextImage, false, @"Chat_text_receiver_normal")
T8TextMessageBackgroundImageDef(senderLinkImage, false, @"Chat_link_sender_normal")
T8TextMessageBackgroundImageDef(senderTextHighlightImage, true, @"Chat_text_sender_highlight")
T8TextMessageBackgroundImageDef(receiverTextHighlightImage, false, @"Chat_text_receiver_highlight")
T8TextMessageBackgroundImageDef(senderLinkHighlightImage, false, @"Chat_link_sender_highlight")

@implementation PCMessageComponentBubble

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.userInteractionEnabled = YES;
        
    }
    
    return self;
}

+ (PCMessageComponentBubbleType)componentBubbleType:(PCMessageModel *)messageModel
{
    switch (messageModel.media_type) {
        case PCMessageMediaTypeText:
            if (messageModel.message_bubble_type == PCMessageBubbleTypeSending) {
                return PCMessageComponentBubbleTypeTextSender;
            } else {
                return PCMessageComponentBubbleTypeTextReceiver;
            }
            break;
            
        default:
            break;
    }
    
    return PCMessageComponentBubbleTypeUnknown;
}

#pragma mark Private Method
- (void)setNormalImageWithType:(PCMessageComponentBubbleType)type
{
    switch (type) {
        case PCMessageComponentBubbleTypeTextSender:
            self.image = senderTextImage();
            break;
        case PCMessageComponentBubbleTypeLinkSender:
            self.image = senderLinkImage();
            break;
        case PCMessageComponentBubbleTypeTextReceiver:
        case PCMessageComponentBubbleTypeLinkReceiver:
            self.image = receiverTextImage();
            break;
        default:
            break;
    }
}

- (void)setHightlightImageWithType:(PCMessageComponentBubbleType)type
{
    switch (type) {
        case PCMessageComponentBubbleTypeTextSender:
            self.highlightedImage = senderTextHighlightImage();
            break;
        case PCMessageComponentBubbleTypeLinkSender:
            self.highlightedImage = senderLinkHighlightImage();
            break;
        case PCMessageComponentBubbleTypeTextReceiver:
        case PCMessageComponentBubbleTypeLinkReceiver:
            self.highlightedImage = receiverTextHighlightImage();
            break;
        default:
            break;
    }
}

#pragma mark Setter & Getter
- (void)setType:(PCMessageComponentBubbleType)type
{
    [self setNormalImageWithType:type];
    [self setHightlightImageWithType:type];
}

@end
