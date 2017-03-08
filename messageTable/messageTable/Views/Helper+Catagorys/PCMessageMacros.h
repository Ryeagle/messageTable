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

#import "PCMessageCellProtocol.h"
#import "PCMessageHelper.h"
#import "UIImage+PCMessage.h"
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
#import "PCMessageWebLinkView.h"
#import "PCMessageFriendCardView.h"
#import "PCMessageMyCardView.h"
#import "PCMessageWalletAssistantView.h"

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

#define PCMessageTimeViewHeight                     31

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
#define PCMessageInviteInnerTopPadding              7
#define PCMessageInviteInnerBottomPadding           10
#define PCMessageInviteContentMaxWidth              200
#define PCMessageInviteTitleInfoPadding             5
#define PCMessageInviteInfoAvatarPadding            5
#define PCMessageInviteAvatarWidth                  50
#define PCMessageInviteInfoMaxWidth                 (PCMessageInviteContentMaxWidth - PCMessageInviteAvatarWidth - PCMessageInviteInfoAvatarPadding)

//网页分享
#define PCMessageWebLinkInnerLeftPadding            10
#define PCMessageWebLinkInnerTopPadding             7
#define PCMessageWebLinkInnerBottomPadding          10
#define PCMessageWebLinkContentMaxWidth             200
#define PCMessageWebLinkAvatarWidth                 50
#define PCMessageWebLinkTitleInfoPadding            5
#define PCMessageWebLinkInfoAvatarPadding           12.5
#define PCMessageWebLinkInfoMaxWidth                (PCMessageWebLinkContentMaxWidth - PCMessageWebLinkAvatarWidth - PCMessageWebLinkInfoAvatarPadding)

//好友名片,我的名片
#define PCMessageCardInnerPadding                   10
#define PCMessageCardTitleLinePadding               5
#define PCMessageCardLineAvatarPadding              5
#define PCMessageCardLineLeft                       1
#define PCMessageCardAvatarWidth                    50
#define PCMessageCardAvatarNamePadding              5
#define PCMessageCardNameMaxWidth                   140
#define PCMessageCardLineHeight                     1
#define PCMessageCardLineTitlePadding               3
#define PCMessageCardBottomPadding                  3
#define PCMessageCardLineColor                      UIColorRGB(0xEAEAEA)

//钱包助手
#define PCMessageWalletContentWidth                 (SCREEN_WIDTH - 30)
#define PCMessageWalletLeftPadding                  15
#define PCMessageWalletTopPadding                   12.5
#define PCMessageWalletBottomPadding                12.5
#define PCMessageWalletTitleWidth                   (PCMessageWalletContentWidth - 2 * PCMessageWalletLeftPadding)
#define PCMessageWalletDateWidth                    PCMessageWalletTitleWidth
#define PCMessageWalletAmountWidth                  PCMessageWalletTitleWidth
#define PCMessageWalletDetailHeight                 20
#define PCMessageWalletDetailTitleWidth             75
#define PCMessageWalletDetailCotentWidth            (PCMessageWalletTitleWidth - PCMessageWalletDetailTitleWidth)
#define PCMessageWalletLineHeight                   0.5
#define PCMessageWalletLineWidth                    PCMessageWalletTitleWidth
#define PCMessageWalletClickDetailHeight            20
#define PCMessageWalletTitleDatePadding             4
#define PCMessageWalletDateAmountPaddding           18
#define PCMessageWalletAmountDetailPaddding         36
#define PCMessageWalletDetailInnerPadding           4
#define PCMessageWalletDetailLinePadding            17
#define PCMessageWalletLineClickDetailPadding       12
#define PCMessageWalletArrowWidth                   13.5

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
#define PCMessageCardNameFontSize                   16
#define PCMessageCardTitleSize                      10
#define PCMessageWalletTitleFontSize                17
#define PCMessageWalletDateFontSize                 17
#define PCMessageWalletAmountFontSize               41
#define PCMessageWalletDetailFontSize               15
#define PCMessageWalletClickDetailFontSize          14

//正则
#define URLLINKREGULAR @"((http[s]{0,1}|ftp)://[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)|(www.[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)"
#define PHONEREGULAR @"((((\\+)|(00))?[- ]?\\d{1,9})[- ]?)?[0-9\\-]{5,26}"
#define EMAILREGULAR @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
#define ADRESSREGULAR @"\\d+\\.\\d+\\.\\d+\\.\\d+"

//TO Add
static NSString *PCPhotoMessageTapEvent = @"PCPhotoMessageTapEvent";
static NSString *PCResendTapEvent = @"PCResendTapEvent";
static NSString *PCCombinationMessageTapEvent = @"PCCombinationMessageTapEvent";
//Added
static NSString *PCMenuMoreEvent = @"PCMenuMoreEvent";
static NSString *PCMenuDeleteEvent = @"PCMenuDeleteEvent";
static NSString *PCMenuRevokeEvent = @"PCMenuRevokeEvent";
static NSString *PCMenuForwardEvent = @"PCMenuForwardEvent";
static NSString *PCMenuFavoriteEvent = @"PCMenuFavoriteEvent";
static NSString *PCMenuStickEvent = @"PCMenuStickEvent";
static NSString *PCMenuCopyEvent = @"PCMenuCopyEvent";
static NSString *PCWalletDetailTapEvent = @"PCWalletDetailTapEvent";
static NSString *PCAvatarLongPressEvent = @"PCAvatarLongPressEvent";
static NSString *PCContentLongPressEvent = @"PCContentLongPressEvent";
static NSString *PCAvatarTapEvent = @"PCAvatarTapEvent";
static NSString *PCFriendCardTapEvent = @"PCFriendCardTapEvent";
static NSString *PCChannelInviteTapEvent = @"PCChannelInviteTapEvent";
static NSString *PCMyCardsTapEvent = @"PCMyCardsTapEvent";
static NSString *PCBubbleDoubleTapEvent = @"PCBubbleDoubleTapEvent";
static NSString *PCWebLinkTapEvent = @"PCWebLinkTapEvent";
static NSString *PCFriendVerifyTapEvent = @"PCFriendVerifyTapEvent";
static NSString *PCURLStringTapEvent = @"PCURLStringTapEvent";
static NSString *PCPhoneNumberStringTapEvent = @"PCPhoneNumberStringTapEvent";
static NSString *PCEmailStringTapEvent = @"PCEmailStringTapEvent";
static NSString *PCAdressStringTapEvent = @"PCAdressStringTapEvent";
//Unuesed
static NSString *PCChannelApplyTapEvent = @"PCChannelApplyTapEvent";
static NSString *PCAddFriendPhoneTapEvent = @"PCAddFriendPhoneTapEvent";
#endif /* PCMessageMacros_h */
