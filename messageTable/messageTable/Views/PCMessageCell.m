//
//  PCMessageCell.m
//  messageTable
//
//  Created by Ryeagler on 2017/2/24.
//  Copyright © 2017年 Ryeagle. All rights reserved.
//

#import "PCMessageCell.h"
#import "PCMessageHelper.h"


@implementation PCMessageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self configDefault];
        [self configContentView:reuseIdentifier];
    }
    
    return self;
}

- (void)configDefault
{
    self.userInteractionEnabled = YES;
    self.backgroundColor = [UIColor clearColor];
    [self.backgroundView setBackgroundColor:[UIColor clearColor]];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)configContentView:(NSString *)reuseIdentifier
{
    if ([reuseIdentifier isEqualToString:@"PCMessageMediaTypeText"]) {
        _boundsView = [[PCMessageTextView alloc] init];
    } else if ([reuseIdentifier isEqualToString:@"PCMessageMediaTypePhoto"]) {
        _boundsView = [[PCMessagePhotoView alloc] init];
    } else if ([reuseIdentifier isEqualToString:@"PCMessageTypeService"]) {
        _boundsView = [[PCMessageServiceView alloc] init];
    } else if ([reuseIdentifier isEqualToString:@"PCMessageMediaTypeFriendVerify"]) {
        _boundsView = [[PCMessageFriendVerifyView alloc] init];
    }
    else {
        
    }
    
    [self.contentView addSubview:_boundsView];
}

- (void)setLayout:(PCMessageLayout *)layout
{
    _layout = layout;
    if ([self.reuseIdentifier isEqualToString:@"PCMessageMediaTypeText"]) {
        PCMessageTextView *textView = (PCMessageTextView *)_boundsView;
        [textView setLayout:layout];
    } else if ([self.reuseIdentifier isEqualToString:@"PCMessageMediaTypePhoto"]) {
        PCMessagePhotoView *photoView = (PCMessagePhotoView *)_boundsView;
        [photoView setLayout:layout];
    } else if ([self.reuseIdentifier isEqualToString:@"PCMessageTypeService"]) {
        PCMessageServiceView *serviceView = (PCMessageServiceView *)_boundsView;
        [serviceView setLayout:layout];
    } else if ([self.reuseIdentifier isEqualToString:@"PCMessageMediaTypeFriendVerify"]) {
        PCMessageFriendVerifyView *verifyView = (PCMessageFriendVerifyView *)_boundsView;
        [verifyView setLayout:layout];
    }
    else {
        
    }
}
@end
