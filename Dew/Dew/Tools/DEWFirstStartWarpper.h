//
//  DEWFirstStartWarpper.h
//  Dew
//
//  Created by Shawn on 2017/2/9.
//  Copyright © 2017年 Dawa Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  Get App name
 */
#define APP_NAME [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]

/**
 *  Get App build
 */
#define APP_BUILD [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]

/**
 *  Get App version
 */
#define APP_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

@interface DEWFirstStartWarpper : NSObject

+ (void)dew_onFirstStart:(void (^ _Nullable)(BOOL isFirstStart))block;
+ (void)dew_onFirstStartForCurrentVersion:(void (^ _Nullable)(BOOL isFirstStartForCurrentVersion))block;
+ (void)dew_onFirstStartForVersion:(NSString * _Nonnull)version
                         block:(void (^ _Nullable)(BOOL isFirstStartForCurrentVersion))block;


+ (BOOL)dew_isFirstStart;
+ (BOOL)dew_isFirstStartForCurrentVersion;
+ (BOOL)dew_isFirstStartForVersion:(NSString * _Nonnull)version;


@end
