//
//  NSString+PC.h
//  messageTable
//
//  Created by Ryeagler on 2017/2/23.
//  Copyright © 2017年 Ryeagle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (PC)

- (NSDictionary *)getPropertyFromUrl;

- (NSInteger)charLength;

- (NSInteger)unicodeCharLength;

- (NSInteger)pc_length;

// 将字符串中的html字符替换成assic字符
- (NSString *)jsUnescape;

- (NSString *)jsEscape;
@end
