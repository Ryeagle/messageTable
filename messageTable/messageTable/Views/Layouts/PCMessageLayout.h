//
//  PCMessageLayout.h
//  messageTable
//
//  Created by Ryeagler on 2017/2/27.
//  Copyright © 2017年 Ryeagle. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PCMessageLayoutProtol <NSObject>

@required
- (CGFloat)contentWidth;
- (CGFloat)contentHeight;
//- (void)messageContentLayout:(PCMessageLayout *)layout;

@end

@class PCMessageTimeViewLayout;
@class PCMessageNameViewLayout;

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

@property (nonatomic, assign) CGFloat contentViewTop;
@property (nonatomic, assign) CGFloat contentViewLeft;
@property (nonatomic, assign) CGFloat contentViewWidth;
@property (nonatomic, assign) CGFloat contentViewHeight;

#pragma mark 根据不同消息类型来区分的layout

@property (nonatomic, strong) id<PCMessageLayoutProtol>contentLayout;

- (instancetype)initWithMessageModel:(PCMessageModel *)messageModel;

@end
