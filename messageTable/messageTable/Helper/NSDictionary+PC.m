//
//  NSDictionary+PC.m
//  messageTable
//
//  Created by Ryeagler on 2017/2/23.
//  Copyright © 2017年 Ryeagle. All rights reserved.
//

#import "NSDictionary+PC.h"

@implementation NSDictionary (PC)

-(NSString *)stringForKey:(NSString *)key withDefault:(NSString *)defVal{
    
    return ([self objectForKey:key] != nil && ![[self objectForKey:key] isEqual:[NSNull null]] && [[self objectForKey:key] isKindOfClass:[NSString class]])? [self objectForKey:key] : defVal;
}

-(NSDictionary *)dictForKey:(NSString *)key withDefault:(NSDictionary *)defVal
{
    
    return ([self objectForKey:key] != nil && [[self objectForKey:key] isKindOfClass:[NSDictionary class]])? [self objectForKey:key] : defVal;
}

-(NSArray *)arrayForKey:(NSString *)key withDefault:(NSArray *)defVal
{
    return ([self objectForKey:key] != nil && [[self objectForKey:key] isKindOfClass:[NSArray class]])? [self objectForKey:key] : defVal;
}

-(CGFloat)floatForKey:(NSString *)key withDefault:(CGFloat)defVal{
    @try {
        return [self objectForKey:key] != nil? [[self objectForKey:key] floatValue] : defVal;
    }
    @catch (NSException *exception) {
        return defVal;
    }
}

-(NSTimeInterval)timeIntervalForKey:(NSString *)key withDefault:(NSTimeInterval)defVal{
    @try {
        return [self objectForKey:key] != nil? [[self objectForKey:key] doubleValue] : defVal;
    }
    @catch (NSException *exception) {
        return defVal;
    }
}

-(NSInteger)intForKey:(NSString *)key withDefault:(NSInteger)defVal{
    @try {
        return [self objectForKey:key] != nil? [[self objectForKey:key] integerValue] : defVal;
    }
    @catch (NSException *exception) {
        return defVal;
    }
}

-(long long)longLongForKey:(NSString *)key withDefault:(long long)defVal{
    @try {
        return [self objectForKey:key] != nil? [[self objectForKey:key] longLongValue] : defVal;
    }
    @catch (NSException *exception) {
        return defVal;
    }
}

-(long)longForKey:(NSString *)key withDefault:(long)defVal{
    @try {
        return [self objectForKey:key] != nil? [[self objectForKey:key] longValue] : defVal;
    }
    @catch (NSException *exception) {
        return defVal;
    }
}

-(int)intValueForKey:(NSString *)key withDefault:(int)defVal{
    @try {
        return [self objectForKey:key] != nil? [[self objectForKey:key] intValue] : defVal;
    }
    @catch (NSException *exception) {
        return defVal;
    }
}

@end
