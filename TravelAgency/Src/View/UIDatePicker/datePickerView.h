//
//  datePickerView.h
//  paymentViewDemo
//
//  Created by edianzu on 16/9/20.
//  Copyright © 2016年 zhoujianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^block)(NSString* dateStr);
@interface datePickerView : UIView
@property (nonatomic, copy) block block;
@property (nonatomic, strong) NSString *dateStr;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePickerView;

- (IBAction)cancleButon:(id)sender;
- (IBAction)sureButtonClick:(id)sender;

@end
