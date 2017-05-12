//
//  DEWCGUtilities.h
//  Dew
//
//  Created by Shawn on 2017/2/9.
//  Copyright © 2017年 Dawa Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

CGFloat DEWScreenScale();

//用于适配.[UIScreen mainScreen].bounds.size.height / 667.0
CGFloat DEWHeightScale();

static inline CGFloat
CGFloatToPixel(CGFloat value) {
    return value * DEWScreenScale();
}

///将像素转为点，使用于生产1像素的点
static inline CGFloat
CGFloatFromPixel(CGFloat value) {
    return value / DEWScreenScale();
}

//返回字体的高度
static inline CGFloat
CGlineHeight(UIFont *font) {
    return font.lineHeight;
}

//static inline BOOL
//DEWIsReleaseVersion() {
//    return [[[NSBundle mainBundle]bundleIdentifier] isEqualToString:@"Dawa.Gets"];
//}
