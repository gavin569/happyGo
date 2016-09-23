//
//  TABasePickerView.h
//  paymentViewDemo
//
//  Created by edianzu on 16/9/21.
//  Copyright © 2016年 zhoujianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TAPickerView.h"
typedef void(^StringBlock)(NSString* resultStr);
@interface TABasePickerView : UIView
@property (nonatomic, copy) StringBlock block;
@property (nonatomic, strong) NSString *resultStr;
@property (nonatomic, strong) TAPickerView *pickerView;
@property (nonatomic, strong) NSArray *arr;
- (void)show;
- (void)dismiss;
@end
