//
//  PCMessageModel.h
//  messageTable
//
//  Created by Ryeagler on 2017/2/23.
//  Copyright © 2017年 Ryeagle. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, PCMessageBubbleType) {
    PCMessageBubbleTypeSending      = 0,    // 发送
    PCMessageBubbleTypeReceiving    = 1     // 接收
};

typedef NS_ENUM(NSInteger, PCMessageType) {
    PCMessageTypeUnkown     = -100,     //未知类型
    PCMessageTypePlain      = 1,        //普通消息
    PCMessageTypeForward    = 2,        //转发消息
    PCMessageTypeService    = 3         //系统消息
};

typedef NS_ENUM(NSInteger, PCMessageMediaType) {
    PCMessageMediaTypeUnkown            = -100,//未知
    PCMessageMediaTypeText              = -1,//文本
    PCMessageMediaTypeAudio             = 0,//音频
    PCMessageMediaTypeContact           = 1,//联系人
    PCMessageMediaTypeDocument          = 2,//附件
    PCMessageMediaTypeGeo               = 3,//地理位置
    PCMessageMediaTypePhoto             = 4,//图片
    PCMessageMediaTypeVideo             = 5,//视频
    PCMessageMediaTypeChannel           = 6,//频道申请链接（名片）
    PCMessageMediaTypeInvite            = 7,//频道邀请
    PCMessageMediaTypePersonCard        = 8,//好友名片
    PCMessageMediaTypeMyCard            = 9,//我的名片
    PCMessageMediaTypeWebLink           = 10,//网页链接
    PCMessageMediaTypeCombination       = 11,//合并
    PCMessageMediaTypeRender            = 12,//需要渲染（与机器人交互）
    PCMessageMediaTypePhotoText         = 13,//图文消息
    PCMessageMeidaTypeWalletAssistant   = 14,//钱包助手
    PCMessageMediaTypeFriendVerify      = 99 //开启了朋友验证（只用于本地）
};

typedef NS_ENUM(NSInteger, PCChatType) {
    PCChatTypeUnkown    = -100, //未知
    PCChatTypeGroup     = 0,    //群组消息
    PCChatTypeSingle    = 1     //单聊消息
};

typedef NS_ENUM(NSInteger, PCMessageSendStatus) {
    PCMessageSendStatusDone = 0,
    PCMessageSendStatusSending = 1,
    PCMessageSendStatusFail = 2
};

typedef NS_ENUM(NSInteger, PCMessageStatus) {
    PCMessageStatusPatched = -3,    //  服务器补充的default消息
    PCMessageStatusRevoked = -2,    //  已被撤销的消息
    PCMessageStatusDeleted = -1,    //  已被删除的消息
    PCMessageStatusError = 0,       //  错误的消息数据
    PCMessageStatusNormal = 1       //  正常的消息
};

typedef NS_ENUM(NSInteger, PCMessageRemoveType) {
    PCMessageRemoveTypeDelete = 1,      //  删除消息
    PCMessageRemoveTypeRevoke = 2       //  撤回消息
};

typedef NS_ENUM(NSInteger, PCMessageUpdateType) {
    PCMessageUpdateTypeCreate = 0,          //  添加消息
    PCMessageUpdateTypeSetSendStatus = 1,   //  设置发送状态
    PCMessageUpdateTypeSetTseq = 2,         //  设置tseq
    PCMessageUpdateTypeSetMessageId = 3,    //  设置messageId
    PCMessageUpdateTypeReset = 4,           //  重置消息
    PCMessageUpdateTypeRemove = 5,          //  移除消息
    PCMessageUpdateTypeSetLocalVoicePath = 6//  设置语音消息的本地音频文件路径
};


@interface PCMessageModel : NSObject


#pragma mark - json中的字段
@property (nonatomic, copy) NSString *tseq;
@property (nonatomic, copy) NSString *message_id;
@property (nonatomic, copy) NSString *channel_id;
@property (nonatomic, copy) NSString *creator;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, assign) NSInteger media_type;
@property (nonatomic, assign) NSInteger message_type;
@property (nonatomic, assign) NSInteger chat_type;
@property (nonatomic, assign) NSInteger seq;
@property (nonatomic, copy)   NSString *created_at;
@property (nonatomic, copy) NSString *request_id;
@property (nonatomic, copy) NSString *read_limit;
@property (nonatomic, assign) NSInteger message_status;

#pragma mark - 本地字段
@property (nonatomic, copy) NSString *ltseq;    //  本地生成的时间排序字段
@property (nonatomic, assign) NSInteger send_status;
@property (nonatomic, assign) CGFloat content_height;
@property (nonatomic, assign) NSInteger time_should_show;

#pragma mark - UI
@property (nonatomic, assign) PCMessageUpdateType update_type;

#pragma mark 自定义的字段
@property (nonatomic, assign) PCMessageBubbleType message_bubble_type;
@property (nonatomic, strong) NSString *fullname;
@property (nonatomic, strong) NSString *avatar;

#pragma mark Extend字段
@property (nonatomic, copy)   NSString *atUserIds;

@property (nonatomic) CGFloat photoWidth;
@property (nonatomic) CGFloat photoHeight;

@property (strong, nonatomic) NSString *audioSeconds;
@property (strong, nonatomic) NSString *voicePlayPath;

//频道邀请，mediatype == 7
@property (strong, nonatomic) NSString *invite_channel_id;
@property (strong, nonatomic) NSString *invite_channel_name;
@property (nonatomic) NSInteger invite_special_type;
@property (nonatomic,copy)NSString *invite_avatar;

//频道申请链接消息字段
@property (strong, nonatomic) NSString *link_channelId;
@property (strong, nonatomic) NSString *link_applyLink;
@property (strong, nonatomic) NSString *link_channelAvatar;
@property (strong, nonatomic) NSString *link_channelName;
@property (strong, nonatomic) NSString *link_groupName;
@property (nonatomic) NSInteger link_type;

//好友名片 name 头像字段
@property (nonatomic,copy) NSString *friendCardName;
@property (nonatomic,copy) NSString *friendCardAvatar;
@property (nonatomic,copy) NSString *friendCardPhone;
@property (nonatomic,copy) NSString  *friendCard_UserId;
//个人名片 card-id
@property (nonatomic,copy)NSString *myCard_id;

//网页链接消息
@property (nonatomic,copy) NSString *webLinkTitle;
@property (nonatomic,copy) NSString *webLinkHost;
@property (nonatomic,copy) NSString *webLinkCover;
@property (nonatomic,copy) NSString *webLinkDesc;

//图文混排消息
@property (nonatomic, copy) NSData *photoTextData;
@property (nonatomic, copy) NSDictionary *photoTextHeading;
@property (nonatomic, copy) NSArray *photoTextMenu;

//钱包助手
@property (nonatomic, assign) long long transActionTime;
@property (nonatomic, assign) NSInteger walletType;
@property (nonatomic, assign) CGFloat amount;
@property (nonatomic, copy) NSString *orderId;
@property (nonatomic, assign) NSInteger recordsId;
@property (nonatomic, copy) NSString *productName;
@property (nonatomic, copy) NSString *payTarget;
@property (nonatomic, copy) NSString *payMethod;

//历史记录消息
@property (nonatomic, copy) NSString *combinationTitle;
@property (nonatomic, copy) NSString *combinationCover;
@property (nonatomic, copy) NSString *combinationDesc;
@property (nonatomic, copy) NSData *combinationContent;   //  参考收藏接口的数据格式

- (id)initWithDict:(NSDictionary *)dict;


@end
