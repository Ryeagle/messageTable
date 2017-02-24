//
//  PCUserDefaultHelper.m
//  messageTable
//
//  Created by Ryeagler on 2017/2/23.
//  Copyright © 2017年 Ryeagle. All rights reserved.
//

#import "PCUserDefaultHelper.h"

@implementation PCUserDefaultHelper

+ (PCUserDefaultHelper *)sharedInstance
{
    static PCUserDefaultHelper *shareInstance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[PCUserDefaultHelper alloc]init];
    });
    
    return shareInstance;
}

- (id)init
{
    self = [super init];
    if (self) {
        
        unsigned int count;
        objc_property_t *properties = class_copyPropertyList([self class], &count);
        NSArray *ignore = [[self class] ignoreProperties];
        for (int i = 0; i < count; i++) {
            objc_property_t property = properties[i];
            NSString * key = [[NSString alloc]initWithCString:property_getName(property)  encoding:NSUTF8StringEncoding];
            if ([ignore containsObject:key]) {
                continue;
            }
            id value = [[NSUserDefaults standardUserDefaults] objectForKey:[self getUserDefaultKeyWithPath:key]];
            if (value) {
                [self setValue:value forKey:key];
            }
            [self addObserver:self forKeyPath:key options:NSKeyValueObservingOptionNew context:nil];
        }
        free(properties);
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    id value = [change objectForKey:@"new"];
    NSString *userDefaultKey = [self getUserDefaultKeyWithPath:keyPath];
    if (value && ![value isKindOfClass:[NSNull class]]) {
        [[NSUserDefaults standardUserDefaults] setObject:value forKey:userDefaultKey];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }else{
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:userDefaultKey];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

- (NSString *)getUserDefaultKeyWithPath:(NSString *)keyPath
{
    return [NSString stringWithFormat:@"RGUserDefaultKey_%@", keyPath];
}

+ (NSArray *)ignoreProperties
{
    return @[@"userId"];
}


@end
