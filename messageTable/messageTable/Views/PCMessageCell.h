//
//  PCMessageCell.h
//  messageTable
//
//  Created by Ryeagler on 2017/2/24.
//  Copyright © 2017年 Ryeagle. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YYLabel;
@class PCMessageComponentBubble;

@interface PCMessageComponentImageBubble : UIImageView

@end

@interface PCMessageComponentTimeView : UIImageView

@property (nonatomic, strong) YYLabel *timeLabel;

@end

@interface PCMessageComponentNameLabel : UIView

@property (nonatomic, strong) YYLabel *identityLabel;

@property (nonatomic, strong) YYLabel *nameLabel;

@end

@interface PCMessageTextView : UIView

@property (nonatomic, strong) PCMessageComponentTimeView *timeView;

@property (nonatomic, strong) UIImageView *avatarView;

@property (nonatomic, strong) PCMessageComponentBubble *bubbleView;

@property (nonatomic, strong) YYLabel *textLabel;

- (void)setWithLayout:(PCMessageLayout *)layout;

@end

@interface PCMessagePhotoView : UIView

@property (nonatomic, strong) UIImageView *avatarView;

@property (nonatomic, strong) PCMessageComponentImageBubble *bubbleView;

@end

@interface PCMessageWebLinkView : UIView

@property (nonatomic, strong) UIImageView *avatarView;

@property (nonatomic, strong) PCMessageComponentBubble *bubbleView;

@property (nonatomic, strong) YYLabel *titleLabel;

@property (nonatomic, strong) YYLabel *subtitileLabel;

@property (nonatomic, strong) UIImageView *coverView;

@end


@interface PCMessageCell : UITableViewCell

@property (nonatomic, strong) UIView *boundsView;

@property (nonatomic, strong) PCMessageLayout *layout;

@end
