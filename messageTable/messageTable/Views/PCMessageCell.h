//
//  PCMessageCell.h
//  messageTable
//
//  Created by Ryeagler on 2017/2/24.
//  Copyright © 2017年 Ryeagle. All rights reserved.
//

@interface PCMessageCell : UITableViewCell<PCMessageCellProtocol>

@property (nonatomic, strong) UIView<PCMessageCellProtocol> *boundsView;

@property (nonatomic, strong) PCMessageLayout *layout;

@property (nonatomic, weak) id<PCMessageCellProtocol> delegate;

@end
