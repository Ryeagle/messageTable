//
//  NSString+PC.m
//  messageTable
//
//  Created by Ryeagler on 2017/2/23.
//  Copyright © 2017年 Ryeagle. All rights reserved.
//

#import "NSString+PC.h"

@implementation NSString (PC)

- (NSDictionary *)getPropertyFromUrl
{
    NSMutableDictionary *result = [NSMutableDictionary dictionary];
    NSArray *arr1 = [self componentsSeparatedByString:@"?"];
    if (arr1.count == 2) {
        NSString *properties = arr1.lastObject;
        NSArray *arr2 = [properties componentsSeparatedByString:@"&"];
        [arr2 enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSArray *arr3 = [obj componentsSeparatedByString:@"="];
            if (arr3.count == 2) {
                NSString *key = arr3.firstObject;
                NSString *value = arr3.lastObject;
                [result setObject:value forKey:key];
            }
        }];
    }
    return result;
}

- (NSInteger)charLength
{
    NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    NSData* da = [self dataUsingEncoding:enc];
    return [da length];
}

- (NSInteger)unicodeCharLength
{
    NSInteger strlength = 0;
    char* p = (char*)[self cStringUsingEncoding:NSUnicodeStringEncoding];
    for (int i=0 ; i<[self lengthOfBytesUsingEncoding:NSUnicodeStringEncoding] ;i++) {
        if (*p) {
            p++;
            strlength++;
        }
        else {
            p++;
        }
        
    }
    
    return (strlength + 1) / 2;
}

- (NSInteger)gb18030Length
{
    return [self lengthOfBytesUsingEncoding:CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000)];
}

- (NSInteger)pc_length
{
    NSInteger pc_lenght = 0;
    
    char* p1 = (char*)[self cStringUsingEncoding:NSUTF8StringEncoding];
    long len = strlen(p1);
    for (int i = 0; i < len;) {
        if ((uint8_t)(p1[i]) < 128) {
            pc_lenght += 1;
            i += 1;
        } else if ((uint8_t)(p1[i]) < 192) {
            //                NSLog(@"Error");
        } else if ((uint8_t)(p1[i]) < 224) {
            pc_lenght += 2;
            i += 2;
        } else if ((uint8_t)(p1[i]) < 240) {
            pc_lenght += 2;
            i += 3;
        } else if ((uint8_t)(p1[i]) < 248) {
            pc_lenght += 4;
            i += 4;
        }
    }
    
    return pc_lenght;
}

- (NSString *)jsUnescape
{
    if (self.length <= 0) {
        return [self copy];
    }
    
    NSString *str;
    str = [self stringByReplacingOccurrencesOfString:@"&amp;" withString:@"&"];
    str = [str stringByReplacingOccurrencesOfString:@"&lt;" withString:@"<"];
    str = [str stringByReplacingOccurrencesOfString:@"&gt;" withString:@">"];
    str = [str stringByReplacingOccurrencesOfString:@"&quot;" withString:@"\""];
    str = [str stringByReplacingOccurrencesOfString:@"&apos;" withString:@"\\"];
    str = [str stringByReplacingOccurrencesOfString:@"&#x2F;" withString:@"/"];
    return str;
}

- (NSString *)jsEscape
{
    if (self.length <= 0) {
        return [self copy];
    }
    
    NSString *str;
    str = [self stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"];
    str = [str stringByReplacingOccurrencesOfString:@"<" withString:@"&lt;"];
    str = [str stringByReplacingOccurrencesOfString:@">" withString:@"&gt;"];
    str = [str stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"];
    str = [str stringByReplacingOccurrencesOfString:@"\\" withString:@"&apos;"];
    str = [str stringByReplacingOccurrencesOfString:@"/" withString:@"&#x2F;"];
    return str;
}

@end
