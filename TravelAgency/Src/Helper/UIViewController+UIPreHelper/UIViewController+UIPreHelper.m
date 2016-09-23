//
//  UIViewController+UIPreHelper.m
//  BR_SE
//
//  Created by edianzu on 16/7/21.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "UIViewController+UIPreHelper.h"

@implementation UIViewController (UIPreHelper)

- (void)customNavigationBarLeftItemWithTitle:(NSString *)title action:(SEL)action{
    
    UIBarButtonItem *leftBtnItem = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:action];
    [leftBtnItem setTitleTextAttributes: @{NSFontAttributeName:[UIFont systemFontOfSize:17],NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem = leftBtnItem;
}

- (void)customNavigationBarLeftItemWithImage:(UIImage *)image action:(SEL)action{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    //        [btn setBackgroundImage:image forState:UIControlStateNormal];
    [btn setImage:image forState:UIControlStateNormal];
    btn.frame = CGRectMake(0, 0, 10, 50);
    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
}

- (void)customNavigationBarRightItemWithTitle:(NSString *)title action:(SEL)action{
    
    UIBarButtonItem *rightBtnItem = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:action];
    [rightBtnItem setTitleTextAttributes: @{NSFontAttributeName:[UIFont systemFontOfSize:17],NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = rightBtnItem;
    
}

- (void)customNavigationBarRightItemWithImage:(UIImage *)image action:(SEL)action{
    
    UIButton*rightButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setBackgroundImage:image forState:UIControlStateNormal];
    rightButton.frame=CGRectMake(SCREEN_WIDTH-50, 0, 18, 20);
    [rightButton addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    
}

- (void)customnavigationBarBackItemWithImage:(UIImage *)image{
    
    self.navigationController.navigationBar.backIndicatorImage = image;
    self.navigationController.navigationBar.backIndicatorTransitionMaskImage = image;
    
}
@end
