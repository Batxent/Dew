//
//  NSMutableArray+DEWDuplicateAdd.m
//  Dew
//
//  Created by Shawn on 2017/2/9.
//  Copyright © 2017年 Dawa Co., Ltd. All rights reserved.
//

#import "NSMutableArray+DEWDuplicateAdd.h"

@implementation NSMutableArray (DEWDuplicateAdd)

- (void)dew_addObjectsFromArray:(NSArray *)array duplicateRule:(BOOL(^)(id objectA, id objectB))rule
{
    NSMutableArray *mutableArrayB = array.mutableCopy;

    if ((mutableArrayB && mutableArrayB.count == 0) || !mutableArrayB) {
        return;
    }

    [array enumerateObjectsUsingBlock:^(id  _Nonnull layoutB, NSUInteger idxB, BOOL * _Nonnull stop) {
        __block id exitObject = nil;
        [self enumerateObjectsUsingBlock:^(id  _Nonnull layoutA, NSUInteger idxA, BOOL * _Nonnull stop) {
            if (rule(layoutA,layoutB)) {
                exitObject = layoutB;
                [self replaceObjectAtIndex:idxA withObject:layoutB];//用新的数据覆盖旧的数据
                *stop = YES;
            }
        }];
        if (exitObject != nil) {
            //如果按照object来删除可能有误
            [mutableArrayB removeObject:exitObject];
        }
    }];
    [self addObjectsFromArray:mutableArrayB];
}

@end
