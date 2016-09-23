//
//  TAAddCarPriceViewController.m
//  TravelAgency
//
//  Created by edianzu on 16/9/14.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TAAddCarPriceViewController.h"
#import "TAALLRouteViewController.h"
#import "TAOwnerCarTypeModel.h"
@interface TAAddCarPriceViewController ()
{
    NSString *_lineNameStr;
}
@end

@implementation TAAddCarPriceViewController
#pragma mark -- view life cycle
- (void)viewWillLayoutSubviews {
    [_selectWriteLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bomView.mas_left).with.offset(11);
        make.top.equalTo(_bomView.mas_top).with.offset(5);
    }];
    [_selectWriteTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_bomView.mas_top).with.offset(2);
        make.left.equalTo(_selectWriteLab.mas_right).with.offset(5);
        make.right.equalTo(_bomView.mas_right).with.offset(-5);
        make.bottom.equalTo(_bomView.mas_bottom).with.offset(-2);
        
    }];
}
- (void)viewWillAppear:(BOOL)animated {
    [_viewModel requestAllCarTypesInOwnerSuccess:^(NSArray *resultArr) {
        [self.carTypeArr addObjectsFromArray:resultArr];
    } failure:^{
        
    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=COLOR_ffffff;
    self.navigationItem.title=@"添加车辆报价";
    _viewModel=[[TAOwnerViewModel alloc]init];
    [self customNavigationBarRightItemWithTitle:@"提交" action:@selector(rightButtonClick)];
    [self setupUI];
}
#pragma mark -- setup UI
- (void)setupUI {
    _bomView.backgroundColor=COLOR_ffffff;
    [_bomView addSubview:self.selectWriteLab];
    [_bomView addSubview:self.selectWriteTextView];
    [_selectLineButton setTitle:@"请选择路线" forState:UIControlStateNormal];
    [_selectLineButton addTarget:self action:@selector(selectLineButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [_selectCarButton setTitle:@"请选择车辆类型" forState:UIControlStateNormal];
    [_selectCarButton addTarget:self action:@selector(selectCarButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
}
#pragma mark --Picker Data Source Methed
- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}
- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.carTypeArr.count;
}

#pragma mark Picker Delegate Methods
- (NSString *) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    TAOwnerCarTypeModel *model=self.carTypeArr[row];
    return model.carType;
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
    TAOwnerCarTypeModel *model=self.carTypeArr[row];
    _lineNameStr=model.carType;
}
#pragma mark -- Event Response
- (void)rightButtonClick {
    
}
- (void)selectLineButtonClick {
    TAALLRouteViewController *allRouteViewController=[[TAALLRouteViewController alloc]init];
    [self.navigationController pushViewController:allRouteViewController animated:NO];
}
//选择车类型取消按钮
- (void)selectLeftButtonClick {
    [self.pickView removeFromSuperview];
    [self.maskView removeFromSuperview];
}
//选择车类型确定按钮
- (void)selectrightButtonClick {
    if (_lineNameStr==nil) {
        if (self.carTypeArr.count==0) {
        }else{
            TAOwnerCarTypeModel *model=self.carTypeArr[0];
            _lineNameStr=model.carType;
        }
    }else{
        
    }
    [_selectCarButton setTitle:_lineNameStr forState:UIControlStateNormal];
    [self.pickView removeFromSuperview];
    [self.maskView removeFromSuperview];
    
}
- (void)selectCarButtonClick {
    [self.view addSubview:self.maskView];
    [_bigBomView addSubview:self.pickView];
}
#pragma mark -- GettersAndSetters
- (UILabel*)selectWriteLab {
    if (!_selectWriteLab) {
        _selectWriteLab=[[UILabel alloc]init];
        _selectWriteLab.text=@"可选项:";
        _selectWriteLab.font=SYS_F(14);
        _selectWriteLab.textColor=COLOR_333333;
    }
    return _selectWriteLab;
}
- (UITextView*)selectWriteTextView {
    if (!_selectWriteTextView) {
        _selectWriteTextView=[[UITextView alloc]init];
        _selectWriteTextView.showsHorizontalScrollIndicator=NO;
        _selectWriteTextView.
        showsVerticalScrollIndicator=NO;
        _selectWriteTextView.textColor
        = [UIColor blackColor];//设置textview里面的字体颜色
        _selectWriteTextView.backgroundColor=COLOR_ffffff;
        _selectWriteTextView.font
        = [UIFont fontWithName:@"Arial"size:14.0];//设置字体名字和字体大小
        _selectWriteTextView.layer.borderWidth=1;
        _selectWriteTextView.layer.borderColor=[UIColor blueColor].CGColor;
        _selectWriteTextView.layer.cornerRadius=5;
        _selectWriteTextView.clipsToBounds=YES;
    }
    return _selectWriteTextView;
}
- (UIView*)maskView {
    if (!_maskView) {
        _maskView=[[UIView alloc]initWithFrame:self.view.frame];
        _maskView.backgroundColor=[UIColor colorWithWhite:0 alpha:0.7];
        _bigBomView=[[UIView alloc]init];
        _bigBomView.backgroundColor=COLOR_ffffff;
        [_maskView addSubview:_bigBomView];
        [_bigBomView mas_makeConstraints:^(MASConstraintMaker *make) {
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
        [_bigBomView addSubview:leftButton];
        [leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_bigBomView);
            make.top.equalTo(_bigBomView.mas_top).with.offset(5);
            make.width.equalTo(@80);
            make.height.equalTo(@30);
        }];
        UIButton *rightButton=[UIButton buttonWithType:UIButtonTypeCustom];
        [rightButton addTarget:self action:@selector(selectrightButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [rightButton setTitleColor:COLOR_333333 forState:UIControlStateNormal];
        [rightButton setTitle:@"确定" forState:UIControlStateNormal];
        rightButton.titleLabel.font=SYS_F(14);
        [_bigBomView addSubview:rightButton];
        [rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(_bigBomView);
            make.top.equalTo(_bigBomView.mas_top).with.offset(5);
            make.width.equalTo(@80);
            make.height.equalTo(@30);
        }];
    }
    return _maskView;
}
- (UIPickerView*)pickView {
    if (!_pickView) {
        _pickView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 40, SCREEN_WIDTH, 160)];
        _pickView.delegate=self;
        _pickView.dataSource=self;
        [_pickView selectRow:1 inComponent:0 animated:NO];
        
    }
    return _pickView;
}
- (NSMutableArray*)carTypeArr {
    if (!_carTypeArr) {
        _carTypeArr=[[NSMutableArray alloc]init];
    }
    return _carTypeArr;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
