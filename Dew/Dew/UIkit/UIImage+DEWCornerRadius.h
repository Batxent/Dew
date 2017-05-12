//
//  UIImage+DEWCornerRadius.h
//  Dew
//
//  Created by Shawn on 2017/2/8.
//  Copyright © 2017年 Dawa Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (DEWCornerRadius)

- (instancetype)dew_imageByCornerRadius:(CGFloat)radius;

- (instancetype)dew_imageByResizeToSize:(CGSize)size;

- (instancetype)dew_imageByResizeToSize:(CGSize)size contentMode:(UIViewContentMode)contentMode;

- (instancetype)dew_imageByBounds:(CGRect)bounds cornerRadius:(CGFloat)radius;

@end
