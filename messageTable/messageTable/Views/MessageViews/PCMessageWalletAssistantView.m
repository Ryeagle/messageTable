//
//  PCMessageWalletAssistantView.m
//  messageTable
//
//  Created by Ryeagler on 2017/3/6.
//  Copyright © 2017年 Ryeagle. All rights reserved.
//

#import "PCMessageWalletAssistantView.h"


@implementation PCMessageWalletDetailView

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        _titleLabel = [YYLabel new];
        _titleLabel.textVerticalAlignment = YYTextVerticalAlignmentTop;
        _titleLabel.clearContentsBeforeAsynchronouslyDisplay = NO;
        _titleLabel.displaysAsynchronously = YES;
        _titleLabel.ignoreCommonProperties = YES;
        _titleLabel.fadeOnHighlight = NO;
        _titleLabel.fadeOnAsynchronouslyDisplay = NO;
        [self addSubview:_titleLabel];
        
        _contentLabel = [YYLabel new];
        _contentLabel.textVerticalAlignment = YYTextVerticalAlignmentTop;
        _contentLabel.clearContentsBeforeAsynchronouslyDisplay = NO;
        _contentLabel.displaysAsynchronously = YES;
        _contentLabel.ignoreCommonProperties = YES;
        _contentLabel.fadeOnHighlight = NO;
        _contentLabel.fadeOnAsynchronouslyDisplay = NO;
        [self addSubview:_contentLabel];
    }
    
    return self;
}

@end

@implementation PCMessageWalletAssistantView

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        _titleLabel = [YYLabel new];
        _titleLabel.textVerticalAlignment = YYTextVerticalAlignmentTop;
        _titleLabel.clearContentsBeforeAsynchronouslyDisplay = NO;
        _titleLabel.displaysAsynchronously = YES;
        _titleLabel.ignoreCommonProperties = YES;
        _titleLabel.fadeOnHighlight = NO;
        _titleLabel.fadeOnAsynchronouslyDisplay = NO;
        [self.bubbleView addSubview:_titleLabel];
        
        _dateLabel = [YYLabel new];
        _dateLabel.textVerticalAlignment = YYTextVerticalAlignmentTop;
        _dateLabel.clearContentsBeforeAsynchronouslyDisplay = NO;
        _dateLabel.displaysAsynchronously = YES;
        _dateLabel.ignoreCommonProperties = YES;
        _dateLabel.fadeOnHighlight = NO;
        _dateLabel.fadeOnAsynchronouslyDisplay = NO;
        [self.bubbleView addSubview:_dateLabel];
        
        _amountLabel = [YYLabel new];
        _amountLabel.textVerticalAlignment = YYTextVerticalAlignmentTop;
        _amountLabel.clearContentsBeforeAsynchronouslyDisplay = NO;
        _amountLabel.displaysAsynchronously = YES;
        _amountLabel.ignoreCommonProperties = YES;
        _amountLabel.fadeOnHighlight = NO;
        _amountLabel.fadeOnAsynchronouslyDisplay = NO;
        [self.bubbleView addSubview:_amountLabel];
        
        _productView = [[PCMessageWalletDetailView alloc] init];
        _productView.hidden = YES;
        [self.bubbleView addSubview:_productView];
        
        _orderIdView = [[PCMessageWalletDetailView alloc] init];
        [self.bubbleView addSubview:_orderIdView];
        
        _transactionTimeView = [[PCMessageWalletDetailView alloc] init];
        [self.bubbleView addSubview:_transactionTimeView];
        
        _payMethodView = [[PCMessageWalletDetailView alloc] init];
        _payMethodView.hidden = YES;
        [self.bubbleView addSubview:_payMethodView];
        
        _payTargetView = [[PCMessageWalletDetailView alloc] init];
        _payTargetView.hidden = YES;
        [self.bubbleView addSubview:_payTargetView];
        
        _lineView = [UIImageView new];
        [self.bubbleView addSubview:_lineView];
        
        _clickViewDetailLabel = [YYLabel new];
        _clickViewDetailLabel.textVerticalAlignment = YYTextVerticalAlignmentTop;
        _clickViewDetailLabel.clearContentsBeforeAsynchronouslyDisplay = NO;
        _clickViewDetailLabel.displaysAsynchronously = YES;
        _clickViewDetailLabel.ignoreCommonProperties = YES;
        _clickViewDetailLabel.fadeOnHighlight = NO;
        _clickViewDetailLabel.fadeOnAsynchronouslyDisplay = NO;
        [self.bubbleView addSubview:_clickViewDetailLabel];
        
        _arrowView = [UIImageView new];
        [self.bubbleView addSubview:_arrowView];

    }
    
    return self;
}

- (void)setLayout:(PCMessageLayout *)layout
{
    [super setLayout:layout];
    
    PCMessageModel *messageModel = layout.messageModel;
    
    self.bubbleView.frame = CGRectMake(layout.contentViewLeft, layout.contentViewTop, layout.contentViewWidth, layout.contentViewHeight);
    self.bubbleView.image = [PCMessageHelper resizableImageWithName:@"photoText_msg_bg"];
    
    PCWalletType walletType = messageModel.walletType;
    
    PCMessageWalletAssistantLayout *walletAssistantLayout = (PCMessageWalletAssistantLayout *)layout.contentLayout;
    
    _titleLabel.frame = walletAssistantLayout.titleRect;
    _titleLabel.textLayout = walletAssistantLayout.titleTextLayout;
    
    _dateLabel.frame = walletAssistantLayout.dateRect;
    _dateLabel.textLayout = walletAssistantLayout.dateTextLayout;
    
    _amountLabel.frame = walletAssistantLayout.amountRect;
    _amountLabel.textLayout = walletAssistantLayout.amountTextLayout;

    _orderIdView.frame = walletAssistantLayout.orderIdViewRect;
    _orderIdView.titleLabel.frame = walletAssistantLayout.orderIdViewLayout.titleRect;
    _orderIdView.titleLabel.textLayout = walletAssistantLayout.orderIdViewLayout.titleLayout;
    _orderIdView.contentLabel.frame = walletAssistantLayout.orderIdViewLayout.contentRect;
    _orderIdView.contentLabel.textLayout = walletAssistantLayout.orderIdViewLayout.contentLayout;
    
    _transactionTimeView.frame = walletAssistantLayout.transactionTimeRect;
    _transactionTimeView.titleLabel.frame = walletAssistantLayout.transactionTimeLayout.titleRect;
    _transactionTimeView.titleLabel.textLayout = walletAssistantLayout.transactionTimeLayout.titleLayout;
    _transactionTimeView.contentLabel.frame = walletAssistantLayout.transactionTimeLayout.contentRect;
    _transactionTimeView.contentLabel.textLayout = walletAssistantLayout.transactionTimeLayout.contentLayout;

    if (walletType == PCWalletTypePay || walletType == PCWalletTypeCoinPay) {
        _productView.hidden = NO;
        _payMethodView.hidden = NO;
        _payTargetView.hidden = NO;
        
        _productView.frame = walletAssistantLayout.productViewRect;
        _productView.titleLabel.frame = walletAssistantLayout.productViewLayout.titleRect;
        _productView.titleLabel.textLayout = walletAssistantLayout.productViewLayout.titleLayout;
        _productView.contentLabel.frame = walletAssistantLayout.productViewLayout.contentRect;
        _productView.contentLabel.textLayout = walletAssistantLayout.productViewLayout.contentLayout;

        _payMethodView.frame = walletAssistantLayout.payMethodRect;
        _payMethodView.titleLabel.frame = walletAssistantLayout.payMethodLayout.titleRect;
        _payMethodView.titleLabel.textLayout = walletAssistantLayout.payMethodLayout.titleLayout;
        _payMethodView.contentLabel.frame = walletAssistantLayout.payMethodLayout.contentRect;
        _payMethodView.contentLabel.textLayout = walletAssistantLayout.payMethodLayout.contentLayout;

        _payTargetView.frame = walletAssistantLayout.payTargetRect;
        _payTargetView.titleLabel.frame = walletAssistantLayout.payTargetLayout.titleRect;
        _payTargetView.titleLabel.textLayout = walletAssistantLayout.payTargetLayout.titleLayout;
        _payTargetView.contentLabel.frame = walletAssistantLayout.payTargetLayout.contentRect;
        _payTargetView.contentLabel.textLayout = walletAssistantLayout.payTargetLayout.contentLayout;

    } else {
        _productView.hidden = YES;
        _payMethodView.hidden = YES;
        _payTargetView.hidden = YES;
    }
    
    _lineView.frame = walletAssistantLayout.lineRect;
    _lineView.image = [UIImage imageWithColor:AppBgColor];
    
    _clickViewDetailLabel.frame = walletAssistantLayout.clickViewDetailRect;
    _clickViewDetailLabel.textLayout = walletAssistantLayout.clickViewDetailTextLayout;
    
    _arrowView.frame = walletAssistantLayout.arrowRect;
    _arrowView.contentMode = UIViewContentModeScaleAspectFit;
    _arrowView.image = [UIImage imageNamed:@"profile_contact_arrow"];

}


@end
