//
//  UIImage+DEWCompress.h
//  Dew
//
//  Created by Shawn on 2017/2/9.
//  Copyright © 2017年 Dawa Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (DEWCompress)

/**
 将UIImage进行压缩
 @param memorySize 需要将图片压缩到200K以下，则填1024 * 200
 */
- (instancetype)dew_compressToMemorySize:(NSUInteger)memorySize;

/**
 将UIImage转成NSData,同时进行压缩
 */
- (NSData *)dew_dataByCompressToMemorySize:(NSUInteger)memorySize;


@end
