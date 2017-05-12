//
//  UIView+DEWShadow.m
//  Dew
//
//  Created by Shawn on 2017/2/8.
//  Copyright © 2017年 Dawa Co., Ltd. All rights reserved.
//

#import "UIView+DEWShadow.h"

@implementation UIView (DEWShadow)

- (void)dew_addShadowWithOffSet:(CGSize)offset
                   shadowRadius:(CGFloat)radius
                    shadowColor:(UIColor *)color
                        opacity:(CGFloat)opacity
{
    [self.layer setShadowOffset:offset];
    [self.layer setShadowRadius:radius];
    [self.layer setShadowColor:color.CGColor];
    [self.layer setShadowOpacity:opacity];
}

- (void)dew_removeShadow
{
    [self.layer setShadowRadius:0];
    self.layer.shadowOpacity = 0;
}

@end
