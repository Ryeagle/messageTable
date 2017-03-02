//
//  PCMessageServiceLayout.h
//  messageTable
//
//  Created by Ryeagler on 2017/3/1.
//  Copyright © 2017年 Ryeagle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PCMessageServiceLayout : NSObject<PCMessageLayoutProtol>
@property (nonatomic, assign) CGFloat viewWidth;
@property (nonatomic, assign) CGFloat viewHeight;
@property (nonatomic, strong) YYTextLayout *serviceTextLayout;
@property (nonatomic, assign) CGFloat serviceTextLabelHeight;
@property (nonatomic, assign) CGFloat serviceTextLabelWidth;
@property (nonatomic, assign) CGFloat serviceTextLabelTop;
@property (nonatomic, assign) CGFloat serviceTextLabelLeft;

- (instancetype)initWithMessageModel:(PCMessageModel *)messageModel;
@end
