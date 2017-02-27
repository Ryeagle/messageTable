//
//  PCMessageMacros.h
//  messageTable
//
//  Created by Ryeagler on 2017/2/24.
//  Copyright © 2017年 Ryeagle. All rights reserved.
//

#ifndef PCMessageMacros_h
#define PCMessageMacros_h

//#define RyeagleForTest
#import "PCMessageComponentBubble.h"
#import "PCMessageLayout.h"

//总体
#define PCMessageTopPadding                         5
#define PCMessageBottomPadding                      15

//时间
#define PCMessageTimeInnerPaddding                  2
#define PCMessageTimeBottomPadding                  10

//姓名
#define PCMessageNameHeight                         12
#define PCMessageNameBottomPadding                  3

//头像
#define PCMessageAvatarMarginPadding                15
#define PCMessageAvatarSize                         40
#define PCMessageAvatarReceiverLeft                 PCMessageAvatarMarginPadding
#define PCMessageAvatarSenderLeft                   (SCREEN_WIDTH - PCMessageAvatarSize - PCMessageAvatarMarginPadding)

//聊天气泡
#define PCMessageBubbleAvatarPadding                5
#define PCMessageBubbleAngleWidth                   7

//普通气泡

//文字
#define PCMessageTextBubblePadding                  11
#define PCMessageTextMaxWidth                       (SCREEN_WIDTH - 150)
#define PCMessageTextMinHeight                      PCMessageAvatarSize
#define PCMessageTextBottomPadding                  3
#define PCMessageTextLineHeight                     27

//文章分享
#define PCWebLinkMessageWidth                       190

//字体大小
#define PCMessageNameFontSize                       12
#define PCMEssageIdentityFontSize                   12
#define PCMessageTextFontSize                       15
#define PCMessageSystemMessageFontSize              12
#define PCMessageTimeFontSize                       13

#endif /* PCMessageMacros_h */
