//
//  UIImage+DEWAvoid.m
//  Pods
//
//  Created by Shawn on 2017/2/20.
//
//

#import "UIImage+DEWAvoid.h"
#import "UIImage+DEWColor.h"

@implementation UIImage (DEWAvoid)

- (instancetype)dew_avoid
{
//    CGSize size = self.size;
//    UIGraphicsBeginImageContext(size);
//
//    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
//
//    CGFloat hHeight = size.height / 40.0;
//    CGFloat hMargin = size.height / 40.0;
//
//    CGFloat  hLineY = hMargin;
//    do {
//        UIImage *image = [UIImage dew_imageWithColor:[[UIColor blackColor]colorWithAlphaComponent:0.7] size:CGSizeMake(size.width, hHeight)];
//        [image drawInRect:CGRectMake(0, hLineY, image.size.width, image.size.height)];
//        hLineY += hHeight + hMargin;
//    } while (hLineY < size.height);
//
//    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();

    return self;
}

@end
