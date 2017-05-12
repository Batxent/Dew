//
//  NSArray+DEWSafe.h
//  Dew
//
//  Created by Shawn on 2017/2/9.
//  Copyright © 2017年 Dawa Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (DEWSafe)

/**
 如果数组为空或者outOfRange,返回nil
 */
- (id _Nullable)dew_safeObjectAtIndex:(NSUInteger)index;

- (BOOL)dew_hasValue;

@end
