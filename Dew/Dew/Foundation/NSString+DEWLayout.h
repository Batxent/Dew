//
//  NSString+DEWLayout.h
//  Dew
//
//  Created by Shawn on 2017/1/22.
//  Copyright © 2017年 Dawa Co., Ltd. All rights reserved.
//
//  @Abstract 字符串跟布局相关

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (DEWLayout)

- (CGFloat)dew_heightForFont:(UIFont *)font width:(CGFloat)width;

- (CGFloat)dew_widthForFont:(UIFont *)font;

@end
