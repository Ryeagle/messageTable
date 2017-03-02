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

- (instancetype)initWithMessageModel:(PCMessageModel *)messageModel;
@end
