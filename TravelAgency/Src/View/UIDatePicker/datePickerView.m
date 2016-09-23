//
//  datePickerView.m
//  paymentViewDemo
//
//  Created by edianzu on 16/9/20.
//  Copyright © 2016年 zhoujianfeng. All rights reserved.
//

#import "datePickerView.h"

@implementation datePickerView
- (void)awakeFromNib
{
    [super awakeFromNib];
    _datePickerView.datePickerMode = UIDatePickerModeDate;
    _datePickerView.locale = [NSLocale localeWithLocaleIdentifier:@"zh_CN"];
     [_datePickerView addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged ];
    
}
- (void)dateChanged:(UIDatePicker*)datePicker {
    NSDate *date = datePicker.date;
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    _dateStr=[formatter stringFromDate:date];

}
- (IBAction)cancleButon:(id)sender {
    if (_block) {
      _block(nil);
    }
}

- (IBAction)sureButtonClick:(id)sender {
    if (_block) {
    _block(_dateStr);
    }
}



@end
