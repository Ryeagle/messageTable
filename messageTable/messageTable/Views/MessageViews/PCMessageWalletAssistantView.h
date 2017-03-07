//
//  PCMessageWalletAssistantView.h
//  messageTable
//
//  Created by Ryeagler on 2017/3/6.
//  Copyright © 2017年 Ryeagle. All rights reserved.
//

#import "PCMessageNoAvatarBaseView.h"

typedef NS_ENUM(NSUInteger, PCWalletType) {
    PCWalletTypeCharge = 1,
    PCWalletTypeCash,
    PCWalletTypePay,
    PCWalletTypeCoinPay,
    PCWalletTypeCoinCharge,
};

@interface PCMessageWalletDetailView : UIView
@property (nonatomic, strong) YYLabel *titleLabel;
@property (nonatomic, strong) YYLabel *contentLabel;
@end

@interface PCMessageWalletAssistantView : PCMessageNoAvatarBaseView
@property (nonatomic, strong) YYLabel *titleLabel;
@property (nonatomic, strong) YYLabel *dateLabel;
@property (nonatomic, strong) YYLabel *amountLabel;
@property (nonatomic, strong) PCMessageWalletDetailView *productView; //交易详情
@property (nonatomic, strong) PCMessageWalletDetailView *orderIdView; //交易单号
@property (nonatomic, strong) PCMessageWalletDetailView *transactionTimeView; //交易时间
@property (nonatomic, strong) PCMessageWalletDetailView *payMethodView; //交易方式
@property (nonatomic, strong) PCMessageWalletDetailView *payTargetView; //交易对象
@property (nonatomic, strong) UIImageView *lineView;
@property (nonatomic, strong) YYLabel *clickViewDetailLabel; //点击查看详情
@property (nonatomic, strong) UIImageView *arrowView;

//交易时间,交易单号
//商品详情,交易单号,交易时间,交易方式,交易对象
@end
