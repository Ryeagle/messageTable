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
#warning 据说clearColor性能不高,之后再优化
    self.backgroundColor = [UIColor clearColor];
    [self.backgroundView setBackgroundColor:[UIColor clearColor]];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)configContentView:(NSString *)reuseIdentifier
{
    _boundsView = [[PCMessageTextView alloc] init];
    
    [self.contentView addSubview:_boundsView];
}

- (void)setLayout:(PCMessageLayout *)layout
{
    _layout = layout;
    PCMessageTextView *textView = (PCMessageTextView *)_boundsView;
    [textView setLayout:layout];
}
@end
