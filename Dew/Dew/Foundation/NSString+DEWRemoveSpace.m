//
//  NSString+DEWRemoveSpace.m
//  Dew
//
//  Created by Shawn on 2017/1/22.
//  Copyright © 2017年 Dawa Co., Ltd. All rights reserved.
//

#import "NSString+DEWRemoveSpace.h"

@implementation NSString (DEWRemoveSpace)

- (NSString *)dew_removeSpace
{
  return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

@end
