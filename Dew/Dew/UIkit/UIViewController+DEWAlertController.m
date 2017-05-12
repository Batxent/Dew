//
//  UIViewController+DEWAlertController.m
//  Dew
//
//  Created by Shawn on 2017/3/23.
//  Copyright © 2017年 Dawa Co., Ltd. All rights reserved.
//

#import "UIViewController+DEWAlertController.h"

@implementation UIViewController (DEWAlertController)

- (void)dew_showAlertWithTitle:(NSString *)title
                   message:(NSString *)message
              actionTitles:(NSArray <NSString *> *)actions
           cancelItemTitle:(NSString *)cancelTitle
                alertStyle:(UIAlertControllerStyle)style
              actionHandle:(void (^)(NSString *))handles
{

    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:style];

    [actions enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:obj style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            handles(obj);
        }];

        [alertController addAction:action];
    }];

    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"cancelTitle" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [alertController dismissViewControllerAnimated:YES completion:nil];
    }];

    [alertController addAction:cancelAction];

    [self presentViewController:alertController animated:YES completion:nil];

}

@end
