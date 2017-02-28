//
//  PCMessageAvatarBubble.h
//  messageTable
//
//  Created by Ryeagler on 2017/2/28.
//  Copyright © 2017年 Ryeagle. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, PCMessageComponentBubbleType) {
    PCMessageComponentBubbleTypeTextSender,
    PCMessageComponentBubbleTypeTextReceiver,
    PCMessageComponentBubbleTypeLinkSender,
    PCMessageComponentBubbleTypeLinkReceiver,
    PCMessageComponentBubbleTypeUnknown
};

@interface PCMessageAvatarBubble : UIImageView

@property (nonatomic, assign) PCMessageComponentBubbleType type;

+ (PCMessageComponentBubbleType)componentBubbleType:(PCMessageModel *)messageModel;

@end
