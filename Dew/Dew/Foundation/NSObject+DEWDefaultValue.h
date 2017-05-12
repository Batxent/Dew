//
//  NSObject+DEWDefaultValue.h
//  Dew
//
//  Created by Shawn on 2017/1/22.
//  Copyright © 2017年 Dawa Co., Ltd. All rights reserved.
//
//  @Abstract 设置默认值

#import <Foundation/Foundation.h>

@interface NSObject (DEWDefaultValue)

/**
 为一个Object设置默认值，如果为nil，则将值改为默认值（如果默认值不为nil）
 只有当object和default同时为nil的时候，返回值才有可能为nil
 */
- (id _Nullable)dew_setDefaultValue:(id _Nullable)value;


/**
 not nil or null
 */
- (BOOL)dew_isValid;

@end
