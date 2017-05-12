//
//  NSDictionary+DEWSafeKey.h
//  Dew
//
//  Created by Shawn on 2017/2/9.
//  Copyright © 2017年 Dawa Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (DEWSafe)

/**
 如果key为nil或者 key不存在，返回nil
 */
- (id _Nullable)dew_safeObjectForKey:(NSString *_Nonnull)key;

@end
