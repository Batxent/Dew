//
//  UIFont+DEWLayout.h
//  Dew
//
//  Created by Shawn on 2017/2/8.
//  Copyright © 2017年 Dawa Co., Ltd. All rights reserved.
//
//  @Abstract 根据不同的屏幕倍数调节字体大小

#import <UIKit/UIKit.h>


@interface UIFont (DEWLayout)

+ (instancetype)dew_sysytemFontOfSize:(CGFloat)fontSize;

+ (instancetype)dew_boldSystemFontOfSize:(CGFloat)fontSize;

+ (instancetype)dew_fontWithName:(NSString *)fontName size:(CGFloat)fontSize;


@end
