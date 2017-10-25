//
//  PCMessageCellProtocol.h
//  messageTable
//
//  Created by Ryeagler on 2017/3/3.
//  Copyright © 2017年 Ryeagle. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PCMessageLayout;
@class PCMessageCell;
@protocol PCMessageCellProtocol <NSObject>

@optional

- (void)setupLayout:(PCMessageLayout *)layout;

- (void)setDelegate:(id)delegate;

- (void)receiveViewEvent:(NSString *)eventPath layout:(PCMessageLayout *)layout object:(id)object;

- (void)receiveCellEvent:(NSString *)eventPaht cell:(PCMessageCell *)cell object:(id)object;
@end
