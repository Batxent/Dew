//
//  UIImage+DEWColor.m
//  Dew
//
//  Created by Shawn on 2017/1/26.
//  Copyright © 2017年 Dawa Co., Ltd. All rights reserved.
//

#import "UIImage+DEWColor.h"

@implementation UIImage (DEWColor)

+ (UIImage *)dew_imageWithColor:(UIColor *)color size:(CGSize)size
{
    return [self _imageWithColor:color size:size contentInset:UIEdgeInsetsZero];
}

+ (UIImage *)dew_imageWithColor:(UIColor *)color size:(CGSize)size contentInset:(UIEdgeInsets)edgeInsets
{
    return [self _imageWithColor:color size:size contentInset:edgeInsets];
}

#pragma mark - Privite
+ (UIImage *)_imageWithColor:(UIColor *)color size:(CGSize)size contentInset:(UIEdgeInsets)edgeInsets
{
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, CGRectMake(edgeInsets.left, edgeInsets.top, size.width - edgeInsets.left - edgeInsets.right, size.height));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
