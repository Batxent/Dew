//
//  NSArray+DEWSafe.m
//  Dew
//
//  Created by Shawn on 2017/2/9.
//  Copyright © 2017年 Dawa Co., Ltd. All rights reserved.
//

#import "NSArray+DEWSafe.h"

@implementation NSArray (DEWSafe)

- (id)dew_safeObjectAtIndex:(NSUInteger)index
{
    if ([self count] > 0 && [self count] > index) {
        return [self objectAtIndex:index];
    } else {
        return nil;
    }
}

- (BOOL)dew_hasValue
{
    return  (self && self.count > 0);
}

@end
