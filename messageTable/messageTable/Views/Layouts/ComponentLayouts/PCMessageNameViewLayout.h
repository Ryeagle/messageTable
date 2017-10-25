//
//  PCMessageNameViewLayout.h
//  messageTable
//
//  Created by Ryeagler on 2017/2/28.
//  Copyright © 2017年 Ryeagle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PCMessageNameViewLayout : NSObject
@property (nonatomic, strong) YYTextLayout *nameLabelLayout;
@property (nonatomic, assign) CGFloat viewWidth;
@property (nonatomic, assign) CGFloat viewHeight;
@property (nonatomic, assign) CGFloat identityButtonLeft;
@property (nonatomic, assign) CGFloat identityButtonTop;
@property (nonatomic, assign) CGFloat identityButtonWidth;
@property (nonatomic, assign) CGFloat identityButtonHeight;
@property (nonatomic, assign) CGFloat nameLabelLeft;
@property (nonatomic, assign) CGFloat nameLabelTop;
@property (nonatomic, assign) CGFloat nameLabelWidth;
@property (nonatomic, assign) CGFloat nameLabelHeight;

- (instancetype)initWithMessageModel:(PCMessageModel *)messageModel;
@end
