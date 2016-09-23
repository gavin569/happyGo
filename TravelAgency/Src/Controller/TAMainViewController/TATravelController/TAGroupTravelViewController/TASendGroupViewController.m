//
//  TASendGroupViewController.m
//  TravelAgency
//
//  Created by edianzu on 16/9/19.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TASendGroupViewController.h"
#import "TAFirstSectionCell.h"
#import "TASecondSectionCell.h"
#import "TATravelSendGroupFirstSectopnModel.h"
#import "TATravelSendGroupSecondSectionModel.h"
#import "TACheckViewController.h"
@interface TASendGroupViewController ()
{
    NSString *_dateStr;
    NSString *_styleStr;
    NSString *_timeStr;
    NSString *_lineStr;
     UIView *_bomView;
    int _firstSectionIndex;
    int _secondSectionIndex;
    BOOL _OneOrTwo;
    NSString *_totalDateStr;
    
}
@end

@implementation TASendGroupViewController
#pragma mark -- view life cycle
- (void)viewWillLayoutSubviews {
   [_QPView mas_makeConstraints:^(MASConstraintMaker *make) {
       make.left.equalTo(self.headerView);
       make.top.equalTo(self.headerView.mas_top).with.offset(0);
       make.height.equalTo(@49);
       make.width.equalTo(@(SCREEN_WIDTH/3));
   }];
    [_BPView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_QPView.mas_right).with.offset(0);
        make.top.equalTo(self.headerView.mas_top).with.offset(0);
        make.height.equalTo(@49);
        make.width.equalTo(@(SCREEN_WIDTH/3));
    }];
    [_MPView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_BPView.mas_right).with.offset(0);
        make.top.equalTo(self.headerView.mas_top).with.offset(0);
        make.height.equalTo(@49);
        make.width.equalTo(@(SCREEN_WIDTH/3));
    }];
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_MPView.mas_bottom);
        make.left.equalTo(self.headerView);
        make.right.equalTo(self.headerView);
        make.height.equalTo(@1);
    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"团队游";
    [self.view addSubview:self.showTableView];
        [self.headerView addSubview:self.QPView];
        [self.headerView addSubview:self.BPView];
        [self.headerView addSubview:self.MPView];
        [self.headerView addSubview:self.lineView];
}
#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==0) {
        return self.fitstSectionArr.count;
    }else{
        return self.secondSectionArr.count;
    }
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        TAFirstSectionCell*cell = [tableView dequeueReusableCellWithIdentifier:@"TAFirstSectionCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"TAFirstSectionCell" owner:nil options:nil] firstObject];
  cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        [cell.selectDateButton addTarget:self action:@selector(selectDateButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        cell.selectDateButton.tag=indexPath.row;
        
        [cell.selectVehicleButton addTarget:self action:@selector(selectVehicleButton:) forControlEvents:UIControlEventTouchUpInside];
        cell.selectVehicleButton.tag=indexPath.row;
        
        [cell.selectTimeButton addTarget:self action:@selector(selectTimeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        cell.selectTimeButton.tag=indexPath.row;
        
        [cell.deleteButton addTarget:self action:@selector(deleteButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        cell.deleteButton.tag=indexPath.row;
        TATravelSendGroupFirstSectopnModel *model=_fitstSectionArr[indexPath.row];
        [cell.selectDateButton setTitle:model.dateStr forState:UIControlStateNormal];
        [cell.selectVehicleButton setTitle:model.typeStr forState:UIControlStateNormal];
        [cell.selectTimeButton setTitle:model.timeStr forState:UIControlStateNormal];
        return cell;
       
    }else{
        TASecondSectionCell*cell = [tableView dequeueReusableCellWithIdentifier:@"TASecondSectionCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"TASecondSectionCell" owner:nil options:nil] firstObject];
             cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        TATravelSendGroupSecondSectionModel *model=self.secondSectionArr[indexPath.row];
        [cell.dateButton addTarget:self action:@selector(secondDateButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        cell.dateButton.tag=indexPath.row;
          [cell.dateButton setTitle:model.dateStr forState:UIControlStateNormal];
        
        [cell.selectLineButton addTarget:self action:@selector(secondSelectLineButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [cell.selectLineButton setTitle:model.lineStr forState:UIControlStateNormal];
        
        cell.selectLineButton.tag=indexPath.row;
        [cell.deleteButton addTarget:self action:@selector(secondDeleteButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        cell.deleteButton.tag=indexPath.row;
        return cell;
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
#pragma mark -- UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 40;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 40;
}
- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section==0) {
        return self.firstSectionHeaderView;
    }
    return self.secondSectionHeaderView;
}
- (UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (section==0) {
        return self.firstSectionFootView;
    }
    return self.secondSectionFootView;
}
#pragma mark --Picker Data Source Methed
- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}
- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (pickerView.tag==10086) {
        return self.lineArr.count;
    }else{
      return self.typeArray.count;
    }
    
}

#pragma mark Picker Delegate Methods
- (NSString *) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (pickerView.tag==10086) {
        return self.lineArr[row];
    }else{
        return self.typeArray[row];
    }
}
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    ((UIView *)[pickerView.subviews objectAtIndex:1]).backgroundColor = [UIColor clearColor];
    ((UIView *)[pickerView.subviews objectAtIndex:2]).backgroundColor = [UIColor clearColor];
    UILabel* pickerLabel = (UILabel*)view;
    if (!pickerLabel){
        pickerLabel =[[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 100, 30)];
        pickerLabel.adjustsFontSizeToFitWidth = YES;
        pickerLabel.textAlignment=NSTextAlignmentCenter;
        [pickerLabel setBackgroundColor:[UIColor clearColor]];
        [pickerLabel setFont:[UIFont boldSystemFontOfSize:17]];
    }
    pickerLabel.text=[self pickerView:pickerView titleForRow:row forComponent:component];
    return pickerLabel;
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (pickerView.tag==10086) {
        _lineStr=_lineArr[row];
    }else{
      _styleStr=_typeArray[row];
    }
    
}
#pragma mark -- Event Response
//第一区
- (void)firstSectionCenterButtonClick {
    
    TATravelSendGroupFirstSectopnModel *model=[[TATravelSendGroupFirstSectopnModel alloc]init];
    NSDate *currentDate = [NSDate date];//获取当前时间，日期
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY－MM－dd"];
    NSString *dateString = [dateFormatter stringFromDate:currentDate];
    NSDateFormatter *timerFormatter = [[NSDateFormatter alloc] init];
    [timerFormatter setDateFormat:@"HH:mm:ss"];
    NSString *timerString = [timerFormatter stringFromDate:currentDate];
    model.dateStr=dateString;
    model.typeStr=@"选择接送方式";
    model.timeStr=timerString;
    [self.fitstSectionArr addObject:model];
    [_showTableView reloadData];
}
- (void)selectDateButtonClick:(UIButton*)button {
    _OneOrTwo=YES;
    [self.view addSubview:self.maskView];
    [_bomView addSubview:self.datePickView];
    _firstSectionIndex=(int)button.tag;
}
- (void)selectVehicleButton:(UIButton*)button {
    _OneOrTwo=YES;
    [self.view addSubview:self.maskView];
    [_bomView addSubview:self.pickView];
    _firstSectionIndex=(int)button.tag;
}
- (void)selectTimeButtonClick:(UIButton*)button {
    _OneOrTwo=YES;
    [self.view addSubview:self.maskView];
    [_bomView addSubview:self.timerPickView];
    _firstSectionIndex=(int)button.tag;
}
- (void)deleteButtonClick:(UIButton*)button {
    [self.fitstSectionArr removeObjectAtIndex:button.tag];
    [_showTableView reloadData];
}
//第二区
- (void)secondSectionCenterButton {
    
    TATravelSendGroupSecondSectionModel *model=[[TATravelSendGroupSecondSectionModel alloc]init];
    NSDate *currentDate = [NSDate date];//获取当前时间，日期
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY－MM－dd"];
    NSString *dateString = [dateFormatter stringFromDate:currentDate];
    model.dateStr=dateString;
    model.lineStr=@"请选择路线";
    [self.secondSectionArr addObject:model];
    [_showTableView reloadData];
}
- (void)secondDateButtonClick:(UIButton*)button {
    _OneOrTwo=NO;
    [self.view addSubview:self.maskView];
    [_bomView addSubview:self.datePickView];
    _secondSectionIndex=(int)button.tag;
}
- (void)secondSelectLineButtonClick:(UIButton*)button {
    _OneOrTwo=NO;
    [self.view addSubview:self.maskView];
    [_bomView addSubview:self.linePickView];
    _secondSectionIndex=(int)button.tag;
}
- (void)secondDeleteButtonClick:(UIButton*)button {
    [self.secondSectionArr removeObjectAtIndex:button.tag];
    [_showTableView reloadData];
}
//时间选择器触发的时间
-(void)dateChange:(UIDatePicker *)pick
{
    NSDate *date = pick.date;
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    _dateStr=[formatter stringFromDate:date];
}
- (void)timerPickView:(UIDatePicker *)pick {
    NSDate *date = pick.date;
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"HH:mm:ss"];
    _timeStr=[formatter stringFromDate:date];
}
//取消按钮
- (void)selectLeftButtonClick {
    [self.linePickView removeFromSuperview];
    [self.timerPickView removeFromSuperview];
    [self.datePickView removeFromSuperview];
    [self.pickView removeFromSuperview];
    [self.maskView removeFromSuperview];
}
//确定按钮
- (void)selectrightButtonClick {
    [self.linePickView removeFromSuperview];
    [self.timerPickView removeFromSuperview];
    [self.datePickView removeFromSuperview];
    [self.pickView removeFromSuperview];
    [self.maskView removeFromSuperview];
    if (_OneOrTwo==YES) {
        TATravelSendGroupFirstSectopnModel *model=self.fitstSectionArr[_firstSectionIndex];
        if (_dateStr) {
           model.dateStr=_dateStr;
        }
        if (_styleStr) {
            model.typeStr=_styleStr;
        }
        if (_timeStr) {
            model.timeStr=_timeStr;
        }
        [self.fitstSectionArr replaceObjectAtIndex:_firstSectionIndex withObject:model];
    }else{
        TATravelSendGroupSecondSectionModel *model=self.secondSectionArr[_secondSectionIndex];
        if (_dateStr) {
            model.dateStr=_dateStr;
        }
        if (_lineStr) {
            model.lineStr=_lineStr;
        }
       
        [self.secondSectionArr replaceObjectAtIndex:_secondSectionIndex withObject:model];
    }
    
    _dateStr=nil;
    _styleStr=nil;
    _timeStr=nil;
    _lineStr=nil;
    [_showTableView reloadData];
}
- (void)checkButtonClick {
    [self.dateArr removeAllObjects];
    for (int i=0; i<_fitstSectionArr.count; i++) {
        TATravelSendGroupFirstSectopnModel *model=_fitstSectionArr[i];
        [self.dateArr addObject:model.dateStr];
    }
    for (int i=0; i<_secondSectionArr.count; i++) {
        TATravelSendGroupSecondSectionModel *model=_secondSectionArr[i];
        [self.dateArr addObject:model.dateStr];
    }
  NSArray*arr=[TACommonTool rankInArrWithArrary:_dateArr];
    if (arr.count==0) {
       _totalDateStr=@"";
    }else if (arr.count==1){
      _totalDateStr=[NSString stringWithFormat:@"%@",arr[0]];
    }else{
      _totalDateStr=[NSString stringWithFormat:@"%@-%@",arr[0],arr[arr.count-1]];
    }
    
    if (_QPTextField.text==nil) {
        _QPTextField.text=@"0";
    }
    if (_BPTextField.text==nil) {
        _BPTextField.text=@"0";
    }
    if (_MPTextField.text==nil) {
        _MPTextField.text=@"0";
    }
    int a=[_QPTextField.text intValue]+[_BPTextField.text intValue]+[_MPTextField.text intValue];
    NSString *messageStr=[NSString stringWithFormat:@"%d 人  半票 %d 人  免票 %d 人  总数 %d 人",[_QPTextField.text intValue],[_BPTextField.text intValue], [_MPTextField.text intValue],a];
    TACheckViewController *checkViewController=[[TACheckViewController alloc]init];
    checkViewController.dateStr=_totalDateStr;
    checkViewController.messageStr=messageStr;
    [self.navigationController pushViewController:checkViewController animated:NO];
}
#pragma mark -- GetttersAndSetters
- (UIView*)QPView {
    if (!_QPView) {
        _QPView=[[UIView alloc]init];
        _QPTextField=[[UITextField alloc]init];
        _QPTextField.textAlignment=NSTextAlignmentCenter;
        _QPTextField.font=SYS_F(12);
        [_QPView addSubview:_QPTextField];
        [_QPTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(_QPView);
            make.width.equalTo(@50);
            make.height.equalTo(@35);
        }];
        UILabel *lab=[[UILabel alloc]init];
        lab.text=@"全票:";
        lab.font=SYS_F(12);
        [_QPView addSubview:lab];
        [lab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(_QPTextField.mas_left).with.offset(-1);
            make.centerY.equalTo(_QPView);
        }];
        UILabel *rightLab=[[UILabel alloc]init];
        rightLab.text=@"人";
        rightLab.font=SYS_F(12);
        [_QPView addSubview:rightLab];
        [rightLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_QPTextField.mas_right).with.offset(2);
            make.centerY.equalTo(_QPView);
        }];
        UIView *lineView=[[UIView alloc]init];
        lineView.backgroundColor=[UIColor blackColor];
        [_QPView addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_QPView);
            make.top.equalTo(_QPTextField.mas_bottom).with.offset(1);
            make.width.equalTo(@50);
            make.height.equalTo(@1);
        }];
    }
    return _QPView;
}
- (UIView*)BPView {
    if (!_BPView) {
        _BPView=[[UIView alloc]init];
        _BPTextField=[[UITextField alloc]init];
        _BPTextField.textAlignment=NSTextAlignmentCenter;
        _BPTextField.font=SYS_F(12);
        [_BPView addSubview:_BPTextField];
        [_BPTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(_BPView);
            make.width.equalTo(@50);
            make.height.equalTo(@35);
        }];
        UILabel *lab=[[UILabel alloc]init];
        lab.text=@"半票:";
        lab.font=SYS_F(12);
        [_BPView addSubview:lab];
        [lab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(_BPTextField.mas_left).with.offset(-1);
            make.centerY.equalTo(_BPView);
        }];
        UILabel *rightLab=[[UILabel alloc]init];
        rightLab.text=@"人";
        rightLab.font=SYS_F(12);
        [_BPView addSubview:rightLab];
        [rightLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_BPTextField.mas_right).with.offset(2);
            make.centerY.equalTo(_BPView);
        }];
        UIView *lineView=[[UIView alloc]init];
        lineView.backgroundColor=[UIColor blackColor];
        [_BPView addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_BPView);
            make.top.equalTo(_BPTextField.mas_bottom).with.offset(1);
            make.width.equalTo(@50);
            make.height.equalTo(@1);
        }];
    }
    return _BPView;
}
- (UIView*)MPView {
    if (!_MPView) {
        _MPView=[[UIView alloc]init];
        _MPTextField=[[UITextField alloc]init];
        _MPTextField.textAlignment=NSTextAlignmentCenter;
        _MPTextField.font=SYS_F(12);
        [_MPView addSubview:_MPTextField];
        [_MPTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(_MPView);
            make.width.equalTo(@50);
            make.height.equalTo(@35);
        }];
        UILabel *lab=[[UILabel alloc]init];
        lab.text=@"免票:";
        lab.font=SYS_F(12);
        [_MPView addSubview:lab];
        [lab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(_MPTextField.mas_left).with.offset(-1);
            make.centerY.equalTo(_MPView);
        }];
        UILabel *rightLab=[[UILabel alloc]init];
        rightLab.text=@"人";
        rightLab.font=SYS_F(12);
        [_MPView addSubview:rightLab];
        [rightLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_MPTextField.mas_right).with.offset(2);
            make.centerY.equalTo(_MPView);
        }];
        UIView *lineView=[[UIView alloc]init];
        lineView.backgroundColor=[UIColor blackColor];
        [_MPView addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_MPView);
            make.top.equalTo(_MPTextField.mas_bottom).with.offset(1);
            make.width.equalTo(@50);
            make.height.equalTo(@1);
        }];
    }
    return _MPView;
}
- (UIView*)lineView {
    if (!_lineView) {
        _lineView=[[UIView alloc]init];
        _lineView.backgroundColor=COLOR_d1d1d1;
    }
    return _lineView;
}
- (UITableView*)showTableView {
    if (!_showTableView) {
        _showTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH,SCREEN_HEIGHT-64) style:UITableViewStyleGrouped];
        _showTableView.backgroundColor = COLOR_ffffff;
        _showTableView.delegate=self;
        _showTableView.dataSource=self;
        _showTableView.rowHeight=50;
        _showTableView.showsHorizontalScrollIndicator=NO;
        _showTableView.tableHeaderView=self.headerView;
        _showTableView.tableFooterView=self.footView;
        _showTableView.showsVerticalScrollIndicator=NO;
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    return _showTableView;
}
- (UIView*)headerView {
    if (!_headerView) {
        _headerView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
    }
    return _headerView;
}
- (UIView*)footView {
    if (!_footView) {
        _footView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
        UIButton *checkButton=[UIButton buttonWithType:UIButtonTypeCustom];
        [checkButton setTitle:@"核算" forState:UIControlStateNormal];
        checkButton.titleLabel.font=SYS_F(15);
        [checkButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        checkButton.layer.cornerRadius=5.0f;
        checkButton.clipsToBounds=YES;
        checkButton.layer.borderColor=[UIColor blueColor].CGColor;
        [checkButton addTarget:self action:@selector(checkButtonClick) forControlEvents:UIControlEventTouchUpInside];
        checkButton.layer.borderWidth=1.0f;
        [_footView addSubview:checkButton];
        [checkButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(_footView);
            make.width.equalTo(@(SCREEN_WIDTH-22));
            make.height.equalTo(@35);
        }];
    }
    return _footView;
}
- (UIView*)firstSectionHeaderView {
    if (!_firstSectionHeaderView) {
        _firstSectionHeaderView=[[UIView alloc]init];
        UIImageView *leftImageView=[[UIImageView alloc]init];
        leftImageView.image=[UIImage imageNamed:@"S_6.png"];
        [_firstSectionHeaderView addSubview:leftImageView];
        [leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_firstSectionHeaderView.mas_left).with.offset(5);
            make.centerY.equalTo(_firstSectionHeaderView);
            make.width.equalTo(@15);
            make.height.equalTo(@15);
        }];
        UILabel *rightLab=[[UILabel alloc]init];
        rightLab.text=@"接送";
        rightLab.font=SYS_F(12);
        [_firstSectionHeaderView addSubview:rightLab];
        [rightLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(leftImageView.mas_right).with.offset(5);
            make.centerY.equalTo(_firstSectionHeaderView);
        }];
        
    }
 
    return _firstSectionHeaderView;
}
- (UIView*)secondSectionHeaderView {
    if (!_secondSectionHeaderView) {
        _secondSectionHeaderView=[[UIView alloc]init];
        UIImageView *leftImageView=[[UIImageView alloc]init];
        leftImageView.image=[UIImage imageNamed:@"S_6.png"];
        [_secondSectionHeaderView addSubview:leftImageView];
        [leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_secondSectionHeaderView.mas_left).with.offset(5);
            make.centerY.equalTo(_secondSectionHeaderView);
            make.width.equalTo(@15);
            make.height.equalTo(@15);
        }];
        UILabel *rightLab=[[UILabel alloc]init];
        rightLab.text=@"路线选择";
        rightLab.font=SYS_F(12);
        [_secondSectionHeaderView addSubview:rightLab];
        [rightLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(leftImageView.mas_right).with.offset(5);
            make.centerY.equalTo(_secondSectionHeaderView);
        }];
    }

    return _secondSectionHeaderView;
}
- (UIView*)firstSectionFootView {
    if (!_firstSectionFootView) {
        _firstSectionFootView=[[UIView alloc]init];
        UIButton *centerButton=[UIButton buttonWithType:UIButtonTypeCustom];
        centerButton.titleLabel.font=SYS_F(14);
        [centerButton setImage:[UIImage imageNamed:@"S_6.png"] forState:UIControlStateNormal];
        [centerButton setTitle:@"添加" forState:UIControlStateNormal];
        centerButton.layer.cornerRadius=5.0f;
        centerButton.clipsToBounds=YES;
        centerButton.layer.borderColor=[UIColor blueColor].CGColor;
        centerButton.layer.borderWidth=1.0f;
        
        [centerButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        centerButton.imageEdgeInsets = UIEdgeInsetsMake(0, -7.5, 0, 0);
        centerButton.titleEdgeInsets = UIEdgeInsetsMake(0, 7.5, 0, 0);
        [_firstSectionFootView addSubview:centerButton];
        [centerButton addTarget:self action:@selector(firstSectionCenterButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [centerButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(_firstSectionFootView);
            make.width.equalTo(@80);
            make.height.equalTo(@30);
        }];
        UIView *lineView=[[UIView alloc]init];
        lineView.backgroundColor=COLOR_d1d1d1;
        [_firstSectionFootView addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_firstSectionFootView);
            make.left.equalTo(_firstSectionFootView);
            make.right.equalTo(_firstSectionFootView);
            make.height.equalTo(@1);
        }];

    }
    return _firstSectionFootView;
}
- (UIView*)secondSectionFootView {
    if (!_secondSectionFootView) {
        _secondSectionFootView=[[UIView alloc]init];
        UIButton *centerButton=[UIButton buttonWithType:UIButtonTypeCustom];
        [centerButton addTarget:self action:@selector(secondSectionCenterButton) forControlEvents:UIControlEventTouchUpInside];
        centerButton.layer.cornerRadius=5.0f;
        centerButton.clipsToBounds=YES;
        centerButton.layer.borderColor=[UIColor blueColor].CGColor;
        centerButton.titleLabel.font=SYS_F(14);
        centerButton.layer.borderWidth=1.0f;
        [centerButton setImage:[UIImage imageNamed:@"S_6.png"] forState:UIControlStateNormal];
        [centerButton setTitle:@"添加" forState:UIControlStateNormal];
        [centerButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        centerButton.imageEdgeInsets = UIEdgeInsetsMake(0, -7.5, 0, 0);
        centerButton.titleEdgeInsets = UIEdgeInsetsMake(0, 7.5, 0, 0);
        [_secondSectionFootView addSubview:centerButton];
        [centerButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(_secondSectionFootView);
            make.width.equalTo(@80);
            make.height.equalTo(@30);
        }];
        UIView *lineView=[[UIView alloc]init];
        lineView.backgroundColor=COLOR_d1d1d1;
        [_secondSectionFootView addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_secondSectionFootView);
            make.left.equalTo(_secondSectionFootView);
            make.right.equalTo(_secondSectionFootView);
            make.height.equalTo(@1);
        }];
        
    }
    return _secondSectionFootView;
}
- (NSMutableArray*)fitstSectionArr {
    if (!_fitstSectionArr) {
        _fitstSectionArr=[[NSMutableArray alloc]init];
    }
    return _fitstSectionArr;
}
- (NSMutableArray*)secondSectionArr {
    if (!_secondSectionArr) {
        _secondSectionArr=[[NSMutableArray alloc]init];
    }
    return _secondSectionArr;
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
- (UIPickerView*)pickView {
    if (!_pickView) {
        _pickView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 40, SCREEN_WIDTH, 160)];
        _pickView.delegate=self;
        _pickView.dataSource=self;
        [_pickView selectRow:3 inComponent:0 animated:NO];
        
    }
    return _pickView;
}
- (UIDatePicker*)timerPickView {
    if (!_timerPickView) {
        _timerPickView = [[UIDatePicker alloc] init];
        _timerPickView.frame = CGRectMake(0, 40, SCREEN_WIDTH, 160);
        _timerPickView.datePickerMode = UIDatePickerModeTime;
        _timerPickView.locale = [NSLocale localeWithLocaleIdentifier:@"zh_CN"];
        [_timerPickView addTarget:self action:@selector(timerPickView:) forControlEvents:UIControlEventValueChanged];
        
    }
    return _timerPickView;
}
- (NSArray*)typeArray {
    if (!_typeArray) {
        _typeArray=[[NSArray alloc]initWithObjects:@"接火车",@"接高铁",@"接飞机",@"送火车",@"送高铁",@"送飞机",nil];
    }
    return _typeArray;
}
- (UIPickerView*)linePickView {
    if (!_linePickView) {
        _linePickView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 40, SCREEN_WIDTH, 160)];
        _linePickView.tag=10086;
        _linePickView.delegate=self;
        _linePickView.dataSource=self;
        [_linePickView selectRow:3 inComponent:0 animated:NO];
        
    }
    return _linePickView;
}
- (NSMutableArray*)lineArr {
    if (!_lineArr) {
        _lineArr=[[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"1",@"2",@"3",@"4",nil];
    }
    return _lineArr;
}
- (NSMutableArray*)dateArr {
    if (!_dateArr) {
        _dateArr=[[NSMutableArray alloc]init];
    }
    return _dateArr;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
