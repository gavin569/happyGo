//
//  TASendGroupViewController.h
//  TravelAgency
//
//  Created by edianzu on 16/9/19.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TABaseViewController.h"

@interface TASendGroupViewController : TABaseViewController<UITableViewDelegate,UITableViewDataSource,UIPickerViewDelegate,UIPickerViewDataSource>
@property (nonatomic, strong) UIView *QPView;
@property (nonatomic, strong) UITextField *QPTextField;
@property (nonatomic, strong) UIView *BPView;
@property (nonatomic, strong) UITextField *BPTextField;
@property (nonatomic, strong) UIView *MPView;
@property (nonatomic, strong) UITextField *MPTextField;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UITableView *showTableView;
@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) UIView *firstSectionHeaderView;
@property (nonatomic, strong) UIView *firstSectionFootView;
@property (nonatomic, strong) UIView *secondSectionHeaderView;
@property (nonatomic, strong) UIView *secondSectionFootView;
@property (nonatomic, strong) UIView *footView;
@property (nonatomic, strong) NSMutableArray *fitstSectionArr;
@property (nonatomic, strong) NSMutableArray *secondSectionArr;
@property (nonatomic, strong) UIDatePicker *datePickView;
@property (nonatomic, strong) UIView *maskView;
@property (nonatomic, strong) UIPickerView *pickView;
@property (nonatomic, strong) UIDatePicker *timerPickView;
@property (nonatomic, strong) NSArray *typeArray;
@property (nonatomic, strong) UIPickerView *linePickView;
@property (nonatomic, strong) NSMutableArray *lineArr;
@property (nonatomic, strong) NSMutableArray *dateArr;
@end
