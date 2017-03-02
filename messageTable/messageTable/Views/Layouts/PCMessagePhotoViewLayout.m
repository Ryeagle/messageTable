//
//  PCMessagePhotoViewLayout.m
//  messageTable
//
//  Created by Ryeagler on 2017/3/1.
//  Copyright © 2017年 Ryeagle. All rights reserved.
//

#import "PCMessagePhotoViewLayout.h"

@implementation PCMessagePhotoViewLayout
- (instancetype)initWithMessageModel:(PCMessageModel *)messageModel
{
    self = [super init];
    
    if (self) {
        [self reset];
        [self layout:messageModel];
    }
    
    return self;
}

- (void)reset
{
    _photoBubbleWidth = 0;
    _photoBubbleHeight = 0;
    _photoBubbleLeft = 0;
    _photoBubbleTop = 0;
}

- (void)layout:(PCMessageModel *)messageModel
{
    if (messageModel.message_bubble_type == PCMessageBubbleTypeSending) {
        _photoBubbleType = PCMessagePhotoBubbleTypeSender;
    } else {
        _photoBubbleType = PCMessagePhotoBubbleTypeReceiver;
    }

    CGFloat imgWidth = messageModel.photoWidth;
    CGFloat imgHeight = messageModel.photoHeight;
    if (imgHeight <= 0 || imgWidth <= 0) {
        _photoBubbleHeight = imgHeight;
        _photoBubbleWidth = imgWidth;
        return;
    }
    CGFloat widthScale = PCMessagePhotoMaxWidth / imgWidth;
    CGFloat heightScale = PCMessagePhotoMaxHeight / imgHeight;
    CGFloat scale = MIN(widthScale, heightScale);
    if (widthScale > 1 && heightScale > 1) {
        scale = MAX(widthScale, heightScale);
    }
    
    CGFloat imgWidthScaled = scale * imgWidth;
    CGFloat imgHeightScaled = scale * imgHeight;
    
    if (imgHeightScaled > PCMessagePhotoMinHeight && imgWidthScaled > PCMessagePhotoMinWidth) {
        _photoBubbleHeight = imgHeightScaled;
        _photoBubbleWidth = imgWidthScaled;
        return;
    } else {
        if (imgHeightScaled < PCMessagePhotoMinHeight) {
            imgHeightScaled = PCMessagePhotoMinHeight;
        } else if (imgWidthScaled < PCMessagePhotoMinWidth) {
            imgWidthScaled = PCMessagePhotoMinWidth;
        }
    }
    
    _photoBubbleHeight = imgHeightScaled;
    _photoBubbleWidth = imgWidthScaled;
    
}

- (void)messageContentLayout:(PCMessageLayout *)layout
{
    PCMessageModel *messageModel = layout.messageModel;
    CGFloat avatarViewLeft = 0.f;
    
    if (messageModel.message_bubble_type == PCMessageBubbleTypeSending) {
        avatarViewLeft = PCMessageAvatarSenderLeft;
        _photoBubbleLeft = avatarViewLeft - _photoBubbleWidth - PCMessagePhotoPadding;
    } else {
        avatarViewLeft = PCMessageAvatarReceiverLeft;
        _photoBubbleLeft = PCMessageAvatarReceiverLeft + PCMessageAvatarSize + PCMessagePhotoPadding;
    }

    layout.avatarViewLeft = avatarViewLeft;
    _photoBubbleTop = layout.avatarViewTop;

    layout.height = _photoBubbleTop + _photoBubbleHeight + PCMessageTopPadding + PCMessageTopPadding;

}
@end
