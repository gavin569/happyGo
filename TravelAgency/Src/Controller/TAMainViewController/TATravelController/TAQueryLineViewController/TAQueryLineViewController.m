//
//  TAQueryLineViewController.m
//  TravelAgency
//
//  Created by edianzu on 16/9/19.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TAQueryLineViewController.h"
#import "TAFriendMessageCell.h"
#import "TASystemViewController.h"
#import "TAThrowPeopleViewController.h"
@interface TAQueryLineViewController ()
{
    UIView *_bomView;
    NSString *_dateStr;
}
@end

@implementation TAQueryLineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"路线名称";
    [self setupUI];
}
#pragma mark -- setup UI
- (void)setupUI {
    _throwButton.layer.cornerRadius=4.0f;
    _throwButton.clipsToBounds=YES;
    [_throwButton addTarget:self action:@selector(throwButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    _driverButtonSystem.layer.cornerRadius=5.0f;
    _driverButtonSystem.clipsToBounds=YES;
    _driverButtonSystem.layer.borderWidth=1.0f;
    _driverButtonSystem.layer.borderColor=[UIColor blueColor].CGColor;
    [_driverButtonSystem addTarget:self action:@selector(driverButtonSystemClick) forControlEvents:UIControlEventTouchUpInside];
    
    _touristSystemButton.layer.cornerRadius=5.0f;
    _touristSystemButton.clipsToBounds=YES;
    _touristSystemButton.layer.borderWidth=1.0f;
    _touristSystemButton.layer.borderColor=[UIColor blueColor].CGColor;
    [_touristSystemButton addTarget:self action:@selector(touristSystemButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    _orderTableView.delegate=self;
    _orderTableView.dataSource=self;
    _orderTableView.rowHeight=80;
    
    _arrangeCarTableView.delegate=self;
    _arrangeCarTableView.dataSource=self;
    _arrangeCarTableView.rowHeight=80;
    
    _arrangeTouristTableView.delegate=self;
    _arrangeTouristTableView.dataSource=self;
    _arrangeTouristTableView.rowHeight=80;
    
    NSDate *currentDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY－MM－dd"];
    NSString *dateString = [dateFormatter stringFromDate:currentDate];
    _dateLab.text=dateString;
    
    
}
#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TAFriendMessageCell*cell = [tableView dequeueReusableCellWithIdentifier:@"TAFriendMessageCell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"TAFriendMessageCell" owner:nil options:nil] firstObject];
        cell.addButton.layer.cornerRadius=5;
        cell.addButton.clipsToBounds=YES;
        cell.addButton.layer.borderColor=[UIColor blueColor].CGColor;
        cell.addButton.layer.borderWidth=1.0f;
    }
    return cell;
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
#pragma mark -- UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 0.01;
}

#pragma mark -- Event Response
//选择日前按钮触发的事件
- (IBAction)dateButtonClick:(id)sender {
    [self.view addSubview:self.maskView];
    [_bomView addSubview:self.datePickView];
}
//甩人按钮触发的事件
- (void)throwButtonClick {
    TAThrowPeopleViewController *throwPeopleViewController=[[TAThrowPeopleViewController alloc]init];
    [self.navigationController pushViewController:throwPeopleViewController animated:NO];
}
//导游系统按钮触发的事件
- (void)touristSystemButtonClick {
    TASystemViewController *driverViewController=[[TASystemViewController alloc]init];
    [self.navigationController pushViewController:driverViewController animated:NO];
}
//司机系统按钮触发的事件
- (void)driverButtonSystemClick {
    TASystemViewController *driverViewController=[[TASystemViewController alloc]init];
    [self.navigationController pushViewController:driverViewController animated:NO];
}
//取消按钮
- (void)selectLeftButtonClick {
    [self.datePickView removeFromSuperview];
    [self.maskView removeFromSuperview];
}
//确定按钮触发的事件
- (void)selectrightButtonClick {
    [self.datePickView removeFromSuperview];
    [self.maskView removeFromSuperview];
    if (_dateStr) {
      _dateLab.text=_dateStr;
    }
    
}
//选择日期触发的事件
-(void)dateChange:(UIDatePicker *)pick
{
    NSDate *date = pick.date;
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    _dateStr=[formatter stringFromDate:date];
}
#pragma mark -- GettersAndSetters
- (UIView*)maskView {
    if (!_maskView) {
        _maskView=[[UIView alloc]initWithFrame:self.view.frame];
        _maskView.backgroundColor=[UIColor colorWithWhite:0 alpha:0.7];
        _bomView=[[UIView alloc]init];
        _bomView.backgroundColor=COLOR_ffffff;
        [_maskView addSubview:_bomView];
        [_bomView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_maskView.mas_left);
            make.right.equalTo(_maskView.mas_right);
            make.bottom.equalTo(_maskView.mas_bottom);
            make.height.equalTo(@200);
        }];
        UIButton *leftButton=[UIButton buttonWithType:UIButtonTypeCustom];
        [leftButton addTarget:self action:@selector(selectLeftButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [leftButton setTitleColor:COLOR_333333 forState:UIControlStateNormal];
        [leftButton setTitle:@"取消" forState:UIControlStateNormal];
        leftButton.titleLabel.font=SYS_F(14);
        [_bomView addSubview:leftButton];
        [leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_bomView);
            make.top.equalTo(_bomView.mas_top).with.offset(5);
            make.width.equalTo(@80);
            make.height.equalTo(@30);
        }];
        UIButton *rightButton=[UIButton buttonWithType:UIButtonTypeCustom];
        [rightButton addTarget:self action:@selector(selectrightButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [rightButton setTitleColor:COLOR_333333 forState:UIControlStateNormal];
        [rightButton setTitle:@"确定" forState:UIControlStateNormal];
        rightButton.titleLabel.font=SYS_F(14);
        [_bomView addSubview:rightButton];
        [rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(_bomView);
            make.top.equalTo(_bomView.mas_top).with.offset(5);
            make.width.equalTo(@80);
            make.height.equalTo(@30);
        }];
        UIView *lineView=[[UIView alloc]init];
        lineView.backgroundColor=COLOR_d1d1d1;
        [_bomView addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(rightButton.mas_bottom).with.offset(4);
            make.centerX.equalTo(_bomView);
            make.width.equalTo(@(SCREEN_WIDTH));
            make.height.equalTo(@1);
        }];
        
    }
    return _maskView;
}
- (UIDatePicker*)datePickView {
    if (!_datePickView) {
        _datePickView = [[UIDatePicker alloc] init];
        _datePickView.frame = CGRectMake(0, 40, SCREEN_WIDTH, 160);
        _datePickView.datePickerMode = UIDatePickerModeDate;
        _datePickView.locale = [NSLocale localeWithLocaleIdentifier:@"zh_CN"];
        [_datePickView addTarget:self action:@selector(dateChange:) forControlEvents:UIControlEventValueChanged];
        
    }
    return _datePickView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
