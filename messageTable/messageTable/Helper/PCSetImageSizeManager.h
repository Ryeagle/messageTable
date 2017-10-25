//
//  PCSetImageSizeManager.h
//  phoncol
//
//  Created by YangDan on 16/3/29.
//  Copyright © 2016年 t8. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kThumbnails 100    

#define kMedium 200


@interface PCSetImageSizeManager : NSObject


+ (NSString *)componentStrWithImageWidth:(CGFloat)width height:(CGFloat)height;



+ (NSURL *)photoShowDoubleSizeImageWithUrlStr:(NSString *)urlStr withImageSize:(CGSize)imageSize;

/**
 *  展示小的缩略图， 头像，小图片
 *
 *  @param urlStr 图片url
 *
 *  @return nsurl
 */
+ (NSURL *)photoShowForThumbnailsWithUrlStr:(NSString *)urlStr;

@end
