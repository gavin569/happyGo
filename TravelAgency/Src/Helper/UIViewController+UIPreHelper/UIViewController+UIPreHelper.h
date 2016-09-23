//
//  UIViewController+UIPreHelper.h
//  BR_SE
//
//  Created by edianzu on 16/7/21.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (UIPreHelper)
//自定义导航栏左按钮
- (void)customNavigationBarLeftItemWithTitle:(NSString *)title action:(SEL)action;
- (void)customNavigationBarLeftItemWithImage:(UIImage *)image action:(SEL)action;
//自定义导航栏右按钮
- (void)customNavigationBarRightItemWithTitle:(NSString *)title action:(SEL)action;
- (void)customNavigationBarRightItemWithImage:(UIImage *)image action:(SEL)action;
//自定义导航栏返回按钮
- (void)customnavigationBarBackItemWithImage:(UIImage *)image;
@end
