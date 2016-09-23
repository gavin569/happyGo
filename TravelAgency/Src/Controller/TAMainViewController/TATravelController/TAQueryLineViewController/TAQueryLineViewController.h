//
//  TAQueryLineViewController.h
//  TravelAgency
//
//  Created by edianzu on 16/9/19.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TABaseViewController.h"

@interface TAQueryLineViewController : TABaseViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *dateLab;
- (IBAction)dateButtonClick:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *firstLab;
@property (weak, nonatomic) IBOutlet UILabel *secondLab;
@property (weak, nonatomic) IBOutlet UILabel *MPLab;
@property (weak, nonatomic) IBOutlet UILabel *totalPeopleLab;
@property (weak, nonatomic) IBOutlet UIButton *throwButton;
@property (weak, nonatomic) IBOutlet UITableView *orderTableView;
@property (weak, nonatomic) IBOutlet UITableView *arrangeCarTableView;
@property (weak, nonatomic) IBOutlet UITableView *arrangeTouristTableView;
@property (weak, nonatomic) IBOutlet UIButton *touristSystemButton;
@property (weak, nonatomic) IBOutlet UIButton *driverButtonSystem;
@property (nonatomic, strong) UIView *maskView;
@property (nonatomic, strong) UIDatePicker *datePickView;


@end
