//
//  PCChatViewController.m
//  messageTable
//
//  Created by Ryeagler on 2017/2/23.
//  Copyright © 2017年 Ryeagle. All rights reserved.
//

#import "PCChatViewController.h"
#import "PCMessageCell.h"

@interface PCChatViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *chatLayoutArr;

#ifdef RyeagleForTest
@property (nonatomic, strong) NSTimer *timer;

#endif
@end

@implementation PCChatViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    if ([UIMenuController sharedMenuController].isMenuVisible) {
        [[UIMenuController sharedMenuController] setMenuVisible:NO];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setup];
    [self setupNav];
    [self setupTableView];
    [self getData];
}

#ifdef RyeagleForTest
- (void)setupTimer
{
    __weak typeof(self) weakSelf = self;
    _timer = [NSTimer timerWithTimeInterval:1.f block:^(NSTimer * _Nonnull timer) {
        [weakSelf.tableView reloadData];
    } repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];

}
#endif

- (void)setup
{
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)setupNav
{
    UISwitch *switcher = [UISwitch new];
    switcher.layer.transformScale = 0.8;
    
    __weak typeof(self) weakSelf = self;
    [switcher setOn:[PCUserDefaultHelper sharedInstance].showMemberName];
    [switcher addBlockForControlEvents:UIControlEventValueChanged block:^(UISwitch *sender) {
        [weakSelf setShowName:sender.isOn];
    }];
    
    UIView *view = [UIView new];
    view.size = CGSizeMake(40, 44);
    [view addSubview:switcher];
    switcher.centerX = view.width / 2;
    switcher.centerY = view.height / 2;
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:view];
    self.navigationItem.rightBarButtonItem = item;
}

- (void)setupTableView
{
    _tableView = [[UITableView alloc]init];
    [_tableView setFrame:self.view.bounds];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = AppBgColor;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    
    [_tableView setTableFooterView:[[UIView alloc]initWithFrame:CGRectZero]];
    [_tableView reloadData];
}

- (void)getData
{
    NSString *pathStr = @"";
    if ([self.猴子  isEqualToString:@"猴子的花果山🐒"]) {
        pathStr = @"JsonFile.json";
    } else if ([self.猴子  isEqualToString:@"猴子的水帘洞🐵"]) {
        pathStr = @"JsonFilePhoto.json";
    } else if ([self.猴子  isEqualToString:@"猴子的蟠桃园🍑"]) {
        pathStr = @"JsonFileWallet.json";
    }
    _chatLayoutArr = [NSMutableArray array];
    NSData *jsonData = [NSData dataNamed:pathStr];
    NSError* error;
    NSDictionary* dict = [NSJSONSerialization JSONObjectWithData:jsonData
                                                         options:kNilOptions
                                                           error:&error];
    
    NSArray *messageArray = [dict arrayForKey:@"result" withDefault:@[]];
    for (int i = 0; i < messageArray.count; i++) {
        NSDictionary *dict = [messageArray objectAtIndex:i];
        
        if (dict && [dict isKindOfClass:[NSDictionary class]]) {
            PCMessageModel *messageModel = [[PCMessageModel alloc]initWithDict:dict];
            PCMessageLayout *layout = [[PCMessageLayout alloc] initWithMessageModel:messageModel];
            layout.shouldShowTime = YES;
            if (layout) {
                [_chatLayoutArr addObject:layout];
            }
        }
    }
    
//    @autoreleasepool {
//        for (int i = 0; i < 10; i++) {
//            [_chatLayoutArr addObjectsFromArray:_chatLayoutArr];
//        }
//
//    }
    
    [self.tableView reloadData];
}


#pragma mark Private Method
- (void)setShowName:(BOOL)showName
{
    [PCUserDefaultHelper sharedInstance].showMemberName = showName;
    [self.tableView reloadData];
}

#pragma mark UITableViewDelegate & UITableViewDataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PCMessageLayout *layout = [_chatLayoutArr objectAtIndex:indexPath.row];
    
    return ([PCUserDefaultHelper sharedInstance].showMemberName && (layout.messageModel.message_bubble_type == PCMessageBubbleTypeReceiving && ![PCMessageHelper isNoAvatarView:layout.messageModel])) ? layout.height + PCMessageNameHeight : layout.height;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _chatLayoutArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PCMessageLayout *laytout = _chatLayoutArr[indexPath.row];
    NSString *reuseIdentifier = [PCMessageHelper getReuseIdentifier:laytout.messageModel];
    
    PCMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    
    if (!cell) {
        cell = [[PCMessageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    
    cell.layout = laytout;
    
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if ([UIMenuController sharedMenuController].isMenuVisible) {
        [[UIMenuController sharedMenuController] setMenuVisible:NO];
    }
}

@end
