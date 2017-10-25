//
//  PCMessageFriendCardLayout.h
//  messageTable
//
//  Created by Ryeagler on 2017/3/2.
//  Copyright © 2017年 Ryeagle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PCMessageFriendCardLayout : NSObject<PCMessageLayoutProtol>
@property (nonatomic, assign) CGFloat viewWidth;
@property (nonatomic, assign) CGFloat viewHeight;

@property (nonatomic, assign) CGRect cardAvatarRect;
@property (nonatomic, assign) CGRect lineViewRect;

@property (nonatomic, assign) CGRect titleRect;
@property (nonatomic, strong) YYTextLayout *titleTextLayout;

@property (nonatomic, assign) CGRect nameRect;
@property (nonatomic, strong) YYTextLayout *nameTextLayout;

- (instancetype)initWithMessageModel:(PCMessageModel *)messageModel;
@end
