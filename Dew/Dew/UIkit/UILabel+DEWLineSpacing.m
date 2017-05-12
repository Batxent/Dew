//
//  UILabel+DEWLineSpacing.m
//  Dew
//
//  Created by Shawn on 2017/2/9.
//  Copyright © 2017年 Dawa Co., Ltd. All rights reserved.
//

#import "UILabel+DEWLineSpacing.h"

@implementation UILabel (DEWLineSpacing)

- (void)dew_setText:(NSString *)text lineSpacing:(CGFloat)lineSpacing
{
    [self _setText:text lineSpacing:lineSpacing firstLineHeadIndent:0 headIndent:0 tailIndent:0 parapramSpacing:0];
}

- (void)dew_setText:(NSString *)text lineSpacing:(CGFloat)lineSpacing firstLineHeadIndent:(CGFloat)firstLineHeadIndent headIndent:(CGFloat)headIndent tailIndent:(CGFloat)tailIndent parapramSpacing:(CGFloat)parapramSpacing
{
    [self _setText:text lineSpacing:lineSpacing firstLineHeadIndent:firstLineHeadIndent headIndent:headIndent tailIndent:tailIndent parapramSpacing:parapramSpacing];
}

- (void)_setText:(NSString *)text lineSpacing:(CGFloat)lineSpacing firstLineHeadIndent:(CGFloat)firstLineHeadIndent headIndent:(CGFloat)headIndent tailIndent:(CGFloat)tailIndent parapramSpacing:(CGFloat)parapramSpacing
{

    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    [attributedString addAttribute:NSFontAttributeName value:self.font range:NSMakeRange(0, [text length])];

    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];

    if (lineSpacing && lineSpacing >= 0.01) {
        [paragraphStyle setLineSpacing:lineSpacing];
    }

    if (headIndent) {
        paragraphStyle.headIndent = headIndent;
    }

    if (tailIndent) {
        paragraphStyle.tailIndent = tailIndent;
    }

    if (firstLineHeadIndent) {
        paragraphStyle.firstLineHeadIndent = firstLineHeadIndent;
    }

    if (parapramSpacing) {
        paragraphStyle.paragraphSpacing = parapramSpacing;
    }

    [paragraphStyle setLineBreakMode:self.lineBreakMode];
    [paragraphStyle setAlignment:self.textAlignment];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [text length])];

    self.attributedText = attributedString;

}



@end
