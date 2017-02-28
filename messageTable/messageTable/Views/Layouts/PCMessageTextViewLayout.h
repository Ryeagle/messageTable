//
//  PCMessageTextViewLayout.h
//  messageTable
//
//  Created by Ryeagler on 2017/2/28.
//  Copyright © 2017年 Ryeagle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PCMessageTextViewLayout : NSObject
@property (nonatomic, assign) CGFloat viewWidth;
@property (nonatomic, assign) CGFloat viewHeight;
@property (nonatomic, strong) YYTextLayout *textLayout;
@property (nonatomic, assign) CGFloat textLabelHeight;
@property (nonatomic, assign) CGFloat textLabelWidth;
@property (nonatomic, assign) CGFloat textLabelTop;
@property (nonatomic, assign) CGFloat textLabelLeft;

- (instancetype)initWithMessageModel:(PCMessageModel *)messageModel;
@end
