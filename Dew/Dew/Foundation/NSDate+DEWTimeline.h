//
//  NSDate+DEWTimeline.h
//  Dew
//
//  Created by Shawn on 2017/2/9.
//  Copyright © 2017年 Dawa Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (DEWTimeline)

@property (nonatomic, readonly) NSInteger dew_year;
@property (nonatomic, readonly) NSInteger dew_day;
@property (nonatomic, readonly) BOOL dew_isToday;
@property (nonatomic, readonly) BOOL dew_isYesterday;

- (NSString *)dew_timelineString;

@end
