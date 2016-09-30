//
//  TADetailLineMessageViewController.m
//  TravelAgency
//
//  Created by edianzu on 16/9/26.
//  Copyright © 2016年 Gavin. All rights reserved.
//

#import "TADetailLineMessageViewController.h"

@interface TADetailLineMessageViewController ()
{
    BOOL _isSelected;
    NSString *_dateStr;
    NSString *_currentDateStr;
}
@end

@implementation TADetailLineMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _viewModel=[[TAJiaoDanViewModel alloc]init];
    [self setupUI];
}
#pragma mark -- Setters And Getters
- (void)setupUI{
    _phoneNumberLab.text=_model.userName;
    NSDictionary *userDic=[TACommonTool userInfo];
    _phoneNumberTextField.text=[NSString stringWithFormat:@"%@",userDic[@"userPhone"]];
    _changePhoneButton.selected=NO;
    [_changePhoneButton setTitle:@"修改" forState:UIControlStateNormal];
    [_changePhoneButton setTitle:@"完成" forState:UIControlStateSelected];
    [_changePhoneButton addTarget:self action:@selector(changePhoneButtonClick) forControlEvents:UIControlEventTouchUpInside];
    NSDate *currentDate = [NSDate date];//获取当前时间，日期
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd"];
    _currentDateStr = [dateFormatter stringFromDate:currentDate];
    _dateStr=_currentDateStr;
    [_dateButton setTitle:_currentDateStr forState:UIControlStateNormal];
    [_dateButton addTarget:self action:@selector(dateButtonClick) forControlEvents:UIControlEventTouchUpInside];
    _submitButton.layer.cornerRadius=4.0f;
    _submitButton.layer.borderColor=COLOR_d1d1d1.CGColor;
    _submitButton.layer.borderWidth=1.0f;
    [_submitButton addTarget:self action:@selector(submitButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
}
#pragma mark -- Event Response
- (void)changePhoneButtonClick{
    _isSelected=!_isSelected;
    if (_isSelected) {
        _changePhoneButton.selected=YES;
        _phoneNumberTextField.enabled=YES;
    }else{
        _changePhoneButton.selected=NO;
        _phoneNumberTextField.enabled=NO;
    }
}
- (void)dateButtonClick{
     __weak TADetailLineMessageViewController *weakSelf = self;
    self.datePicker.block=^(NSString* dateStr){
        if (dateStr==nil) {
            _dateStr=_currentDateStr;
        }else{
            _dateStr=dateStr;
            [weakSelf.dateButton setTitle:dateStr forState:UIControlStateNormal];
        }
        [weakSelf.datePicker dismiss];
        
    };
    [_datePicker show];
}
- (void)submitButtonClick {

NSDictionary*parameters=@{@"remark":_model.remark,
                          @"routesld":_lineIdStr,
                          @"throwPhone":_phoneNumberTextField.text,
                          @"adult":_allTicketTextField.text,
                          @"throwDate":_dateStr,
                          @"throwName":_phoneNumberTextField.text,
                          @"children":_halfTextField.text,
                          @"unearned":_YSTextField.text,
                          @"tourismPhone":_model.tourismName,
                          @"free":_fireTicketTextField.text,
                          @"charged":_CSTextField.text};
    NSString*dictStr=[TACommonTool dictionaryToJson:parameters];
    NSDictionary*parameterDict=@{@"orders":dictStr};
    [_viewModel submitOrderMessageWithDictionary:parameterDict Success:^(NSString *resulstStr) {
        if ([resulstStr isEqualToString:@"0"]) {
           [TAAlertView showAlertWithTitle:@"温馨提示" contentView:nil message:@"交单提交成功" cancelTitle:@"我知道了" otherTitle:nil completion:^(BOOL cancelled) {
               [self.navigationController popViewControllerAnimated:YES];
           }];
        }else{
            [TAAlertView showAlertWithTitle:@"温馨提示" message:@"交单提交失败" cancelTitle:@"我知道了"];
        }
    } failure:^{
         [TAAlertView showAlertWithTitle:@"温馨提示" message:@"交单提交失败" cancelTitle:@"我知道了"];
    }];
}
#pragma mark -- SettersAndGetters
- (WJDatePickerView*)datePicker {
    if (!_datePicker) {
        _datePicker = [[WJDatePickerView alloc]init];
    }
    return _datePicker;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
