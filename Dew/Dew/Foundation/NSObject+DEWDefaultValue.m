//
//  NSObject+DEWDefaultValue.m
//  Dew
//
//  Created by Shawn on 2017/1/22.
//  Copyright © 2017年 Dawa Co., Ltd. All rights reserved.
//

#import "NSObject+DEWDefaultValue.h"
#import <objc/runtime.h>

@implementation NSObject (DEWDefaultValue)

- (id)dew_setDefaultValue:(id)value
{
    if (!self || [value isKindOfClass:[NSNull class]]) {
        return value;
    }
    return self;
}

- (BOOL)dew_isValid
{
    return !(self == nil || [self isKindOfClass:[NSNull class]]);
}

@end

