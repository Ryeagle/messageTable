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
    NSString *identifier = @"";
    
    if (messageModel.media_type == PCMessageMediaTypeText) {
        
    } else if (messageModel.media_type == PCMessageMediaTypePhoto) {
        
    } else if (messageModel.media_type == PCMessageMediaTypeWebLink) {
        
    }
    
    return identifier;
}

+ (NSString *)getViewClassName:(PCMessageModel *)messageModel
{
    NSString *viewClassName = @"";
    
    if (messageModel.media_type == PCMessageMediaTypeText) {
        
    } else if (messageModel.media_type == PCMessageMediaTypePhoto) {
        
    } else if (messageModel.media_type == PCMessageMediaTypeWebLink) {
        
    }
    
    return viewClassName;
}

@end
