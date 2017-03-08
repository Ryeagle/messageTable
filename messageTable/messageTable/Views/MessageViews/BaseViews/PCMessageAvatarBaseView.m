//
//  PCMessageAvatarBaseView.m
//  messageTable
//
//  Created by Ryeagler on 2017/2/28.
//  Copyright © 2017年 Ryeagle. All rights reserved.
//

#import "PCMessageAvatarBaseView.h"

@implementation PCMessageAvatarBaseView

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        [self addNotification];

        _timeView = [PCMessageTimeView new];
        _timeView.hidden = YES;
        [self addSubview:_timeView];
        
        _avatarView = [UIImageView new];
        _avatarView.userInteractionEnabled = YES;
        _avatarView.size = CGSizeMake(PCMessageAvatarSize, PCMessageAvatarSize);
        [self addSubview:_avatarView];
        
        _bubbleView = [PCMessageAvatarBubble new];
        [self addSubview:_bubbleView];
        
        _nameView = [PCMessageNameView new];
        _nameView.hidden = YES;
        [self addSubview:_nameView];
        
        [self addGesture];
    }
    
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)setLayout:(PCMessageLayout *)layout
{
    _layout = layout;
    
    [self setTimeLayout:layout];
    [self setAvatarLayout:layout];
    [self setNameLayout:layout];
    [self setBubbleLayout:layout];
    [self setContainerLayout:layout];
}

#pragma mark Private Method
- (void)addGesture
{
    _bubbleTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bubbleTapAction:)];
    [_bubbleView addGestureRecognizer:_bubbleTapGesture];

    UILongPressGestureRecognizer *bubbleLongPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(bubbleLongPressAction:)];
    bubbleLongPressGesture.cancelsTouchesInView = NO;
    [_bubbleView addGestureRecognizer:bubbleLongPressGesture];
    
    UITapGestureRecognizer *avatarTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(avatarTapAction:)];
    [_avatarView addGestureRecognizer:avatarTapGesture];
    
    UILongPressGestureRecognizer *avatarLongPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(avatarLongPressAction:)];
    [_avatarView addGestureRecognizer:avatarLongPressGesture];
}

- (void)addNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(menuDidHidenNotificaiton:)
                                                 name:UIMenuControllerWillHideMenuNotification object:nil];
}

#pragma mark Set SubView's Layouts
- (void)setTimeLayout:(PCMessageLayout *)layout
{
    if (layout.shouldShowTime) {
        _timeView.hidden = NO;
        _timeView.frame = CGRectMake(layout.timeViewLeft, layout.timeViewTop, layout.timeViewLayout.viewWidth, layout.timeViewLayout.viewHeight);
        _timeView.timeLabel.frame = CGRectMake(layout.timeViewLayout.timeLabelLeft, layout.timeViewLayout.timeLabelTop, layout.timeViewLayout.timeLabelWidth, layout.timeViewLayout.timeLabelHeight);
        _timeView.timeLabel.textLayout = layout.timeViewLayout.timeLabelLayout;
    }
}

- (void)setAvatarLayout:(PCMessageLayout *)layout
{
    if (layout.messageModel.message_bubble_type == PCMessageBubbleTypeSending) {
        [_avatarView setImage:[[UIImage imageNamed:@"Chat_sender_avatar"] drawRectWithRoundedCorner:20 size:CGSizeMake(40, 40)]];
    } else {
        [_avatarView setImage:[[UIImage imageNamed:@"Chat_receiver_avatar"] drawRectWithRoundedCorner:20 size:CGSizeMake(40, 40)]];
    }
    
    _avatarView.left = layout.avatarViewLeft;
    _avatarView.top = layout.avatarViewTop;
}

- (void)setBubbleLayout:(PCMessageLayout *)layout
{
    _bubbleView.frame = CGRectMake(layout.contentViewLeft, _nameView.hidden ? layout.contentViewTop : layout.contentViewTop + layout.nameViewLayout.viewHeight, layout.contentViewWidth, layout.contentViewHeight);
    _bubbleView.type = [PCMessageAvatarBubble avatarBubbleType:layout.messageModel];
}

- (void)setNameLayout:(PCMessageLayout *)layout
{
#warning 项目中替换判断方式
    if ([PCUserDefaultHelper sharedInstance].showMemberName) {
        if (layout.messageModel.message_bubble_type == PCMessageBubbleTypeReceiving) {
            
            _nameView.hidden = NO;
            _nameView.frame = CGRectMake(_avatarView.left + _avatarView.width, _avatarView.top, layout.nameViewLayout.viewWidth, layout.nameViewLayout.viewHeight);
            _nameView.identityButton.frame = CGRectMake(layout.nameViewLayout.identityButtonLeft, layout.nameViewLayout.identityButtonTop, layout.nameViewLayout.identityButtonWidth, layout.nameViewLayout.identityButtonHeight);
            _nameView.nameLabel.frame = CGRectMake(layout.nameViewLayout.nameLabelLeft, layout.nameViewLayout.nameLabelTop, layout.nameViewLayout.nameLabelWidth, layout.nameViewLayout.nameLabelHeight);
        

            UIImage *image = nil;
            if ([layout.messageModel.creator isEqualToString:@"56f3a79bb8df540c19a2556d"]) {
                image = [UIImage imageNamed:@"Chat_qunzhu_bg"];
                [_nameView.identityButton setTitle:@"群主" forState:UIControlStateNormal];
                _nameView.identityButton.hidden = NO;
            } else if ([layout.messageModel.creator isEqualToString:@"5767abbecbaf43383bfba097"]) {
                image = [UIImage imageNamed:@"Chat_guanliyuan_bg"];
                [_nameView.identityButton setTitle:@"管理员" forState:UIControlStateNormal];
                _nameView.identityButton.hidden = NO;
            } else {
                _nameView.identityButton.hidden = YES;
            }
            
            CGFloat w = image.size.width * 0.5;
            CGFloat h = image.size.height * 0.5;
            [_nameView.identityButton setBackgroundImage:[image resizableImageWithCapInsets:UIEdgeInsetsMake(h, w, h, w)] forState:UIControlStateNormal];
            
            _nameView.nameLabel.textLayout = layout.nameViewLayout.nameLabelLayout;
        } else {
            _nameView.hidden = YES;
        }
    } else {
        _nameView.hidden = YES;
    }
}

- (void)setContainerLayout:(PCMessageLayout *)layout
{
    if (layout.messageModel.message_bubble_type == PCMessageBubbleTypeSending) {
        self.frame = CGRectMake(0, 0, SCREEN_WIDTH, layout.height);
    } else {
        self.frame = CGRectMake(0, 0, CGRectGetMaxX(_bubbleView.frame), layout.height);
    }
}


#pragma mark Notification Action
- (void)menuDidHidenNotificaiton:(NSNotification *)notification
{
    [self resignFirstResponder];
    _bubbleView.highlighted = NO;
}


#pragma mark Gesture Actions
- (void)bubbleTapAction:(UITapGestureRecognizer *)gesture
{
    //overwrite by subClass
}

- (void)avatarTapAction:(UITapGestureRecognizer *)gesture
{
    NSLog(@"Avatar View Tap....");
    if (self.delegate && [self.delegate respondsToSelector:@selector(receiveViewEvent:layout:object:)]) {
        [self.delegate receiveViewEvent:PCAvatarTapEvent layout:_layout object:nil];
    }
}

- (void)bubbleLongPressAction:(UILongPressGestureRecognizer *)gesture
{
    NSLog(@"Bubble Long Press....");
    [self becomeFirstResponder];
    if (gesture.state == UIGestureRecognizerStateBegan) {
        UIMenuItem *itemStick = [[UIMenuItem alloc] initWithTitle:@"置顶" action:@selector(stickPush)];
        UIMenuItem *itemCopy = [[UIMenuItem alloc] initWithTitle:@"复制" action:@selector(copyContent)];
        UIMenuItem *itemForward = [[UIMenuItem alloc] initWithTitle:@"转发" action:@selector(forward)];
        UIMenuItem *itemFavorite = [[UIMenuItem alloc] initWithTitle:@"收藏" action:@selector(favorite)];
        UIMenuItem *itemRevoke = [[UIMenuItem alloc] initWithTitle:@"撤回" action:@selector(revoke)];
        UIMenuItem *itemDelete = [[UIMenuItem alloc] initWithTitle:@"删除" action:@selector(delete)];
        UIMenuItem *itemMore = [[UIMenuItem alloc] initWithTitle:@"更多..." action:@selector(more)];

        NSMutableArray *itemArr = [NSMutableArray array];
        [itemArr addObjectsFromArray:@[itemStick, itemCopy, itemForward, itemFavorite, itemRevoke, itemDelete, itemMore]];
        UIMenuController * menuController = [UIMenuController sharedMenuController];
        
        [menuController setMenuItems:itemArr.copy];
        CGRect tagetRect = _bubbleView.frame;

        [menuController setTargetRect:tagetRect inView:self];
        [menuController setMenuVisible:YES animated:YES];
        _bubbleView.highlighted = YES;
    } else if (gesture.state == UIGestureRecognizerStateEnded) {
    }
}

- (void)avatarLongPressAction:(UILongPressGestureRecognizer *)gesture
{
    NSLog(@"Avatar Long Press...");
    if (gesture.state == UIGestureRecognizerStateBegan) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(receiveViewEvent:layout:object:)]) {
            [self.delegate receiveViewEvent:PCAvatarLongPressEvent layout:_layout object:nil];
        }
    }
}

#pragma mark MenuController Method
- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (void)copyContent
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(receiveViewEvent:layout:object:)]) {
        [self.delegate receiveViewEvent:PCMenuCopyEvent layout:self.layout object:nil];
    }
}

- (void)forward
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(receiveViewEvent:layout:object:)]) {
        [self.delegate receiveViewEvent:PCMenuForwardEvent layout:self.layout object:nil];
    }
}

- (void)more
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(receiveViewEvent:layout:object:)]) {
        [self.delegate receiveViewEvent:PCMenuMoreEvent layout:self.layout object:nil];
    }
}

- (void)revoke
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(receiveViewEvent:layout:object:)]) {
        [self.delegate receiveViewEvent:PCMenuRevokeEvent layout:self.layout object:nil];
    }
}

- (void)delete
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(receiveViewEvent:layout:object:)]) {
        [self.delegate receiveViewEvent:PCMenuDeleteEvent layout:self.layout object:nil];
    }
}

- (void)favorite
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(receiveViewEvent:layout:object:)]) {
        [self.delegate receiveViewEvent:PCMenuFavoriteEvent layout:self.layout object:nil];
    }
}

- (void)stickPush
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(receiveViewEvent:layout:object:)]) {
        [self.delegate receiveViewEvent:PCMenuStickEvent layout:self.layout object:nil];
    }
}

#pragma mark PCMessageCellProtocol
- (void)setupLayout:(PCMessageLayout *)layout;
{
    [self setLayout:layout];
}

- (void)setDelegate:(id)delegate
{
    _delegate = delegate;
}

@end
