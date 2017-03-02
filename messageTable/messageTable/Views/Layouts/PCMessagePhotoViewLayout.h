//
//  PCMessagePhotoViewLayout.h
//  messageTable
//
//  Created by Ryeagler on 2017/3/1.
//  Copyright © 2017年 Ryeagle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PCMessagePhotoViewLayout : NSObject<PCMessageLayoutProtol>
@property (nonatomic, assign) CGFloat photoBubbleTop;
@property (nonatomic, assign) CGFloat photoBubbleLeft;
@property (nonatomic, assign) CGFloat photoBubbleWidth;
@property (nonatomic, assign) CGFloat photoBubbleHeight;
@property (nonatomic, assign) PCMessagePhotoBubbleType photoBubbleType;

- (instancetype)initWithMessageModel:(PCMessageModel *)messageModel;
@end
