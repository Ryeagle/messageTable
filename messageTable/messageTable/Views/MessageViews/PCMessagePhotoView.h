//
//  PCMessagePhotoView.h
//  messageTable
//
//  Created by Ryeagler on 2017/3/1.
//  Copyright © 2017年 Ryeagle. All rights reserved.
//

#import "PCMessageAvatarBaseView.h"

@class PCMessagePhotoBubble;
@interface PCMessagePhotoView : PCMessageAvatarBaseView
@property (nonatomic, strong) PCMessagePhotoBubble *photoBubbleView;
@end
