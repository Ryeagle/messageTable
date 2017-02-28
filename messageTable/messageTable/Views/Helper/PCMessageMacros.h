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

#import "PCMessageAvatarBubble.h"
#import "PCMessageTimeView.h"
#import "PCMessageNameView.h"
#import "PCMessageAvatarBaseView.h"
#import "PCMessageNoInteractionBaseView.h"
#import "PCMessageNoAvatarBaseView.h"
#import "PCMessageTextView.h"
#import "PCMessageLayout.h"
#import "PCMessageTextViewLayout.h"
#import "PCMessageTimeViewLayout.h"
#import "PCMessageNameViewLayout.h"
#import "PCMessageNameViewLayout.h"

//总体
#define PCMessageTopPadding                         5
#define PCMessageBottomPadding                      15

//时间
#define PCMessageTimeInnerLeftPaddding              5
#define PCMessageTimeInnerTopPadding                3.5
#define PCMessageTimeBottomPadding                  10

//姓名
#define PCMessageNameHeight                         (PCMessageNameLabelHeight + 2 * PCMessageNameInnderPadding)
#define PCMessageNameLeftPaddding                   (PCMessageBubbleAvatarPadding + PCMessageBubbleAngleWidth)
#define PCMessageNameLabelHeight                    15
#define PCMessageNameLabelWidth                     (SCREEN_WIDTH - 180)
#define PCMessageAdminIdentityWidth                 40
#define PCMessageOwnerIdentityWidth                 28
#define PCMessageNameInnderPadding                  3

//头像
#define PCMessageAvatarMarginPadding                15
#define PCMessageAvatarSize                         40
#define PCMessageAvatarReceiverLeft                 PCMessageAvatarMarginPadding
#define PCMessageAvatarSenderLeft                   (SCREEN_WIDTH - PCMessageAvatarSize - PCMessageAvatarMarginPadding)

//聊天气泡
#define PCMessageBubbleAvatarPadding                5
#define PCMessageBubbleAngleWidth                   5

//普通气泡

//文字
#define PCMessageTextBubblePadding                  11
#define PCMessageTextMaxWidth                       (SCREEN_WIDTH - 150)
#define PCMessageTextMinHeight                      PCMessageAvatarSize
#define PCMessageTextInnerBottomPadding             3
#define PCMessageTextOneLineHeight                     27

//文章分享
#define PCWebLinkMessageWidth                       190

//字体大小
#define PCMessageNameFontSize                       12
#define PCMEssageIdentityFontSize                   12
#define PCMessageTextFontSize                       15
#define PCMessageSystemMessageFontSize              12
#define PCMessageTimeFontSize                       12

//正则
#define URLLINKREGULAR @"((http[s]{0,1}|ftp)://[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)|(www.[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)"
#define PHONEREGULAR @"((((\\+)|(00))?[- ]?\\d{1,9})[- ]?)?[0-9\\-]{5,26}"
#define EMAILREGULAR @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
#define ADRESSREGULAR @"\\d+\\.\\d+\\.\\d+\\.\\d+"

#endif /* PCMessageMacros_h */
