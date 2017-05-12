//
//  UIBarButtonItem+Badge.m
//  therichest
//
//  Created by Mike on 2014-05-05.
//  Copyright (c) 2014 Valnet Inc. All rights reserved.
//
#import <objc/runtime.h>
#import "UIBarButtonItem+DEWBadge.h"

NSString const *UIBarButtonItem_badgeKey = @"UIBarButtonItem_badgeKey";

NSString const *UIBarButtonItem_dew_badgeBGColorKey = @"UIBarButtonItem_dew_badgeBGColorKey";
NSString const *UIBarButtonItem_dew_badgeTextColorKey = @"UIBarButtonItem_dew_badgeTextColorKey";
NSString const *UIBarButtonItem_dew_badgeFontKey = @"UIBarButtonItem_dew_badgeFontKey";
NSString const *UIBarButtonItem_dew_badgePaddingKey = @"UIBarButtonItem_dew_badgePaddingKey";
NSString const *UIBarButtonItem_dew_badgeMinSizeKey = @"UIBarButtonItem_dew_badgeMinSizeKey";
NSString const *UIBarButtonItem_dew_badgeOriginXKey = @"UIBarButtonItem_dew_badgeOriginXKey";
NSString const *UIBarButtonItem_dew_badgeOriginYKey = @"UIBarButtonItem_dew_badgeOriginYKey";
NSString const *UIBarButtonItem_dew_shouldHideBadgeAtZeroKey = @"UIBarButtonItem_dew_shouldHideBadgeAtZeroKey";
NSString const *UIBarButtonItem_dew_shouldAnimateBadgeKey = @"UIBarButtonItem_dew_shouldAnimateBadgeKey";
NSString const *UIBarButtonItem_dew_badgeValueKey = @"UIBarButtonItem_dew_badgeValueKey";

@implementation UIBarButtonItem (DEWBadge)

@dynamic dew_badgeValue, dew_badgeBGColor, dew_badgeTextColor, dew_badgeFont;
@dynamic dew_badgePadding, dew_badgeMinSize, dew_badgeOriginX, dew_badgeOriginY;
@dynamic dew_shouldHideBadgeAtZero, dew_shouldAnimateBadge;

- (void)badgeInit
{
    UIView *superview = nil;
    CGFloat defaultOriginX = 0;
    if (self.customView) {
        superview = self.customView;
        defaultOriginX = superview.frame.size.width - self.dew_badge.frame.size.width/2;
        // Avoids badge to be clipped when animating its scale
        superview.clipsToBounds = NO;
    } else if ([self respondsToSelector:@selector(view)] && [(id)self view]) {
        superview = [(id)self view];
        defaultOriginX = superview.frame.size.width - self.dew_badge.frame.size.width;
    }
    [superview addSubview:self.dew_badge];
    
    // Default design initialization
    self.dew_badgeBGColor   = [UIColor redColor];
    self.dew_badgeTextColor = [UIColor whiteColor];
    self.dew_badgeFont      = [UIFont systemFontOfSize:12.0];
    self.dew_badgePadding   = 6;
    self.dew_badgeMinSize   = 8;
    self.dew_badgeOriginX   = defaultOriginX;
    self.dew_badgeOriginY   = -4;
    self.dew_shouldHideBadgeAtZero = YES;
    self.dew_shouldAnimateBadge = YES;
}

#pragma mark - Utility methods

// Handle badge display when its properties have been changed (color, font, ...)
- (void)refreshBadge
{
    // Change new attributes
    self.dew_badge.textColor        = self.dew_badgeTextColor;
    self.dew_badge.backgroundColor  = self.dew_badgeBGColor;
    self.dew_badge.font             = self.dew_badgeFont;
    
    if (!self.dew_badgeValue || [self.dew_badgeValue isEqualToString:@""] || ([self.dew_badgeValue isEqualToString:@"0"] && self.dew_shouldHideBadgeAtZero)) {
        self.dew_badge.hidden = YES;
    } else {
        self.dew_badge.hidden = NO;
        [self updatedew_badgeValueAnimated:YES];
    }

}

- (CGSize) badgeExpectedSize
{
    // When the value changes the badge could need to get bigger
    // Calculate expected size to fit new value
    // Use an intermediate label to get expected size thanks to sizeToFit
    // We don't call sizeToFit on the true label to avoid bad display
    UILabel *frameLabel = [self duplicateLabel:self.dew_badge];
    [frameLabel sizeToFit];
    
    CGSize expectedLabelSize = frameLabel.frame.size;
    return expectedLabelSize;
}

- (void)updateBadgeFrame
{

    CGSize expectedLabelSize = [self badgeExpectedSize];
    
    // Make sure that for small value, the badge will be big enough
    CGFloat minHeight = expectedLabelSize.height;
    
    // Using a const we make sure the badge respect the minimum size
    minHeight = (minHeight < self.dew_badgeMinSize) ? self.dew_badgeMinSize : expectedLabelSize.height;
    CGFloat minWidth = expectedLabelSize.width;
    CGFloat padding = self.dew_badgePadding;
    
    // Using const we make sure the badge doesn't get too smal
    minWidth = (minWidth < minHeight) ? minHeight : expectedLabelSize.width;
    self.dew_badge.layer.masksToBounds = YES;
    self.dew_badge.frame = CGRectMake(self.dew_badgeOriginX, self.dew_badgeOriginY, minWidth + padding, minHeight + padding);
    self.dew_badge.layer.cornerRadius = (minHeight + padding) / 2;
}

// Handle the badge changing value
- (void)updatedew_badgeValueAnimated:(BOOL)animated
{
    // Bounce animation on badge if value changed and if animation authorized
    if (animated && self.dew_shouldAnimateBadge && ![self.dew_badge.text isEqualToString:self.dew_badgeValue]) {
        CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        [animation setFromValue:[NSNumber numberWithFloat:1.5]];
        [animation setToValue:[NSNumber numberWithFloat:1]];
        [animation setDuration:0.2];
        [animation setTimingFunction:[CAMediaTimingFunction functionWithControlPoints:.4f :1.3f :1.f :1.f]];
        [self.dew_badge.layer addAnimation:animation forKey:@"bounceAnimation"];
    }
    
    // Set the new value
    self.dew_badge.text = @"";
    
    // Animate the size modification if needed
    if (animated && self.dew_shouldAnimateBadge) {
        [UIView animateWithDuration:0.2 animations:^{
            [self updateBadgeFrame];
        }];
    } else {
        [self updateBadgeFrame];
    }
}

- (UILabel *)duplicateLabel:(UILabel *)labelToCopy
{
    UILabel *duplicateLabel = [[UILabel alloc] initWithFrame:labelToCopy.frame];
    duplicateLabel.text = labelToCopy.text;
    duplicateLabel.font = labelToCopy.font;
    
    return duplicateLabel;
}

- (void)removeBadge
{
    // Animate badge removal
    [UIView animateWithDuration:0.2 animations:^{
        self.dew_badge.transform = CGAffineTransformMakeScale(0, 0);
    } completion:^(BOOL finished) {
        [self.dew_badge removeFromSuperview];
        self.dew_badge = nil;
    }];
}

#pragma mark - getters/setters
-(UILabel *)dew_badge {
    UILabel* lbl = objc_getAssociatedObject(self, &UIBarButtonItem_badgeKey);
    if(lbl==nil) {
        lbl = [[UILabel alloc] initWithFrame:CGRectMake(self.dew_badgeOriginX, self.dew_badgeOriginY, 20, 20)];
        [self setDew_badge:lbl];
        [self badgeInit];
        [self.customView addSubview:lbl];
        lbl.textAlignment = NSTextAlignmentCenter;
    }
    return lbl;
}

- (void)setDew_badge:(UILabel *)dew_badge
{
    objc_setAssociatedObject(self, &UIBarButtonItem_badgeKey, dew_badge, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

// Badge value to be display
-(NSString *)dew_badgeValue {
    return objc_getAssociatedObject(self, &UIBarButtonItem_dew_badgeValueKey);
}
-(void) setDew_badgeValue:(NSString *)dew_badgeValue
{
    objc_setAssociatedObject(self, &UIBarButtonItem_dew_badgeValueKey, dew_badgeValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    // When changing the badge value check if we need to remove the badge
    [self updatedew_badgeValueAnimated:YES];
    [self refreshBadge];
}

// Badge background color
-(UIColor *)dew_badgeBGColor {
    return objc_getAssociatedObject(self, &UIBarButtonItem_dew_badgeBGColorKey);
}
-(void)setDew_badgeBGColor:(UIColor *)dew_badgeBGColor
{
    objc_setAssociatedObject(self, &UIBarButtonItem_dew_badgeBGColorKey, dew_badgeBGColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.dew_badge) {
        [self refreshBadge];
    }
}

// Badge text color
-(UIColor *)dew_badgeTextColor {
    return objc_getAssociatedObject(self, &UIBarButtonItem_dew_badgeTextColorKey);
}
-(void)setDew_badgeTextColor:(UIColor *)dew_badgeTextColor
{
    objc_setAssociatedObject(self, &UIBarButtonItem_dew_badgeTextColorKey, dew_badgeTextColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.dew_badge) {
        [self refreshBadge];
    }
}

// Badge font
-(UIFont *)dew_badgeFont {
    return objc_getAssociatedObject(self, &UIBarButtonItem_dew_badgeFontKey);
}
-(void)setDew_badgeFont:(UIFont *)dew_badgeFont
{
    objc_setAssociatedObject(self, &UIBarButtonItem_dew_badgeFontKey, dew_badgeFont, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.dew_badge) {
        [self refreshBadge];
    }
}

// Padding value for the badge
-(CGFloat) dew_badgePadding {
    NSNumber *number = objc_getAssociatedObject(self, &UIBarButtonItem_dew_badgePaddingKey);
    return number.floatValue;
}
-(void) setDew_badgePadding:(CGFloat)dew_badgePadding
{
    NSNumber *number = [NSNumber numberWithDouble:dew_badgePadding];
    objc_setAssociatedObject(self, &UIBarButtonItem_dew_badgePaddingKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.dew_badge) {
        [self updateBadgeFrame];
    }
}

// Minimum size badge to small
-(CGFloat) dew_badgeMinSize {
    NSNumber *number = objc_getAssociatedObject(self, &UIBarButtonItem_dew_badgeMinSizeKey);
    return number.floatValue;
}
-(void) setDew_badgeMinSize:(CGFloat)dew_badgeMinSize
{
    NSNumber *number = [NSNumber numberWithDouble:dew_badgeMinSize];
    objc_setAssociatedObject(self, &UIBarButtonItem_dew_badgeMinSizeKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.dew_badge) {
        [self updateBadgeFrame];
    }
}

// Values for offseting the badge over the BarButtonItem you picked
-(CGFloat) dew_badgeOriginX {
    NSNumber *number = objc_getAssociatedObject(self, &UIBarButtonItem_dew_badgeOriginXKey);
    return number.floatValue;
}
-(void) setDew_badgeOriginX:(CGFloat)dew_badgeOriginX
{
    NSNumber *number = [NSNumber numberWithDouble:dew_badgeOriginX];
    objc_setAssociatedObject(self, &UIBarButtonItem_dew_badgeOriginXKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.dew_badge) {
        [self updateBadgeFrame];
    }
}

-(CGFloat) dew_badgeOriginY {
    NSNumber *number = objc_getAssociatedObject(self, &UIBarButtonItem_dew_badgeOriginYKey);
    return number.floatValue;
}
-(void) setDew_badgeOriginY:(CGFloat)dew_badgeOriginY
{
    NSNumber *number = [NSNumber numberWithDouble:dew_badgeOriginY];
    objc_setAssociatedObject(self, &UIBarButtonItem_dew_badgeOriginYKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.dew_badge) {
        [self updateBadgeFrame];
    }
}

// In case of numbers, remove the badge when reaching zero
-(BOOL) dew_shouldHideBadgeAtZero {
    NSNumber *number = objc_getAssociatedObject(self, &UIBarButtonItem_dew_shouldHideBadgeAtZeroKey);
    return number.boolValue;
}
- (void)setDew_shouldHideBadgeAtZero:(BOOL)dew_shouldHideBadgeAtZero
{
    NSNumber *number = [NSNumber numberWithBool:dew_shouldHideBadgeAtZero];
    objc_setAssociatedObject(self, &UIBarButtonItem_dew_shouldHideBadgeAtZeroKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if(self.dew_badge) {
        [self refreshBadge];
    }
}

// Badge has a bounce animation when value changes
-(BOOL) dew_shouldAnimateBadge {
    NSNumber *number = objc_getAssociatedObject(self, &UIBarButtonItem_dew_shouldAnimateBadgeKey);
    return number.boolValue;
}
- (void)setDew_shouldAnimateBadge:(BOOL)dew_shouldAnimateBadge
{
    NSNumber *number = [NSNumber numberWithBool:dew_shouldAnimateBadge];
    objc_setAssociatedObject(self, &UIBarButtonItem_dew_shouldAnimateBadgeKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if(self.dew_badge) {
        [self refreshBadge];
    }
}


@end
