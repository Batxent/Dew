//
//  UIImage+DEWColor.h
//  Dew
//
//  Created by Shawn on 2017/1/26.
//  Copyright © 2017年 Dawa Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (DEWColor)

/**
 由颜色生成图片
 */
+ (UIImage *)dew_imageWithColor:(UIColor *)color size:(CGSize)size;

/**
 由颜色生成图片，edgeInsets可以控制颜色的位置，而不是全图单色
 */
+ (UIImage *)dew_imageWithColor:(UIColor *)color size:(CGSize)size contentInset:(UIEdgeInsets)edgeInsets;

@end
