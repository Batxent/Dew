//
//  AppDelegate.m
//  Dew
//
//  Created by Shawn on 2017/1/22.
//  Copyright © 2017年 Dawa Co., Ltd. All rights reserved.
//

#import "AppDelegate.h"
#import "Dew.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    UIImage *image = [UIImage imageNamed:@"images"];
    NSData *imageData = UIImagePNGRepresentation(image);
    NSLog(@"data length : %lu",(unsigned long)imageData.length);

    NSData *newImageData = [image dew_dataByCompressToMemorySize:20 * 1024];
    NSLog(@"newData length : %lu",newImageData.length);

    return YES;
}




@end
