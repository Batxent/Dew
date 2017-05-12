//
//  UIScrollView+DEWTouch.m
//  Dew
//
//  Created by Shawn on 2017/2/8.
//  Copyright © 2017年 Dawa Co., Ltd. All rights reserved.
//

#import "UIScrollView+DEWTouch.h"
#import <objc/runtime.h>


static const char *dew_canResponseTouchEventKey = "canResponseTouchEventKey";

@implementation UIScrollView (DEWTouch)

- (void)setDew_canResponseTouchEvent:(BOOL)dew_canResponseTouchEvent
{
    objc_setAssociatedObject(self, dew_canResponseTouchEventKey, @(dew_canResponseTouchEvent), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)dew_canResponseTouchEvent
{
    return  [objc_getAssociatedObject(self, dew_canResponseTouchEventKey) boolValue];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (self.dew_canResponseTouchEvent) {
        [[self nextResponder] touchesBegan:touches withEvent:event];
    }
    [super touchesBegan:touches withEvent:event];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (self.dew_canResponseTouchEvent) {
        [[self nextResponder] touchesMoved:touches withEvent:event];
    }
    [super touchesMoved:touches withEvent:event];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (self.dew_canResponseTouchEvent) {
        [[self nextResponder] touchesEnded:touches withEvent:event];
    }
    [super touchesEnded:touches withEvent:event];
}



@end
