//
//  PCMessageTimeViewLayout.h
//  messageTable
//
//  Created by Ryeagler on 2017/2/28.
//  Copyright © 2017年 Ryeagle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PCMessageTimeViewLayout : NSObject
@property (nonatomic, strong) YYTextLayout *timeLabelLayout;
@property (nonatomic, assign) CGFloat viewWidth;
@property (nonatomic, assign) CGFloat viewHeight;
@property (nonatomic, assign) CGFloat timeLabelLeft;
@property (nonatomic, assign) CGFloat timeLabelTop;
@property (nonatomic, assign) CGFloat timeLabelWidth;
@property (nonatomic, assign) CGFloat timeLabelHeight;

- (instancetype)initWithMessageModel:(PCMessageModel *)messageModel;
@end
