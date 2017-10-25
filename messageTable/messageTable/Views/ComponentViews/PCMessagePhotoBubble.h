//
//  PCMessagePhotoBubble.h
//  messageTable
//
//  Created by Ryeagler on 2017/3/1.
//  Copyright © 2017年 Ryeagle. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, PCMessagePhotoBubbleType) {
    PCMessagePhotoBubbleTypeSender,
    PCMessagePhotoBubbleTypeReceiver,
    PCMessagePhotoBubbleTypeUnknown
};

@interface PCMessagePhotoBubble : UIView

@property (nonatomic, assign) PCMessagePhotoBubbleType type;

@property (nonatomic, strong) UIImage *photoImage;

@end
