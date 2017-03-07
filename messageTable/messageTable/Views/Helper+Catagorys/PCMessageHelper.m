//
//  PCMessageHelper.m
//  messageTable
//
//  Created by Ryeagler on 2017/2/24.
//  Copyright © 2017年 Ryeagle. All rights reserved.
//

#import "PCMessageHelper.h"

@implementation PCMessageHelper

+ (NSString *)getLayoutClassName:(PCMessageModel *)messageModel
{
    NSString *layoutClassName = @"";
    
    if (messageModel.media_type == PCMessageMediaTypeText) {
        
    } else if (messageModel.media_type == PCMessageMediaTypePhoto) {
        
    } else if (messageModel.media_type == PCMessageMediaTypeWebLink) {
        
    }
    
    return layoutClassName;
}

+ (NSString *)getReuseIdentifier:(PCMessageModel *)messageModel
{
    NSString *identifier = @"identifier";
    if (messageModel.message_type == PCMessageTypeService) {
        identifier = @"PCMessageTypeService";
    } else if (messageModel.media_type == PCMessageMediaTypeText) {
        identifier = @"PCMessageMediaTypeText";
    } else if (messageModel.media_type == PCMessageMediaTypePhoto) {
        identifier = @"PCMessageMediaTypePhoto";
    } else if (messageModel.media_type == PCMessageMediaTypeWebLink) {
        identifier = @"PCMessageMediaTypeWebLink";
    } else if (messageModel.media_type == PCMessageMediaTypeFriendVerify) {
        identifier = @"PCMessageMediaTypeFriendVerify";
    } else if (messageModel.media_type == PCMessageMeidaTypeWalletAssistant) {
        identifier = @"PCMessageMeidaTypeWalletAssistant";
    } else if (messageModel.media_type == PCMessageMediaTypePhotoText) {
        identifier = @"PCMessageMediaTypePhotoText";
    } else if (messageModel.media_type == PCMessageMediaTypeAudio) {
        identifier = @"PCMessageMediaTypeAudio";
    } else if (messageModel.media_type == PCMessageMediaTypeContact) {
        identifier = @"PCMessageMediaTypeContact";
    } else if (messageModel.media_type == PCMessageMediaTypeDocument) {
        identifier = @"PCMessageMediaTypeDocument";
    } else if (messageModel.media_type == PCMessageMediaTypeGeo) {
        identifier = @"PCMessageMediaTypeGeo";
    } else if (messageModel.media_type == PCMessageMediaTypeVideo) {
        identifier = @"PCMessageMediaTypeVideo";
    } else if (messageModel.media_type == PCMessageMediaTypeChannel) {
        identifier = @"PCMessageMediaTypeChannel";
    } else if (messageModel.media_type == PCMessageMediaTypeInvite) {
        identifier = @"PCMessageMediaTypeInvite";
    } else if (messageModel.media_type == PCMessageMediaTypePersonCard) {
        identifier = @"PCMessageMediaTypePersonCard";
    } else if (messageModel.media_type == PCMessageMediaTypeMyCard) {
        identifier = @"PCMessageMediaTypeMyCard";
    } else if (messageModel.media_type == PCMessageMediaTypeCombination) {
        identifier = @"PCMessageMediaTypeCombination";
    } else if (messageModel.media_type == PCMessageMediaTypeRender) {
        identifier = @"PCMessageMediaTypeRender";
    } else{
        identifier = @"PCMessageMediaTypeUnkown";
    }
    
    return identifier;
}

+ (UIImage *)resizableImageWithName:(NSString *)name
{
    UIImage *normal = [UIImage imageNamed:name];
    //拉伸的是图片中间的一个点
    CGFloat w = normal.size.width * 0.5;
    CGFloat h = normal.size.height * 0.5;
    return [normal resizableImageWithCapInsets:UIEdgeInsetsMake(h, w, h, w)];
}

+ (NSMutableAttributedString *) highlightTextWithModel:(PCMessageModel *)messageModel font:(UIFont *)font color:(UIColor *)color
{
    NSMutableAttributedString *textStr = [[NSMutableAttributedString alloc] initWithString:messageModel.content];
    textStr.font = font;
    textStr.color = color;
    
    if (messageModel.media_type == PCMessageMediaTypeText) {
        NSString* string = textStr.string;
        NSRange range = NSMakeRange(0,[string length]);
        for(NSString* expression in @[URLLINKREGULAR, PHONEREGULAR, EMAILREGULAR, ADRESSREGULAR]) {
            NSArray* matches = [[NSRegularExpression regularExpressionWithPattern:expression options:NSRegularExpressionDotMatchesLineSeparators error:nil] matchesInString:string options:0 range:range];
            for(NSTextCheckingResult* match in matches) {
                [self setHighlightInfo:@{@"String...." : @"Fuck The World"} withRange:match.range toText:textStr fillColor:UIColorHex(EBEEF0) highlightColor:UIColorHex(1A91DA)];
            }
        }
    } else if (messageModel.media_type == PCMessageMediaTypeFriendVerify) {
        NSRange range = [textStr.string rangeOfString:@" 发送朋友验证"];
        [self setHighlightInfo:@{@"String...." : @"Fuck The World"} withRange:range toText:textStr fillColor:UIColorHex(EBEEF0) highlightColor:UIColorHex(1A91DA)];
    }
    
    return textStr;
}

+ (void)setHighlightInfo:(NSDictionary*)info withRange:(NSRange)range toText:(NSMutableAttributedString *)text fillColor:(UIColor *)fillColor highlightColor:(UIColor *)hightlightColor
{
    if (range.length == 0 || text.length == 0) return;
    if (range.location >= text.length) return;
    if (range.location + range.length > text.length) return;
    
    YYTextBorder *border = [YYTextBorder new];
    border.cornerRadius = 3;
    border.insets = UIEdgeInsetsMake(-2, -2, -2, -2);
    border.fillColor = fillColor;
    
    YYTextHighlight *highlight = [YYTextHighlight new];
    [highlight setBackgroundBorder:border];
    highlight.userInfo = info;
    
    [text setTextHighlight:highlight range:range];
    [text setColor:hightlightColor range:range];
}

+ (BOOL)isNoAvatarView:(PCMessageModel *)messsageModel
{
    if (messsageModel.message_type == PCMessageTypeService) {
        return YES;
    }
    switch (messsageModel.media_type) {
        case PCMessageMediaTypeFriendVerify:
        case PCMessageMediaTypePhotoText:
        case PCMessageMeidaTypeWalletAssistant:
            return YES;
            break;
            
        default:
            break;
    }
    
    return NO;
}
@end
