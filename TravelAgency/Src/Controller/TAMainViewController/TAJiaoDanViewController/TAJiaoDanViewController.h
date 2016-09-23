//
//  TAJiaoDanViewController.h
//  TravelAgency
//
//  Created by edianzu on 16/9/9.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TASelectButton.h"
#import "TABasePickerView.h"
@interface TAJiaoDanViewController : UIViewController
@property (nonatomic, strong) UIScrollView *topScroView;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) UIView *topView;
@property (nonatomic, strong) TASelectButton *selectButton;
@property (nonatomic, strong) UIButton *quaryButton;
@property (nonatomic, strong) TABasePickerView *pickView;
@property (nonatomic, strong) NSArray *lineArray;
@property (nonatomic, strong) UIButton *leftButton;
@property (nonatomic, strong) UIButton *rightButton;
@property (nonatomic, strong) NSArray *titleArr;
@end
