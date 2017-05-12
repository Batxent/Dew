//
//  UIImage+DEWCompress.m
//  Dew
//
//  Created by Shawn on 2017/2/9.
//  Copyright © 2017年 Dawa Co., Ltd. All rights reserved.
//

#import "UIImage+DEWCompress.h"

@implementation UIImage (DEWCompress)

- (instancetype)dew_compressToMemorySize:(NSUInteger)memorySize
{
    NSData *data = UIImageJPEGRepresentation(self, 0.5);
    if(data.length > memorySize) {
        UIImage *newImage =  nil;
        for (int i = 0; i < 3; i++) {
            newImage =  [UIImage imageWithData:data];
            data = UIImageJPEGRepresentation(newImage, 0.5 - i * 0.2);
            if(data.length <= memorySize){
                return [[UIImage alloc]initWithData:data];
            }
        }
        newImage = [self _image:newImage zoomWithScale:0.8];
        return [newImage dew_compressToMemorySize:memorySize];
    }else {
        return [[UIImage alloc]initWithData:data];
    }
}

- (NSData *)dew_dataByCompressToMemorySize:(NSUInteger)memorySize
{
    NSData *data = UIImageJPEGRepresentation(self, 0.5);
    if(data.length > memorySize) {
        UIImage *newImage =  nil;
        for (int i = 0; i < 3; i++) {
            newImage =  [UIImage imageWithData:data];
            data = UIImageJPEGRepresentation(newImage, 0.5 - i * 0.2);
            if(data.length <= memorySize) {
                return data;
            }
        }
        newImage = [self _image:newImage zoomWithScale:0.8];
        return [newImage dew_dataByCompressToMemorySize:memorySize];
    }else {
        return data;
    }
}

- (UIImage *)_image:(UIImage *)image zoomWithScale:(CGFloat)scale
{
    UIImage *sourceImage = image;
    UIImage *newImage = nil;

    CGSize targetSize = CGSizeMake(sourceImage.size.width * scale, sourceImage.size.height * scale);

    UIGraphicsBeginImageContext(targetSize);

    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = CGPointZero;
    thumbnailRect.size.width  = targetSize.width;
    thumbnailRect.size.height = targetSize.height;

    [sourceImage drawInRect:thumbnailRect];

    newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return newImage ;
}



@end
