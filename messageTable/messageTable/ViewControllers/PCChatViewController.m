//
//  PCChatViewController.m
//  messageTable
//
//  Created by Ryeagler on 2017/2/23.
//  Copyright © 2017年 Ryeagle. All rights reserved.
//

#import "PCChatViewController.h"

@interface PCChatViewController ()
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *chatArray;

@end

@implementation PCChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setup];
    
    [self getData];
}

- (void)setup
{
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)getData
{
    NSData *jsonData = [NSData dataNamed:[NSString stringWithFormat:@"JsonFile.json"]];
    NSError* error;
    NSDictionary* dict = [NSJSONSerialization JSONObjectWithData:jsonData
                                                         options:kNilOptions
                                                           error:&error];
    
    NSArray *messageArray = [dict arrayForKey:@"result" withDefault:@[]];
    for (int i = 0; i < messageArray.count; i++) {
        NSDictionary *dict = [messageArray objectAtIndex:i];
        
        if (dict && [dict isKindOfClass:[NSDictionary class]]) {
            PCMessageModel *messageModel = [[PCMessageModel alloc]initWithDict:dict];
            NSLog(@"messageModel name:%@ content:%@", messageModel.fullname, messageModel.content);
        }
    }
    
}

@end
