//
//  DEWArrayDuplicateWarpper.h
//  Dew
//
//  Created by Shawn on 2017/2/9.
//  Copyright © 2017年 Dawa Co., Ltd. All rights reserved.
//

#ifndef DEWArrayDuplicateWarpper_h
#define DEWArrayDuplicateWarpper_h

/**
 使用场景如下：数组A需要从数组B从添加元素，且要求整合后的数组不能有重复元素
 最后数组A会被重新赋值，数组B并不会改变

 @param arrayA arrayB 当出现重复元素的时候，数组B的元素被视数组A的更新，会替代数组A的元素，同时从数组B中移除,A添加B中剩余的元素
 @param rule 去重法则，两个元素是否相同取决于该返回，相同返回YES
 */

static inline NSArray *
DEWSpliceArray(NSArray *arrayA, NSArray *arrayB, BOOL(^rule)(id objectA, id objectB)) {

    NSMutableArray *mutableArrayB = [[NSMutableArray alloc]initWithArray:arrayB];
    if ((mutableArrayB && mutableArrayB.count == 0) || !mutableArrayB) {
        return arrayA;
    }

    NSMutableArray *mutableArrayA = [[NSMutableArray alloc]initWithArray:arrayA];
    [arrayB enumerateObjectsUsingBlock:^(id  _Nonnull layoutB, NSUInteger idxB, BOOL * _Nonnull stop) {
        __block id exitObject = nil;
        [arrayA enumerateObjectsUsingBlock:^(id  _Nonnull layoutA, NSUInteger idxA, BOOL * _Nonnull stop) {

            if (rule(layoutA,layoutB)) {
                exitObject = layoutB;
                [mutableArrayA replaceObjectAtIndex:idxA withObject:layoutB];//用新的数据覆盖旧的数据
                *stop = YES;
            }
        }];
        if (exitObject != nil) {//如果按照object来删除可能有误
            [mutableArrayB removeObject:exitObject];
        }
    }];

    [mutableArrayA addObjectsFromArray:mutableArrayB];

    return mutableArrayA.copy;
}



#endif /* DEWArrayDuplicateWarpper_h */
