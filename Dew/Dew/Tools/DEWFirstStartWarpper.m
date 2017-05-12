//
//  DEWFirstStartWarpper.m
//  Dew
//
//  Created by Shawn on 2017/2/9.
//  Copyright © 2017年 Dawa Co., Ltd. All rights reserved.
//

#import "DEWFirstStartWarpper.h"

static NSString *BFHasBeenOpened = @"BFHasBeenOpened";
static NSString *BFHasBeenOpenedForCurrentVersion = @"";

@implementation DEWFirstStartWarpper

+ (void)dew_onFirstStart:(void (^ _Nullable)(BOOL isFirstStart))block
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    BOOL hasBeenOpened = [defaults boolForKey:BFHasBeenOpened];
    if (hasBeenOpened != true) {
        [defaults setBool:YES forKey:BFHasBeenOpened];
        [defaults synchronize];
    }

    block(!hasBeenOpened);
}

+ (void)dew_onFirstStartForCurrentVersion:(void (^ _Nullable)(BOOL isFirstStartForCurrentVersion))block
{
    BFHasBeenOpenedForCurrentVersion = [NSString stringWithFormat:@"%@%@", BFHasBeenOpened, APP_VERSION];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    BOOL hasBeenOpenedForCurrentVersion = [defaults boolForKey:BFHasBeenOpenedForCurrentVersion];
    if (hasBeenOpenedForCurrentVersion != true) {
        [defaults setBool:YES forKey:BFHasBeenOpenedForCurrentVersion];
        [defaults synchronize];
    }

    block(!hasBeenOpenedForCurrentVersion);
}

+ (void)dew_onFirstStartForVersion:(NSString * _Nonnull)version block:(void (^ _Nullable)(BOOL isFirstStartForCurrentVersion))block
{
    NSString *BFHasBeenOpenedForVersion = [NSString stringWithFormat:@"%@%@", BFHasBeenOpened, version];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    BOOL hasBeenOpenedForVersion = [defaults boolForKey:BFHasBeenOpenedForCurrentVersion];
    if (hasBeenOpenedForVersion != true) {
        [defaults setBool:YES forKey:BFHasBeenOpenedForVersion];
        [defaults synchronize];
    }

    block(!hasBeenOpenedForVersion);
}

+ (BOOL)dew_isFirstStart
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    BOOL hasBeenOpened = [defaults boolForKey:BFHasBeenOpened];
    if (hasBeenOpened != true) {
        return YES;
    } else {
        return NO;
    }
}

+ (BOOL)dew_isFirstStartForCurrentVersion
{
    BFHasBeenOpenedForCurrentVersion = [NSString stringWithFormat:@"%@%@", BFHasBeenOpened, APP_VERSION];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    BOOL hasBeenOpenedForCurrentVersion = [defaults boolForKey:BFHasBeenOpenedForCurrentVersion];
    if (hasBeenOpenedForCurrentVersion != true) {
        return YES;
    } else {
        return NO;
    }
}

+ (BOOL)dew_isFirstStartForVersion:(NSString * _Nonnull)version
{
    NSString *BFHasBeenOpenedForVersion = [NSString stringWithFormat:@"%@%@", BFHasBeenOpened, version];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    BOOL hasBeenOpenedForVersion = [defaults boolForKey:BFHasBeenOpenedForVersion];
    if (hasBeenOpenedForVersion != true) {
        return YES;
    } else {
        return NO;
    }
}




@end
