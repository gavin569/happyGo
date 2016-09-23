//
//  TAPickerView.h
//  paymentViewDemo
//
//  Created by edianzu on 16/9/21.
//  Copyright © 2016年 zhoujianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^StringBlock)(NSString* resultStr);
@interface TAPickerView : UIView<UIPickerViewDelegate,UIPickerViewDataSource>
@property (nonatomic, copy) StringBlock stringBlock;
@property (nonatomic, strong) NSString *resultStr;
- (IBAction)cancleButtonClick:(id)sender;
- (IBAction)sureButtonClick:(id)sender;
@property (weak, nonatomic) IBOutlet UIPickerView *showPickerView;
@property (nonatomic, strong) NSArray *arr;


@end
