//
//  PCMessageFriendCardView.h
//  messageTable
//
//  Created by Ryeagler on 2017/3/3.
//  Copyright © 2017年 Ryeagle. All rights reserved.
//

#import "PCMessageAvatarBaseView.h"

@interface PCMessageFriendCardView : PCMessageAvatarBaseView
@property (nonatomic, strong) UIImageView *cardAvatarView;
@property (nonatomic, strong) YYLabel *titleLabel;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) YYLabel *nameLabel;
@end
