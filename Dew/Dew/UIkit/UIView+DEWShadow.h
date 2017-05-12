//
//  UIView+DEWShadow.h
//  Dew
//
//  Created by Shawn on 2017/2/8.
//  Copyright © 2017年 Dawa Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (DEWShadow)

- (void)dew_addShadowWithOffSet:(CGSize)offset
                   shadowRadius:(CGFloat)radius
                    shadowColor:(UIColor *)color
                        opacity:(CGFloat)opacity;

- (void)dew_removeShadow;

@end
