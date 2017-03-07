//
//  PCMessageModel.m
//  messageTable
//
//  Created by Ryeagler on 2017/2/23.
//  Copyright © 2017年 Ryeagle. All rights reserved.
//

#import "PCMessageModel.h"

@implementation PCMessageModel

- (id)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self && dict != nil && [dict isKindOfClass:[NSDictionary class]]) {
        self.request_id = [dict stringForKey:@"request_id" withDefault:@""];
        self.message_id = [dict stringForKey:@"id" withDefault:@""];
        self.channel_id = [dict stringForKey:@"channel_id" withDefault:@""];
        self.creator = [dict stringForKey:@"creator" withDefault:@""];
        self.content = [[dict stringForKey:@"content" withDefault:@""] jsUnescape];
        self.media_type = [dict intForKey:@"media_type" withDefault:-100];
        self.message_type = [dict intForKey:@"message_type" withDefault:-100];
        self.chat_type = [dict intForKey:@"chat_type" withDefault:-100];
        self.seq = [dict intForKey:@"seq" withDefault:-100];
        self.created_at = [dict stringForKey:@"created_at" withDefault:@""];
        self.tseq = [dict stringForKey:@"tseq" withDefault:@""];
        self.send_status = PCMessageSendStatusDone;
        self.message_status = [dict intForKey:@"_status" withDefault:PCMessageStatusNormal];
        if ([self.creator isEqualToString:[PCUserDefaultHelper sharedInstance].userId]) {
            self.message_bubble_type = PCMessageBubbleTypeSending;
        }else{
            self.message_bubble_type = PCMessageBubbleTypeReceiving;
        }
        NSArray *readLimitArr = [dict arrayForKey:@"readLimit" withDefault:nil];
        if (readLimitArr) {
            self.read_limit = [readLimitArr componentsJoinedByString:@","];
        }
        
        NSDictionary *extend = [dict dictForKey:@"extend" withDefault:nil];
        if (extend) {
            if (self.media_type == PCMessageMediaTypePhoto) {
                //  若服务器未返回图片的宽高，则设置默认值为100*100
                self.photoWidth = [extend floatForKey:@"img_w" withDefault:100];
                self.photoHeight = [extend floatForKey:@"img_h" withDefault:100];
            }else if (self.media_type == PCMessageMediaTypeAudio){
                self.audioSeconds = @([extend floatForKey:@"seconds" withDefault:0]).stringValue;
            }else if (self.media_type == PCMessageMediaTypeInvite){
                self.invite_channel_id = [extend stringForKey:@"channel_id" withDefault:@""];
                self.invite_channel_name = [extend stringForKey:@"channel_name" withDefault:@""];
                self.invite_special_type = [extend intForKey:@"special_type" withDefault:0];
                self.invite_avatar = [extend stringForKey:@"channel_avatar" withDefault:@""];
                if (self.invite_avatar.length == 0) {
                    self.invite_avatar = [extend stringForKey:@"avatar" withDefault:@""];
                }
            }//好友名片  yangdan add
            else if (self.media_type == PCMessageMediaTypePersonCard) {
                self.friendCardName = [extend stringForKey:@"name" withDefault:@""];
                self.friendCardAvatar = [extend stringForKey:@"avatar" withDefault:@""];
                self.friendCardPhone = [extend stringForKey:@"phones" withDefault:@""];
                self.friendCard_UserId = [extend stringForKey:@"user_id" withDefault:@""];
            }else if (self.media_type == PCMessageMediaTypeText){
                self.atUserIds = [extend stringForKey:@"atUserIds" withDefault:@""];
            } else if (self.media_type == PCMessageMediaTypeWebLink) {
                self.webLinkTitle = [extend stringForKey:@"title" withDefault:@""];
                self.webLinkHost = [extend stringForKey:@"host" withDefault:@""];
                self.webLinkCover = [extend stringForKey:@"cover" withDefault:@""];
                self.webLinkDesc = [extend stringForKey:@"description" withDefault:@""];
            }
            else if (self.media_type == PCMessageMediaTypeMyCard) {
                self.myCard_id = [extend stringForKey:@"card_id" withDefault:@""];
            } else if (self.media_type == PCMessageMediaTypeCombination) {
                self.combinationTitle = [extend stringForKey:@"title" withDefault:@""];
                self.combinationCover = [extend stringForKey:@"cover" withDefault:@""];
                self.combinationDesc = [extend stringForKey:@"description" withDefault:@""];
                NSDictionary *tmpDic = [extend dictForKey:@"content" withDefault:@{}];
                if (tmpDic) {
                    NSData *tmpData = [NSJSONSerialization dataWithJSONObject:tmpDic options:NSJSONWritingPrettyPrinted error:NULL];
                    if (tmpData) {
                        self.combinationContent = tmpData;
                    } else {
                        self.combinationContent = [NSData data];
                    }
                } else {
                    self.combinationContent = [NSData data];
                }
            } else if (self.media_type == PCMessageMediaTypePhotoText) {
                NSDictionary *heading = extend[@"heading"];
                NSArray *menu = extend[@"menu"];
                if (!((heading && heading.count > 0) || (menu && menu.count > 0))) {
                    return nil;
                }
                
                NSData *tmpData = [NSJSONSerialization dataWithJSONObject:extend options:NSJSONWritingPrettyPrinted error:NULL];
                self.photoTextData = tmpData;
            } else if (self.media_type == PCMessageMeidaTypeWalletAssistant) {
                self.transActionTime = [extend[@"time"] doubleValue];
                self.walletType = [extend[@"type"] integerValue];
                self.amount = [extend[@"amount"] floatValue];
                self.orderId = extend[@"order_id"];
                self.recordsId = [extend[@"records_id"] integerValue];
                self.productName = extend[@"product_name"];
                self.payTarget = extend[@"pay_target"];
                self.payMethod = extend[@"pay_method"];
            }
        } else {
            if (self.media_type == PCMessageMediaTypePhotoText) {
                return nil;
            }
        }
        
        if (self.media_type == PCMessageMediaTypeChannel) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:[self.content dataUsingEncoding:NSUTF8StringEncoding] options:0 error:nil];
            self.link_applyLink = [dict stringForKey:@"link" withDefault:@""];
            self.link_channelId = [dict stringForKey:@"channel_id" withDefault:@""];
            self.link_channelAvatar = [dict stringForKey:@"channel_avatar" withDefault:@""];
            self.link_channelName = [dict stringForKey:@"channel_name" withDefault:@""];
            self.link_groupName = [dict stringForKey:@"group_name" withDefault:@""];
            NSDictionary *properties = [self.link_applyLink getPropertyFromUrl];
            self.link_type = [properties intForKey:@"type" withDefault:0];
        }
    }
    return self;
}


@end
