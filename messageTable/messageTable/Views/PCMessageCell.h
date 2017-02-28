//
//  PCMessageCell.h
//  messageTable
//
//  Created by Ryeagler on 2017/2/24.
//  Copyright © 2017年 Ryeagle. All rights reserved.
//

@class YYLabel;

@interface PCMessageComponentImageBubble : UIImageView

@end


@interface PCMessagePhotoView : UIView

@property (nonatomic, strong) UIImageView *avatarView;

@property (nonatomic, strong) PCMessageComponentImageBubble *bubbleView;

@end

@interface PCMessageWebLinkView : UIView

@property (nonatomic, strong) UIImageView *avatarView;

@property (nonatomic, strong) PCMessageAvatarBubble *bubbleView;

@property (nonatomic, strong) YYLabel *titleLabel;

@property (nonatomic, strong) YYLabel *subtitileLabel;

@property (nonatomic, strong) UIImageView *coverView;

@end


@interface PCMessageCell : UITableViewCell

@property (nonatomic, strong) UIView *boundsView;

@property (nonatomic, strong) PCMessageLayout *layout;

@end
