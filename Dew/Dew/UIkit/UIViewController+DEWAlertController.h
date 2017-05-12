//
//  UIViewController+DEWAlertController.h
//  Dew
//
//  Created by Shawn on 2017/3/23.
//  Copyright © 2017年 Dawa Co., Ltd. All rights reserved.
//
//  @Abstract alertController

#import <UIKit/UIKit.h>

@interface UIViewController (DEWAlertController)

- (void)dew_showAlertWithTitle:(NSString *)title
                   message:(NSString *)message
              actionTitles:(NSArray <NSString *> *)actions
           cancelItemTitle:(NSString *)cancelTitle
                alertStyle:(UIAlertControllerStyle)style
              actionHandle:(void (^) (NSString *actionTitle))handles;

@end
