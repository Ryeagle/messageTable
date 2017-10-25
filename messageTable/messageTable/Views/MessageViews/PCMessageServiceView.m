//
//  PCMessageServiceView.m
//  messageTable
//
//  Created by Ryeagler on 2017/3/1.
//  Copyright © 2017年 Ryeagle. All rights reserved.
//

#import "PCMessageServiceView.h"

@implementation PCMessageServiceView

- (instancetype)init
{
    self = [super init];
    if (self) {
        _serviceTextLabel = [YYLabel new];
        _serviceTextLabel.textVerticalAlignment = YYTextVerticalAlignmentTop;
        _serviceTextLabel.clearContentsBeforeAsynchronouslyDisplay = NO;
        _serviceTextLabel.displaysAsynchronously = YES;
        _serviceTextLabel.ignoreCommonProperties = YES;
        _serviceTextLabel.fadeOnHighlight = NO;
        _serviceTextLabel.fadeOnAsynchronouslyDisplay = NO;
        
        [self.bubbleView addSubview:_serviceTextLabel];
    }
    
    return self;
}

- (void)setLayout:(PCMessageLayout *)layout
{
    [super setLayout:layout];
    
    self.bubbleView.frame = CGRectMake(layout.contentViewLeft, layout.contentViewTop, layout.contentViewWidth, layout.contentViewHeight);
    self.bubbleView.image = [PCMessageHelper resizableImageWithName:@"Chat_system_msg_bg"];
    
    PCMessageServiceLayout *serviceLayout = (PCMessageServiceLayout *)layout.contentLayout;
    _serviceTextLabel.frame = CGRectMake(serviceLayout.serviceTextLabelLeft, serviceLayout.serviceTextLabelTop, serviceLayout.serviceTextLabelWidth, serviceLayout.serviceTextLabelHeight);
    _serviceTextLabel.textLayout = serviceLayout.serviceTextLayout;
}

@end
