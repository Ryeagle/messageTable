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

#import "PCMessageHelper.h"
#import "PCMessageAvatarBubble.h"
#import "PCMessageTimeView.h"
#import "PCMessageNameView.h"
#import "PCMessageAvatarBaseView.h"
#import "PCMessageNoAvatarBaseView.h"
#import "PCMessageTextView.h"
#import "PCMessagePhotoBubble.h"
#import "PCMessagePhotoView.h"
#import "PCMessageServiceView.h"
#import "PCMessageFriendVerifyView.h"
#import "PCMessageInviteView.h"

#import "PCMessageLayout.h"
#import "PCMessageTextViewLayout.h"
#import "PCMessageTimeViewLayout.h"
#import "PCMessageNameViewLayout.h"
#import "PCMessageNameViewLayout.h"
#import "PCMessagePhotoViewLayout.h"
#import "PCMessageServiceLayout.h"
#import "PCMessageFriendVerifyLayout.h"
#import "PCMessageInviteLayout.h"
#import "PCMessageWebLinkLayout.h"
#import "PCMessageWalletAssistantLayout.h"
#import "PCMessagePhotoTextLayout.h"
#import "PCMessageRenderLayout.h"
#import "PCMessageCombinationLayout.h"
#import "PCMessageAudioLayout.h"
#import "PCMessageMyCardLayout.h"
#import "PCMessageFriendCardLayout.h"

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

//系统消息
#define PCMessageServiceInnerLeftPadding            5
#define PCMessageServiceInnerTopPadding             3.5
#define PCMessageServiceMaxWidth                    (SCREEN_WIDTH - 80)
#define PCMessageServiceMaxHeight                   (PCMessageSeriveMessageFontSize * 1.3)

//好友验证消息(本地)
#define PCMessageFriendVefiryLeftPadding            10
#define PCMessageFriendVefiryInnerLeftPadding       10
#define PCMessageFriendVefiryInnerTopPadding        10
#define PCMessageFriendVefiryMaxWidth               (SCREEN_WIDTH - 40)

//文字消息
#define PCMessageTextBubblePadding                  11
#define PCMessageTextMaxWidth                       (SCREEN_WIDTH - 150)
#define PCMessageTextMinHeight                      PCMessageAvatarSize
#define PCMessageTextInnerBottomPadding             3
#define PCMessageTextOneLineHeight                  27

//图片消息
#define PCMessagePhotoMaxWidth                      142
#define PCMessagePhotoMaxHeight                     142
#define PCMessagePhotoMinWidth                      48
#define PCMessagePhotoMinHeight                     48
#define PCMessagePhotoPadding                       5

//群聊邀请
#define PCMessageInviteInnerLeftPadding             10
#define PCMessageInviteInnerTopPadding              10
#define PCMessageInviteContentMaxWidth              200
#define PCMessageInviteTitleInfoPadding             5
#define PCMessageInviteInfoAvatarPadding            5
#define PCMessageInviteAvatarWidth                  45
#define PCMessageInviteInfoMaxWidth                 (PCMessageInviteContentMaxWidth - PCMessageInviteAvatarWidth - PCMessageInviteInfoAvatarPadding)

//网页分享
#define PCMessageWebLinkInnerLeftPadding            10
#define PCMessageWebLinkInnerTopPadding             10
#define PCMessageWebLinkContentMaxWidth             200
#define PCMessageWebLinkAvatarWidth                 45
#define PCMessageWebLinkTitleInfoPadding            5
#define PCMessageWebLinkInfoAvatarPadding           12.5
#define PCMessageWebLinkInfoMaxWidth                (PCMessageWebLinkContentMaxWidth - PCMessageWebLinkAvatarWidth - PCMessageWebLinkInfoAvatarPadding)


//字体大小
#define PCMessageNameFontSize                       12
#define PCMessageTextFontSize                       15
#define PCMessageSeriveMessageFontSize              12
#define PCMessageTimeFontSize                       12
#define PCMessageFriendVefiryFontSize               14
#define PCMessageInviteTitleFontSize                14
#define PCMessageInviteInfoFontSize                 12
#define PCMessageWebLinkTitleFontSize               14
#define PCMessageWebLinkInfoFontSize                12

//正则
#define URLLINKREGULAR @"((http[s]{0,1}|ftp)://[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)|(www.[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)"
#define PHONEREGULAR @"((((\\+)|(00))?[- ]?\\d{1,9})[- ]?)?[0-9\\-]{5,26}"
#define EMAILREGULAR @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
#define ADRESSREGULAR @"\\d+\\.\\d+\\.\\d+\\.\\d+"


#endif /* PCMessageMacros_h */
