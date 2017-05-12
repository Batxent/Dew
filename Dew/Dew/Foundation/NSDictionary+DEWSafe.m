//
//  NSDictionary+DEWSafeKey.m
//  Dew
//
//  Created by Shawn on 2017/2/9.
//  Copyright © 2017年 Dawa Co., Ltd. All rights reserved.
//

#import "NSDictionary+DEWSafe.h"

@implementation NSDictionary (DEWSafe)

- (id)dew_safeObjectForKey:(NSString *)key
{
    NSArray *keysArray = [self allKeys];
    if ([keysArray containsObject:key]) {
        return [self objectForKey:key];
    } else {
        return nil;
    }
}

@end
