//
//  TAPickerView.m
//  paymentViewDemo
//
//  Created by edianzu on 16/9/21.
//  Copyright © 2016年 zhoujianfeng. All rights reserved.
//

#import "TAPickerView.h"

@implementation TAPickerView
- (void)awakeFromNib
{
    [super awakeFromNib];
    _showPickerView.delegate=self;
    _showPickerView.dataSource=self;
}
#pragma mark --Picker Data Source Methed
- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}
- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.arr.count;
}

#pragma mark Picker Delegate Methods
- (NSString *) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
   
    return self.arr[row];
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
    
    _resultStr=_arr[row];
  
}
#pragma mark  -- Event Response
- (IBAction)cancleButtonClick:(id)sender {
    if (_stringBlock) {
        _stringBlock(nil);
    }
}

- (IBAction)sureButtonClick:(id)sender {
    if (_stringBlock) {
        _stringBlock(_resultStr);
    }
}
@end
