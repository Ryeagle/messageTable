//
//  PCMessageNoAvatarBaseView.h
//  messageTable
//
//  Created by Ryeagler on 2017/2/28.
//  Copyright © 2017年 Ryeagle. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PCMessageNoAvatarBaseView : UIView
@property (nonatomic, strong) PCMessageTimeView *timeView;
@property (nonatomic, strong) PCMessageLayout *layout;
@property (nonatomic, strong) UIImageView *bubbleView;
@end
