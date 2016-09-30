//
//  TATravelViewController.h
//  TravelAgency
//
//  Created by edianzu on 16/9/9.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WJDatePickerView.h"
#import "TABasePickerView.h"
#import "TALineViewModel.h"
@interface TATravelViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UIScrollView *topScroView;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) UIView *topView;
@property (nonatomic, strong) UITableView *showTableView;
@property (nonatomic, strong) NSMutableArray *firstArr;
@property (nonatomic, strong) NSMutableArray *secondArr;
@property (nonatomic, strong) NSArray *thirdArr;
@property (nonatomic, strong) UIView *leftView;
@property (nonatomic, strong) UIView *rightView;
@property (nonatomic, strong) UIButton *leftButton;
@property (nonatomic, strong) UIButton *rightButton;
@property (nonatomic, strong) NSMutableArray *lineList;
@property (nonatomic, strong) NSMutableArray *teamLineList;
@property (nonatomic, strong) NSArray *selfCenterArr;
@property (nonatomic, strong) UIView *maskView;
@property (nonatomic, strong) WJDatePickerView *datePickViewA;
@property (nonatomic, strong) TABasePickerView *pickView;
@property (nonatomic, strong) TALineViewModel *viewModel;
@property (nonatomic, strong) NSMutableArray *lineIdArr;
@end
