//
//  PCMessageLayout.h
//  messageTable
//
//  Created by Ryeagler on 2017/2/27.
//  Copyright © 2017年 Ryeagle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PCMessageLayout : NSObject

@property (nonatomic, strong) PCMessageModel *messageModel;
@property (nonatomic, assign) CGFloat height;

//时间
@property (nonatomic, assign) BOOL shouldShowTime;
@property (nonatomic, strong) YYTextLayout *timeLabelLayout;
@property (nonatomic, assign) CGFloat timeViewLeft;
@property (nonatomic, assign) CGFloat timeViewTop;
@property (nonatomic, assign) CGFloat timeViewWidth;
@property (nonatomic, assign) CGFloat timeViewHeight;
@property (nonatomic, assign) CGFloat timeLabelLeft;
@property (nonatomic, assign) CGFloat timeLabelTop;
@property (nonatomic, assign) CGFloat timeLabelWidth;
@property (nonatomic, assign) CGFloat timeLabelHeight;

//姓名
@property (nonatomic, strong) YYTextLayout *identityLayout;
@property (nonatomic, strong) YYTextLayout *nameLayout;

//头像
@property (nonatomic, assign) CGFloat avatarViewLeft;
@property (nonatomic, assign) CGFloat avatarViewTop;

//气泡
@property (nonatomic, assign) CGFloat bubbleViewTop;
@property (nonatomic, assign) CGFloat bubbleViewLeft;
@property (nonatomic, assign) CGFloat bubbleViewWidth;
@property (nonatomic, assign) CGFloat bubbleViewHeight;
@property (nonatomic, assign) PCMessageComponentBubbleType bubbleType;

//文字消息
@property (nonatomic, strong) YYTextLayout *textLayout;
@property (nonatomic, assign) CGFloat textHeight;
@property (nonatomic, assign) CGFloat textWidth;
@property (nonatomic, assign) CGFloat textTop;
@property (nonatomic, assign) CGFloat textLeft;

//网页分享
@property (nonatomic, strong) YYTextLayout *mainContextLayout;
@property (nonatomic, strong) YYTextLayout *assistantContextLayout;

- (instancetype)initWithMessageModel:(PCMessageModel *)messageModel;

@end
