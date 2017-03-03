//
//  PCMessageWebLinkLayout.h
//  messageTable
//
//  Created by Ryeagler on 2017/3/2.
//  Copyright © 2017年 Ryeagle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PCMessageWebLinkLayout : NSObject<PCMessageLayoutProtol>
@property (nonatomic, assign) CGFloat viewWidth;
@property (nonatomic, assign) CGFloat viewHeight;
@property (nonatomic, assign) CGRect webLinkCoverRect;
@property (nonatomic, strong) YYTextLayout *titleTextLayout;
@property (nonatomic, assign) CGRect titleRect;
@property (nonatomic, strong) YYTextLayout *infoTextLayout;
@property (nonatomic, assign) CGRect infoRect;

- (instancetype)initWithMessageModel:(PCMessageModel *)messageModel;
@end
