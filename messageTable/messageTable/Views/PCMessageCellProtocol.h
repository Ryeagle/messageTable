//
//  PCMessageCellProtocol.h
//  messageTable
//
//  Created by Ryeagler on 2017/3/3.
//  Copyright © 2017年 Ryeagle. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PCMessageLayout;
@protocol PCMessageCellProtocol <NSObject>

- (void)setupLayout:(PCMessageLayout *)layout;

@end
