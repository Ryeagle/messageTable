//
//  PCMessageAvatarBaseView.h
//  messageTable
//
//  Created by Ryeagler on 2017/2/28.
//  Copyright © 2017年 Ryeagle. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PCMessageLayout;
@interface PCMessageAvatarBaseView : UIView<PCMessageCellProtocol>
@property (nonatomic, strong) PCMessageTimeView *timeView;
@property (nonatomic, strong) PCMessageNameView *nameView;
@property (nonatomic, strong) UIImageView *avatarView;
@property (nonatomic, strong) PCMessageAvatarBubble *bubbleView;
@property (nonatomic, strong) PCMessageLayout *layout;
@end
