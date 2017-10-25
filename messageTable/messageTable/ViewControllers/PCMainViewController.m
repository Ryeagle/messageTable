//
//  PCMainViewController.m
//  messageTable
//
//  Created by Ryeagler on 2017/2/23.
//  Copyright © 2017年 Ryeagle. All rights reserved.
//

#import "PCMainViewController.h"
#import "PCChatViewController.h"

@interface PCMainViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *chatArray;

@end

@implementation PCMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupChatArray];
    [self setupTableView];
}

- (void)setupTableView
{
    _tableView = [[UITableView alloc]init];
    [_tableView setFrame:self.view.bounds];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    [_tableView setTableFooterView:[[UIView alloc]initWithFrame:CGRectZero]];
    [_tableView reloadData];
}

- (void)setupChatArray
{
    _chatArray = @[@"猴子的花果山🐒", @"猴子的水帘洞🐵", @"猴子的蟠桃园🍑"].mutableCopy;
}

#pragma mark UITableViewDelegate & UITableViewDataSource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _chatArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellForChatTable = @"cellForChatTable";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellForChatTable];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellForChatTable];
    }
    
    cell.textLabel.text = _chatArray[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    PCChatViewController *chatViewController = [[PCChatViewController alloc] init];
    
    //汉字变量😀...
    NSString *猴子 = _chatArray[indexPath.row];
    chatViewController.猴子 = 猴子;
    [self.navigationController pushViewController:chatViewController animated:YES];
    
    [_tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
