//
//  NSMutableArray+DEWDuplicateAdd.h
//  Dew
//
//  Created by Shawn on 2017/2/9.
//  Copyright © 2017年 Dawa Co., Ltd. All rights reserved.
//
//  @Abstract 避免重复添加元素,作用与 DEWArrayDuplicateWarpper.h 相同

#import <Foundation/Foundation.h>

@interface NSMutableArray (DEWDuplicateAdd)

- (void)dew_addObjectsFromArray:(NSArray *)array duplicateRule:(BOOL(^)(id objectA, id objectB))rule;

@end
