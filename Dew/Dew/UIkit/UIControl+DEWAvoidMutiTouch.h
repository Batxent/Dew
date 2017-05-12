//
//  UIControl+DEWAvoidMutiTouch.h
//  Dew
//
//  Created by Shawn on 2017/1/22.
//  Copyright © 2017年 Dawa Co., Ltd. All rights reserved.
//
//  @Abstract 避免一个按钮短时间内重复点击

#import <UIKit/UIKit.h>

@interface UIControl (DEWAvoidMutiTouch)

/**
 设置按钮间隔多少秒响应
 */
@property (nonatomic, assign) NSTimeInterval dew_avoidInterval;

/**
 当前按钮是否可响应
 */
@property (nonatomic, assign, readonly) BOOL dew_actionEnable;

@end
