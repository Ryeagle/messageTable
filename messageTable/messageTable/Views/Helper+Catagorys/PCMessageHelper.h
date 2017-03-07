//
//  PCMessageHelper.h
//  messageTable
//
//  Created by Ryeagler on 2017/2/24.
//  Copyright © 2017年 Ryeagle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PCMessageHelper : NSObject

+ (NSString *)getReuseIdentifier:(PCMessageModel *)messageModel;

+ (UIImage *)resizableImageWithName:(NSString *)name;

+ (BOOL)isNoAvatarView:(PCMessageModel *)messsageModel;

+ (NSMutableAttributedString *) highlightTextWithModel:(PCMessageModel *)messageModel font:(UIFont *)font color:(UIColor *)color;
@end
