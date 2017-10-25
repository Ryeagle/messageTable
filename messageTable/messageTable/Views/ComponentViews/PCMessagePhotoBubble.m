//
//  PCMessagePhotoBubble.m
//  messageTable
//
//  Created by Ryeagler on 2017/3/1.
//  Copyright © 2017年 Ryeagle. All rights reserved.
//

#import "PCMessagePhotoBubble.h"

@implementation PCMessagePhotoBubble

- (void)drawRect:(CGRect)rect
{
    CGFloat radius = 5;
    CGFloat marginX = 6;
    CGFloat marginY = 1;
    CGFloat cornerCenterY = 16;
    CGFloat cornerHeight = 10;
    CGFloat width = rect.size.width;
    CGFloat height = rect.size.height;
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    //顺时针划线，上部开始
    [path moveToPoint:CGPointMake(marginX + radius, marginY)];
    [path addLineToPoint:CGPointMake(width - marginX - radius, marginY)];
    [path addArcWithCenter:CGPointMake(width - marginX - radius, marginY + radius) radius:radius startAngle:-M_PI_2 endAngle:0 clockwise:YES];
    
    //右边
    if (self.type == PCMessagePhotoBubbleTypeSender) {
        //右边尖角
        [path addLineToPoint:CGPointMake(width - marginX, cornerCenterY - cornerHeight/2)];
        [path addLineToPoint:CGPointMake(width, cornerCenterY)];
        [path addLineToPoint:CGPointMake(width - marginX, cornerCenterY + cornerHeight/2)];
    }else{
        [path addLineToPoint:CGPointMake(width - marginX, height - marginY - radius)];
    }
    [path addArcWithCenter:CGPointMake(width - marginX - radius, height - marginY - radius) radius:radius startAngle:0 endAngle:M_PI_2 clockwise:YES];
    
    //下边
    [path addLineToPoint:CGPointMake(marginX + radius, height - marginY)];
    [path addArcWithCenter:CGPointMake(marginX + radius, height - marginY - radius) radius:radius startAngle:M_PI_2 endAngle:M_PI clockwise:YES];
    
    //左边
    if (self.type == PCMessagePhotoBubbleTypeReceiver) {
        //左边尖角
        [path addLineToPoint:CGPointMake(marginX, cornerCenterY + cornerHeight/2)];
        [path addLineToPoint:CGPointMake(0, cornerCenterY)];
        [path addLineToPoint:CGPointMake(marginX, cornerCenterY - cornerHeight/2)];
    }else{
        [path addLineToPoint:CGPointMake(marginX, marginY + radius)];
    }
    [path addArcWithCenter:CGPointMake(marginX + radius, marginY + radius) radius:radius startAngle:M_PI endAngle:3*M_PI_2 clockwise:YES];
    [path closePath];
    
    [[UIColor colorWithRed:207/255.0 green:207/255.0 blue:207/255.0 alpha:1] setStroke];
    [path setLineWidth:1];
    [path stroke];
    
    [path addClip];
    
    if (_photoImage) {
        CGFloat rectScale = rect.size.width/rect.size.height;
        CGFloat imageScale = _photoImage.size.width/_photoImage.size.height;
        if (fabs(rectScale - imageScale) < 0.05f) {
            [_photoImage drawInRect:rect];
        } else {
            UIImage *newImg;
            if (rectScale > imageScale) {
                CGImageRef newImgRef = CGImageCreateWithImageInRect(_photoImage.CGImage, CGRectMake(0, (_photoImage.size.height-_photoImage.size.width/rect.size.width*rect.size.height)/2, _photoImage.size.width, _photoImage.size.width/rect.size.width*rect.size.height));
                newImg = [UIImage imageWithCGImage:newImgRef];
                CGImageRelease(newImgRef);
            } else {
                CGImageRef newImgRef = CGImageCreateWithImageInRect(_photoImage.CGImage, CGRectMake((_photoImage.size.width - _photoImage.size.height/rect.size.height*rect.size.width)/2, 0, _photoImage.size.height/rect.size.height*rect.size.width, _photoImage.size.height));
                newImg = [UIImage imageWithCGImage:newImgRef];
                CGImageRelease(newImgRef);
            }
            
            if (newImg) {
                [newImg drawInRect:rect];
            }
        }
    }
}


@end
