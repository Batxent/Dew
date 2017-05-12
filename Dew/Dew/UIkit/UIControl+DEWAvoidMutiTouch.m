//
//  UIControl+DEWAvoidMutiTouch.m
//  Dew
//
//  Created by Shawn on 2017/1/22.
//  Copyright © 2017年 Dawa Co., Ltd. All rights reserved.
//

#import "UIControl+DEWAvoidMutiTouch.h"
#import <objc/runtime.h>

static const char *dew_avoidIntervalKey = "avoidIntervalKey";
static const char *dew_actionEnableKey = "actionEnableKey";

@interface UIControl ()

@property (nonatomic, assign, readwrite) BOOL dew_actionEnable;

@end


@implementation UIControl (DEWAvoidMutiTouch)

- (NSTimeInterval)dew_avoidInterval
{
    id associatedObject = objc_getAssociatedObject(self,dew_avoidIntervalKey);
    if (associatedObject == nil) {
        self.dew_avoidInterval = 0;//经测试，该0值仍为NSTimeInterval类型
        return 0;
    }
    return  [associatedObject doubleValue];
}

- (void)setDew_avoidInterval:(NSTimeInterval)fs_avoidInterval
{
    NSTimeInterval interval = fs_avoidInterval >= 0 ? fs_avoidInterval: 0;
    objc_setAssociatedObject(self, dew_avoidIntervalKey, @(interval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)dew_actionEnable
{
    id associatedObject = objc_getAssociatedObject(self,dew_actionEnableKey);
    if (associatedObject == nil) {
        self.dew_actionEnable = YES;
        return YES;
    }else {
        return [associatedObject boolValue];
    }
}

- (void)setDew_actionEnable:(BOOL)dew_actionEnable
{
    objc_setAssociatedObject(self, dew_actionEnableKey, @(dew_actionEnable), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (void)load
{
    Method a = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    Method b = class_getInstanceMethod(self, @selector(_sendAction:to:forEvent:));
    method_exchangeImplementations(a, b);
}

- (void)_sendAction:(SEL)selector to:(id)target forEvent:(UIEvent *)event
{
    if (self.dew_actionEnable == NO) return;

    self.dew_actionEnable = NO;

    [self _sendAction:selector to:target forEvent:event];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.dew_avoidInterval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.dew_actionEnable = YES;
    });
}


@end
