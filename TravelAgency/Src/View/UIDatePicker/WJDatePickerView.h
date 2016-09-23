//
//  WJDatePickerView.h
//  paymentViewDemo
//
//  Created by edianzu on 16/9/20.
//  Copyright © 2016年 zhoujianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "datePickerView.h"
typedef void(^block)(NSString* dateStr);
@interface WJDatePickerView : UIView
@property (nonatomic, copy) block block;
@property (nonatomic, strong) NSString *dateStr;
@property (nonatomic, strong) datePickerView *datePickerView;
- (void)show;
- (void)dismiss;
@end
