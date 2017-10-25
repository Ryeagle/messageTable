//
//  PCMessageAvatarBubble.h
//  messageTable
//
//  Created by Ryeagler on 2017/2/28.
//  Copyright © 2017年 Ryeagle. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, PCMessageAvatarBubbleType) {
    PCMessageAvatarBubbleTypeTextSender,
    PCMessageAvatarBubbleTypeTextReceiver,
    PCMessageAvatarBubbleTypeLinkSender,
    PCMessageAvatarBubbleTypeLinkReceiver,
    PCMessageAvatarBubbleTypeUnknown
};

@interface PCMessageAvatarBubble : UIImageView

@property (nonatomic, assign) PCMessageAvatarBubbleType type;

+ (PCMessageAvatarBubbleType)avatarBubbleType:(PCMessageModel *)messageModel;

@end
