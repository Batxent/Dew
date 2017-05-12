//
//  UILabel+DEWLayout.m
//  Dew
//
//  Created by Shawn on 2017/3/30.
//  Copyright © 2017年 Dawa Co., Ltd. All rights reserved.
//

#import "UILabel+DEWLayout.h"
#import "NSString+DEWLayout.h"

@implementation UILabel (DEWLayout)

- (CGFloat)dew_textWidth
{
    return [self.text dew_widthForFont:self.font];
}


@end
