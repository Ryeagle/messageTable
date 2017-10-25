//
//  PCMessagePhotoView.m
//  messageTable
//
//  Created by Ryeagler on 2017/3/1.
//  Copyright © 2017年 Ryeagle. All rights reserved.
//

#import "PCMessagePhotoView.h"
#import "SDWebImageManager.h"

@implementation PCMessagePhotoView

- (instancetype)init
{
    self = [super init];
    if (self) {
        _photoBubbleView = [PCMessagePhotoBubble new];
        _photoBubbleView.backgroundColor = AppBgColor;
        
        
        [self.bubbleView addSubview:_photoBubbleView];

    }
    
    return self;
}

- (void)setLayout:(PCMessageLayout *)layout
{
    [super setLayout:layout];
    PCMessagePhotoViewLayout *photoViewLayout = (PCMessagePhotoViewLayout *)layout.contentLayout;
    
    self.photoBubbleView.frame = CGRectMake(photoViewLayout.photoBubbleLeft, photoViewLayout.photoBubbleTop, layout.contentViewWidth, layout.contentViewHeight);
    self.photoBubbleView.type = photoViewLayout.photoBubbleType;
    
    NSString *urlStr = layout.messageModel.content;
    
    NSURL *imageURL;
    if ([urlStr containsString:@"http"] || [urlStr containsString:@"data:image/png;base64"]) {
        imageURL = [NSURL URLWithString:urlStr];
    } else {
        imageURL = [NSURL fileURLWithPath:urlStr];
    }

    UIImage *image;
    __weak typeof(self) weakSelf = self;
    if ([[SDWebImageManager sharedManager] cachedImageExistsForURL:imageURL]) {
        image = [[SDWebImageManager sharedManager].imageCache imageFromMemoryCacheForKey:[[SDWebImageManager sharedManager] cacheKeyForURL:imageURL]];
        if (!image) {
            image = [[SDWebImageManager sharedManager].imageCache imageFromDiskCacheForKey:[[SDWebImageManager sharedManager] cacheKeyForURL:imageURL]];
        }
        
        if (image) {
            [self updateBubbleImageView:image];
        }
    }
    
    if (!image) {
        if ([urlStr containsString:@"http"]) {
            [self updateBubbleImageView:nil];
            [[SDWebImageManager sharedManager] downloadImageWithURL:[NSURL URLWithString:[urlStr stringByAppendingFormat:@"%@",[PCSetImageSizeManager componentStrWithImageWidth:self.bounds.size.width  height:self.bounds.size.height]]] options:0 progress:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
                [[SDWebImageManager sharedManager] saveImageToCache:image forURL:imageURL];
                [[SDWebImageManager sharedManager] saveImageToCache:image forURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@_thumb", urlStr]]];
                [weakSelf updateBubbleImageView:image];
            }];
        }
        else if ([urlStr containsString:@"data:image/png;base64"]) {
            [self updateBubbleImageView:nil];
            [[SDWebImageManager sharedManager] downloadImageWithURL:[NSURL URLWithString:urlStr] options:0 progress:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
                [[SDWebImageManager sharedManager] saveImageToCache:image forURL:imageURL];
                [weakSelf updateBubbleImageView:image];
            }];
        }
        else{
            [self updateBubbleImageView:[UIImage imageWithContentsOfFile:urlStr]];
        }
    }
}

- (void)updateBubbleImageView:(UIImage *)image
{
    if (self.photoBubbleView && self.photoBubbleView.photoImage != image) {
        self.photoBubbleView.photoImage = image;
        [self.photoBubbleView setNeedsDisplay];
    }
}


#pragma mark Gesture Action
- (void)bubbleTapAction:(UITapGestureRecognizer *)gesture
{
    self.bubbleView.highlighted = YES;
    
    __weak typeof(self) weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        weakSelf.bubbleView.highlighted = NO;
    });
    
    NSLog(@"Photo Message Tap...");
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(receiveViewEvent:layout:object:)]) {
        [self.delegate receiveViewEvent:PCPhotoMessageTapEvent layout:self.layout object:nil];
    }
}
@end
