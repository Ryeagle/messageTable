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
        _photoBubbleView.backgroundColor = [UIColor clearColor];
        [self addSubview:_photoBubbleView];

    }
    
    return self;
}

- (void)setLayout:(PCMessageLayout *)layout
{
    [super setLayout:layout];
    PCMessagePhotoViewLayout *photoViewLayout = (PCMessagePhotoViewLayout *)layout.contentLayout;
    
    self.photoBubbleView.frame = CGRectMake(photoViewLayout.photoBubbleLeft, self.nameView.hidden ? photoViewLayout.photoBubbleTop : photoViewLayout.photoBubbleTop + layout.nameViewLayout.viewHeight, photoViewLayout.photoBubbleWidth, photoViewLayout.photoBubbleHeight);
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

@end
