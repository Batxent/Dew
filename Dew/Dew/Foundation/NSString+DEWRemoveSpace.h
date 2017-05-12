//
//  NSString+DEWRemoveSpace.h
//  Dew
//
//  Created by Shawn on 2017/1/22.
//  Copyright © 2017年 Dawa Co., Ltd. All rights reserved.
//
//  @Abstract 字符串去除前后空格

#import <Foundation/Foundation.h>

@interface NSString (DEWRemoveSpace)

/**
 去除前后空格
 @return 返回一个新的字符串，原来字符串并不会变
 */
- (NSString *)dew_removeSpace;

@end
