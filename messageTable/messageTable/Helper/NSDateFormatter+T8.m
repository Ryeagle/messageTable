/************************************************************
  *  * EaseMob CONFIDENTIAL 
  * __________________ 
  * Copyright (C) 2013-2014 EaseMob Technologies. All rights reserved. 
  *  
  * NOTICE: All information contained herein is, and remains 
  * the property of EaseMob Technologies.
  * Dissemination of this information or reproduction of this material 
  * is strictly forbidden unless prior written permission is obtained
  * from EaseMob Technologies.
  */

#import "NSDateFormatter+T8.h"

@implementation NSDateFormatter (T8)

+ (instancetype)dateFormatter
{
    return [[self alloc] init];
}

+ (instancetype)dateFormatterWithFormat:(NSString *)dateFormat
{
    static NSMutableDictionary *formatterCache = nil;
    static NSLock *accessLock = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (formatterCache == nil) {
            formatterCache = [NSMutableDictionary dictionary];
        }
        if (accessLock == nil) {
            accessLock = [[NSLock alloc] init];
        }
    });
    if (dateFormat == nil) {
        return nil;
    }
    [accessLock lock];
    NSDateFormatter *dateFormatter = [formatterCache objectForKey:dateFormat];
    if (dateFormatter == nil) {
        dateFormatter = [[self alloc] init];
        dateFormatter.dateFormat = dateFormat;
        [formatterCache setObject:dateFormatter forKey:dateFormat];
    }
    [accessLock unlock];
    return dateFormatter;
}

+ (instancetype)defaultDateFormatter
{
    return [self dateFormatterWithFormat:@"yyyy-MM-dd HH:mm:ss"];
}

@end
