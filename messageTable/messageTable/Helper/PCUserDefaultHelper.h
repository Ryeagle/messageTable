//
//  PCUserDefaultHelper.h
//  messageTable
//
//  Created by Ryeagler on 2017/2/23.
//  Copyright © 2017年 Ryeagle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PCUserDefaultHelper : NSObject

+ (PCUserDefaultHelper *)sharedInstance;

@property (nonatomic, strong) NSString *userId;

@property (nonatomic, assign) BOOL showMemberName;

@end
