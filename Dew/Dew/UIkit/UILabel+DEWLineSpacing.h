//
//  UILabel+DEWLineSpacing.h
//  Dew
//
//  Created by Shawn on 2017/2/9.
//  Copyright © 2017年 Dawa Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (DEWLineSpacing)

- (void)dew_setText:(NSString *)text lineSpacing:(CGFloat)lineSpacing;

- (void)dew_setText:(NSString *)text
        lineSpacing:(CGFloat)lineSpacing
firstLineHeadIndent:(CGFloat)firstLineHeadIndent
         headIndent:(CGFloat)headIndent
         tailIndent:(CGFloat)tailIndent
    parapramSpacing:(CGFloat)parapramSpacing;



@end
