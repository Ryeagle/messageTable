//
//  PCMessageFriendVerifyLayout.h
//  messageTable
//
//  Created by Ryeagler on 2017/3/2.
//  Copyright © 2017年 Ryeagle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PCMessageFriendVerifyLayout : NSObject<PCMessageLayoutProtol>

@property (nonatomic, assign) CGFloat viewWidth;
@property (nonatomic, assign) CGFloat viewHeight;
@property (nonatomic, strong) YYTextLayout *verifyTextLayout;
@property (nonatomic, assign) CGRect verifyTextFrame;

- (instancetype)initWithMessageModel:(PCMessageModel *)messageModel;
@end
