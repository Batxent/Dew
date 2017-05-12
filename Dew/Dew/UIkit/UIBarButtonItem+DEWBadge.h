
//  @Abstract 给barButtonItem 添加红点


#import <UIKit/UIKit.h>

@interface UIBarButtonItem (DEWBadge)

@property (strong, atomic) UILabel *dew_badge;

@property (nonatomic) NSString *dew_badgeValue;
@property (nonatomic) UIColor *dew_badgeBGColor;
@property (nonatomic) UIColor *dew_badgeTextColor;
@property (nonatomic) UIFont *dew_badgeFont;
@property (nonatomic) CGFloat dew_badgePadding;
@property (nonatomic) CGFloat dew_badgeMinSize;
@property (nonatomic) CGFloat dew_badgeOriginX;
@property (nonatomic) CGFloat dew_badgeOriginY;
@property BOOL dew_shouldHideBadgeAtZero;
@property BOOL dew_shouldAnimateBadge;

@end
