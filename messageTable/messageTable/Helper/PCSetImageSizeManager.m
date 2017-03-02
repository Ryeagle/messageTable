//
//  PCSetImageSizeManager.m
//  phoncol
//
//  Created by YangDan on 16/3/29.
//  Copyright © 2016年 t8. All rights reserved.
//

#import "PCSetImageSizeManager.h"

@implementation PCSetImageSizeManager


+ (NSString *)componentStrWithImageWidth:(CGFloat)width height:(CGFloat)height {
    
    if (width == height) {
        if (width < 70) {
            return [NSString stringWithFormat:@"?imageView2/1/w/%d/h/%d",kThumbnails,kThumbnails];
        }
        else if (width >= 70 && width < 150) {
            return [NSString stringWithFormat:@"?imageView2/1/w/%d/h/%d",kMedium,kMedium];
        }
        else {
            return [NSString stringWithFormat:@"?imageView2/1/w/%.f/h/%.f",width * 2,height * 2];
        }
    }
    else {
        return [NSString stringWithFormat:@"?imageView2/1/w/%.f/h/%.f",width * 2,height * 2];
    }
    
    return nil;
}


+ (NSURL *)photoShowDoubleSizeImageWithUrlStr:(NSString *)urlStr withImageSize:(CGSize)imageSize {
    
    NSString *doubleSize = [NSString stringWithFormat:@"%@?imageView2/1/w/%.f/h/%.f",urlStr,imageSize.width * 2,imageSize.height * 2];
    return [NSURL URLWithString:doubleSize];
    
}

+ (NSURL *)photoShowForThumbnailsWithUrlStr:(NSString *)urlStr {
    
    NSString *thumbStr = [NSString stringWithFormat:@"%@?imageView2/1/w/%d/h/%d",urlStr,kThumbnails,kThumbnails];
    
    return [NSURL URLWithString:thumbStr];
}


@end
