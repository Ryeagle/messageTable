//
//  PCMessageWalletAssistantLayout.h
//  messageTable
//
//  Created by Ryeagler on 2017/3/2.
//  Copyright © 2017年 Ryeagle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PCMessageWalletDetailLayout : NSObject
@property (nonatomic, strong) YYTextLayout *titleLayout;
@property (nonatomic, assign) CGRect titleRect;

@property (nonatomic, strong) YYTextLayout *contentLayout;
@property (nonatomic, assign) CGRect contentRect;

@property (nonatomic, assign) CGFloat viewWidth;
@property (nonatomic, assign) CGFloat viewHeight;

@end

@interface PCMessageWalletAssistantLayout : NSObject<PCMessageLayoutProtol>
@property (nonatomic, assign) CGFloat viewWidth;
@property (nonatomic, assign) CGFloat viewHeight;

@property (nonatomic, strong) YYTextLayout *titleTextLayout;
@property (nonatomic, assign) CGRect titleRect;

@property (nonatomic, strong) YYTextLayout *dateTextLayout;
@property (nonatomic, assign) CGRect dateRect;

@property (nonatomic, strong) YYTextLayout *amountTextLayout;
@property (nonatomic, assign) CGRect amountRect;

@property (nonatomic, strong) PCMessageWalletDetailLayout *productViewLayout;
@property (nonatomic, assign) CGRect productViewRect;

@property (nonatomic, strong) PCMessageWalletDetailLayout *orderIdViewLayout;
@property (nonatomic, assign) CGRect orderIdViewRect;

@property (nonatomic, strong) PCMessageWalletDetailLayout *transactionTimeLayout;
@property (nonatomic, assign) CGRect transactionTimeRect;

@property (nonatomic, strong) PCMessageWalletDetailLayout *payMethodLayout;
@property (nonatomic, assign) CGRect payMethodRect;

@property (nonatomic, strong) PCMessageWalletDetailLayout *payTargetLayout;
@property (nonatomic, assign) CGRect payTargetRect;

@property (nonatomic, assign) CGRect lineRect;

@property (nonatomic, strong) YYTextLayout *clickViewDetailTextLayout;
@property (nonatomic, assign) CGRect clickViewDetailRect;

@property (nonatomic, assign) CGRect arrowRect;

- (instancetype)initWithMessageModel:(PCMessageModel *)messageModel;
@end
