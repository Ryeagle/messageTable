//
//  PCMessageWalletAssistantLayout.m
//  messageTable
//
//  Created by Ryeagler on 2017/3/2.
//  Copyright © 2017年 Ryeagle. All rights reserved.
//

#import "PCMessageWalletAssistantLayout.h"

@implementation PCMessageWalletDetailLayout

- (instancetype)initWithTitle:(NSString *)title content:(NSString *)content
{
    self = [super init];
    if (self) {
        [self reset];
        [self layout:title content:content];
    }
    
    return self;
}

- (void)reset
{
    _titleRect = CGRectZero;
    _contentRect = CGRectZero;
    _viewHeight = 0.f;
    _viewWidth = 0.f;
}

- (void)layout:(NSString *)title content:(NSString *)content
{
    NSMutableAttributedString *titleStr = [[NSMutableAttributedString alloc] initWithString:title];
    titleStr.font = [UIFont systemFontOfSize:PCMessageWalletDetailFontSize];
    titleStr.color = AssistContentColor;
    YYTextContainer *titleContainer = [YYTextContainer containerWithSize:CGSizeMake(MAXFLOAT,  PCMessageWalletDetailFontSize * 1.2)];
    titleContainer.maximumNumberOfRows = 1;
    _titleLayout = [YYTextLayout layoutWithContainer:titleContainer text:titleStr];
    
    NSMutableAttributedString *contentStr = [[NSMutableAttributedString alloc] initWithString:content];
    contentStr.font = [UIFont systemFontOfSize:PCMessageWalletDetailFontSize];
    contentStr.color = [UIColor blackColor];
    YYTextContainer *contentContainer = [YYTextContainer containerWithSize:CGSizeMake(PCMessageWalletDetailCotentWidth,  PCMessageWalletDetailFontSize * 1.2 * 2)];
    contentContainer.maximumNumberOfRows = 2;
    _contentLayout = [YYTextLayout layoutWithContainer:contentContainer text:contentStr];
    
    _titleRect = CGRectMake(0, 0, PCMessageWalletDetailTitleWidth, _titleLayout.textBoundingSize.height);
    _contentRect = CGRectMake(CGRectGetMaxX(_titleRect), 0, _contentLayout.textBoundingSize.width, _contentLayout.textBoundingSize.height);
    
    _viewWidth = PCMessageWalletTitleWidth;
    _viewHeight = _contentRect.size.height;
}

@end

@implementation PCMessageWalletAssistantLayout

- (instancetype)initWithMessageModel:(PCMessageModel *)messageModel;
{
    self = [super init];
    if (self) {
        [self reset];
        [self layout:messageModel];
    }
    
    return self;
}

- (void)reset
{
    _viewWidth = 0;
    _viewHeight = 0;
    _titleRect = CGRectZero;
    _dateRect = CGRectZero;
    _amountRect = CGRectZero;
    _productViewRect = CGRectZero;
    _orderIdViewRect = CGRectZero;
    _transactionTimeRect = CGRectZero;
    _payMethodRect = CGRectZero;
    _payTargetRect = CGRectZero;
    _lineRect = CGRectZero;
    _clickViewDetailRect = CGRectZero;
    _arrowRect = CGRectZero;
}

- (void)layout:(PCMessageModel *)messageModel
{
    NSString *titleStr = nil;
    if (messageModel.walletType == PCWalletTypeCharge) {
        titleStr = @"账户充值凭证";
    } else if (messageModel.walletType == PCWalletTypeCash) {
        titleStr = @"提现凭证";
    } else if (messageModel.walletType == PCWalletTypePay) {
        titleStr = @"交易凭证";
    }else if (messageModel.walletType == PCWalletTypeCoinCharge){
        titleStr = @"订阅账户充值凭证";
    }else if (messageModel.walletType == PCWalletTypeCoinPay){
        titleStr = @"支付凭证";
    }

    NSMutableAttributedString *titleAttriStr = [[NSMutableAttributedString alloc] initWithString:titleStr];
    titleAttriStr.font = [UIFont systemFontOfSize:PCMessageWalletTitleFontSize];
    titleAttriStr.color = MainContentColor;
    YYTextContainer *titleContainer = [YYTextContainer containerWithSize:CGSizeMake(PCMessageWalletTitleWidth,  PCMessageWalletTitleFontSize * 1.2)];
    titleContainer.maximumNumberOfRows = 1;
    _titleTextLayout = [YYTextLayout layoutWithContainer:titleContainer text:titleAttriStr];
    
    _titleRect = CGRectMake(PCMessageWalletLeftPadding, PCMessageWalletTopPadding, _titleTextLayout.textBoundingSize.width, _titleTextLayout.textBoundingSize.height);
    
    NSDate *createdDate = [NSDate dateWithTimeIntervalInMilliSecondSince1970:messageModel.transActionTime];
    NSDateFormatter *dateFormatter = [NSDateFormatter dateFormatterWithFormat:@"MM月dd日"];
    NSString *dateStr = [[dateFormatter stringFromDate:createdDate] copy];
    
    NSMutableAttributedString *dateAttriStr = [[NSMutableAttributedString alloc] initWithString:dateStr];
    dateAttriStr.font = [UIFont systemFontOfSize:PCMessageWalletDateFontSize];
    dateAttriStr.color = AssistContentColor;
    YYTextContainer *dateContainer = [YYTextContainer containerWithSize:CGSizeMake(PCMessageWalletDateWidth,  PCMessageWalletDateFontSize * 1.2)];
    dateContainer.maximumNumberOfRows = 1;
    _dateTextLayout = [YYTextLayout layoutWithContainer:dateContainer text:dateAttriStr];
    
    _dateRect = CGRectMake(PCMessageWalletLeftPadding, CGRectGetMaxY(_titleRect) + PCMessageWalletTitleDatePadding, _dateTextLayout.textBoundingSize.width, _dateTextLayout.textBoundingSize.height);
    
    NSMutableAttributedString *amountStr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"¥%.2f", messageModel.amount]];
    amountStr.font = [UIFont systemFontOfSize:PCMessageWalletAmountFontSize];
    amountStr.color = [UIColor blackColor];
    YYTextContainer *amounContainer = [YYTextContainer containerWithSize:CGSizeMake(PCMessageWalletAmountWidth,  PCMessageWalletAmountFontSize * 1.2)];
    amounContainer.maximumNumberOfRows = 1;
    _amountTextLayout = [YYTextLayout layoutWithContainer:amounContainer text:amountStr];

    _amountRect = CGRectMake((PCMessageWalletContentWidth - _amountTextLayout.textBoundingSize.width) / 2, CGRectGetMaxY(_dateRect) + PCMessageWalletDateAmountPaddding, _amountTextLayout.textBoundingSize.width, _amountTextLayout.textBoundingSize.height);
    
    PCWalletType walletType = messageModel.walletType;

    NSDate *transActionDate = [NSDate dateWithTimeIntervalInMilliSecondSince1970:messageModel.transActionTime];
    NSDateFormatter *transActionDateFormatter = [NSDateFormatter dateFormatterWithFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *transActionStr = [[transActionDateFormatter stringFromDate:transActionDate] copy];
    _transactionTimeLayout = [[PCMessageWalletDetailLayout alloc] initWithTitle:@"交易时间：" content:transActionStr];
    
    _orderIdViewLayout = [[PCMessageWalletDetailLayout alloc] initWithTitle:@"交易单号：" content:messageModel.orderId];

    if (walletType == PCWalletTypePay || walletType == PCWalletTypeCoinPay) {
        //商品详情,交易单号,交易时间,交易方式,交易对象
        _productViewLayout = [[PCMessageWalletDetailLayout alloc] initWithTitle:@"商品详情：" content:messageModel.productName];
        _payMethodLayout = [[PCMessageWalletDetailLayout alloc] initWithTitle:@"交易方式：" content:messageModel.payMethod];
        _payTargetLayout = [[PCMessageWalletDetailLayout alloc] initWithTitle:@"交易对象：" content:messageModel.payTarget];
        
        _productViewRect = CGRectMake(PCMessageWalletLeftPadding, CGRectGetMaxY(_amountRect) + PCMessageWalletAmountDetailPaddding, _productViewLayout.viewWidth, _productViewLayout.viewHeight);
        _orderIdViewRect = CGRectMake(PCMessageWalletLeftPadding, CGRectGetMaxY(_productViewRect) +PCMessageWalletDetailInnerPadding, _orderIdViewLayout.viewWidth, _orderIdViewLayout.viewHeight);
        _transactionTimeRect = CGRectMake(PCMessageWalletLeftPadding, CGRectGetMaxY(_orderIdViewRect) +PCMessageWalletDetailInnerPadding, _transactionTimeLayout.viewWidth, _transactionTimeLayout.viewHeight);
        _payMethodRect = CGRectMake(PCMessageWalletLeftPadding, CGRectGetMaxY(_transactionTimeRect) +PCMessageWalletDetailInnerPadding, _payMethodLayout.viewWidth, _payMethodLayout.viewHeight);
        _payTargetRect = CGRectMake(PCMessageWalletLeftPadding, CGRectGetMaxY(_payMethodRect) +PCMessageWalletDetailInnerPadding, _payTargetLayout.viewWidth, _payTargetLayout.viewHeight);
        _lineRect = CGRectMake(PCMessageWalletLeftPadding, CGRectGetMaxY(_payTargetRect) + PCMessageWalletDetailLinePadding, PCMessageWalletLineWidth, PCMessageCardLineHeight);
    } else {
        //交易时间,交易单号
        _transactionTimeRect = CGRectMake(PCMessageWalletLeftPadding, CGRectGetMaxY(_amountRect) + PCMessageWalletAmountDetailPaddding, _transactionTimeLayout.viewWidth, _transactionTimeLayout.viewHeight);
        _orderIdViewRect = CGRectMake(PCMessageWalletLeftPadding, CGRectGetMaxY(_transactionTimeRect) +PCMessageWalletDetailInnerPadding, _orderIdViewLayout.viewWidth, _orderIdViewLayout.viewHeight);
        _lineRect = CGRectMake(PCMessageWalletLeftPadding, CGRectGetMaxY(_orderIdViewRect) + PCMessageWalletDetailLinePadding, PCMessageWalletLineWidth, PCMessageCardLineHeight);
    }
    
    NSMutableAttributedString *clickViewDetailStr = [[NSMutableAttributedString alloc] initWithString:@"点击查看详情"];
    clickViewDetailStr.font = [UIFont systemFontOfSize:PCMessageWalletClickDetailFontSize];
    clickViewDetailStr.color = AssistContentColor;
    YYTextContainer *clickDetailContainer = [YYTextContainer containerWithSize:CGSizeMake(MAXFLOAT,  PCMessageWalletClickDetailFontSize * 1.2)];
    clickDetailContainer.maximumNumberOfRows = 1;
    _clickViewDetailTextLayout = [YYTextLayout layoutWithContainer:clickDetailContainer text:clickViewDetailStr];
    
    _clickViewDetailRect = CGRectMake(PCMessageWalletLeftPadding, CGRectGetMaxY(_lineRect) + PCMessageWalletLineClickDetailPadding, _clickViewDetailTextLayout.textBoundingSize.width, _clickViewDetailTextLayout.textBoundingSize.height);

    _arrowRect = CGRectMake(PCMessageWalletContentWidth - PCMessageWalletLeftPadding - PCMessageWalletArrowWidth, _clickViewDetailRect.origin.y, PCMessageWalletArrowWidth, PCMessageWalletArrowWidth);
    
    _viewHeight = CGRectGetMaxY(_clickViewDetailRect) + PCMessageWalletBottomPadding;
    _viewWidth = PCMessageWalletContentWidth;
}

#pragma mark PCMessageLayoutProtol
- (CGFloat)contentWidth
{
    return _viewWidth;
}

- (CGFloat)contentHeight
{
    return _viewHeight;
}
@end
