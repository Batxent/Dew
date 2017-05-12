//
//  UIFont+DEWLayout.m
//  Dew
//
//  Created by Shawn on 2017/2/8.
//  Copyright © 2017年 Dawa Co., Ltd. All rights reserved.
//

#import "UIFont+DEWLayout.h"

@implementation UIFont (DEWLayout)

+ (instancetype)dew_sysytemFontOfSize:(CGFloat)fontSize
{
    return [UIFont systemFontOfSize:_layoutSize(fontSize)];
}

+ (instancetype)dew_boldSystemFontOfSize:(CGFloat)fontSize
{

    return [UIFont boldSystemFontOfSize:_layoutSize(fontSize)];
}

+ (instancetype)dew_fontWithName:(NSString *)fontName size:(CGFloat)fontSize
{

    return [UIFont fontWithName:fontName size:_layoutSize(fontSize)];
}

CGFloat _layoutSize(CGFloat fontSize) {
return (_screenScale() == 2?fontSize: fontSize * _screenScale() / 2.8);//2.8这个系数可以根据不同的设计要求修改
}

CGFloat _screenScale() {
    static CGFloat scale;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        scale = [UIScreen mainScreen].scale;
    });
    return scale;
}




@end
