//
//  PCMessageLayout.h
//  messageTable
//
//  Created by Ryeagler on 2017/2/27.
//  Copyright © 2017年 Ryeagle. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PCMessageTimeViewLayout;
@class PCMessageNameViewLayout;
@class PCMessageTextViewLayout;
@interface PCMessageLayout : NSObject

@property (nonatomic, strong) PCMessageModel *messageModel;
@property (nonatomic, assign) CGFloat height;

//时间
@property (nonatomic, assign) BOOL shouldShowTime;
@property (nonatomic, assign) CGFloat timeViewLeft;
@property (nonatomic, assign) CGFloat timeViewTop;
@property (nonatomic, strong) PCMessageTimeViewLayout *timeViewLayout;

//身份与姓名
@property (nonatomic, strong) YYTextLayout *identityLayout;
@property (nonatomic, strong) PCMessageNameViewLayout *nameViewLayout;

//头像
@property (nonatomic, assign) CGFloat avatarViewLeft;
@property (nonatomic, assign) CGFloat avatarViewTop;

//对话气泡
@property (nonatomic, assign) CGFloat avatarBubbleViewTop;
@property (nonatomic, assign) CGFloat avatarBubbleViewLeft;
@property (nonatomic, assign) CGFloat avatarBubbleViewWidth;
@property (nonatomic, assign) CGFloat avatarBubbleViewHeight;
@property (nonatomic, assign) PCMessageComponentBubbleType bubbleType;

//文字消息
@property (nonatomic, strong) PCMessageTextViewLayout *textViewLayout;

//网页分享
@property (nonatomic, strong) YYTextLayout *mainContextLayout;
@property (nonatomic, strong) YYTextLayout *assistantContextLayout;

- (instancetype)initWithMessageModel:(PCMessageModel *)messageModel;

@end
