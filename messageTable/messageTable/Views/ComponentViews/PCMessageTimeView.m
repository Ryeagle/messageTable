//
//  PCMessageTimeView.m
//  messageTable
//
//  Created by Ryeagler on 2017/2/28.
//  Copyright © 2017年 Ryeagle. All rights reserved.
//

#import "PCMessageTimeView.h"

@implementation PCMessageTimeView

- (instancetype)init
{
    self = [super init];
    if (self) {
        UIImage *image = [UIImage imageNamed:@"Chat_system_msg_bg"];
        CGFloat w = image.size.width * 0.5;
        CGFloat h = image.size.height * 0.5;
        self.image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(h, w, h, w)];
        
        _timeLabel = [YYLabel new];
        _timeLabel.textVerticalAlignment = YYTextVerticalAlignmentCenter;
        _timeLabel.clearContentsBeforeAsynchronouslyDisplay = NO;
        _timeLabel.displaysAsynchronously = YES;
        _timeLabel.ignoreCommonProperties = YES;
        _timeLabel.fadeOnHighlight = NO;
        _timeLabel.fadeOnAsynchronouslyDisplay = NO;
        [self addSubview:_timeLabel];
    }
    
    return self;
}
@end
